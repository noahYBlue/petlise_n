package recipe.list;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Controller
public class RecipeListController {
    @Autowired
    RecipeListService service;
  

    @GetMapping("/recipelist")
    public ModelAndView recipelist(String recipe_id, @ModelAttribute SearchDTO searchdto, HttpSession session) {
        searchdto.setRecordSize(12);
        PagingResponse<RecipeListDTO> recipelist = service.getAllRecipePaging(searchdto, true);

        String userId = (String) session.getAttribute("user_id");
        for (RecipeListDTO recipe : recipelist.getList()) {
            String originalContent = recipe.getRecipe_contents();
            String strippedContent = originalContent.replaceAll("\\<[^>]*>", ""); // 정규식으로 태그 제거

            int maxLength = 55;
            if (strippedContent.length() > maxLength) {
                recipe.setLimitedContent(strippedContent.substring(0, maxLength) + "...");
            } else {
                recipe.setLimitedContent(strippedContent);
            }

            recipe.setIs_like(service.recipeService.isRecipeLiked(userId, recipe.getRecipe_id()));
  
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("response", recipelist);
        mv.setViewName("recipe/myRecipeList");

        return mv;
    }


    
    
    

    @GetMapping("/recipelistbest")
    public ModelAndView recipeListBest(String recipe_id, @ModelAttribute SearchDTO searchdto, HttpSession session) {
        searchdto.setRecordSize(12);

        PagingResponse<RecipeListDTO> recipeListBest = service.getRecipeOfTheMonth(searchdto);

        // 본문 길이 제한 처리
        for (RecipeListDTO recipe : recipeListBest.getList()) {
            String originalContent = recipe.getRecipe_contents();
            String strippedContent = originalContent.replaceAll("<[^>]*>", ""); // 정규식으로 태그 제거

            int maxLength = 55;
            if (strippedContent.length() > maxLength) {
                recipe.setLimitedContent(strippedContent.substring(0, maxLength) + "...");
            } else {
                recipe.setLimitedContent(strippedContent);
            }
        }

        String userId = (String) session.getAttribute("user_id");
        for (RecipeListDTO recipe : recipeListBest.getList()) {
            recipe.setIs_like(service.recipeService.isRecipeLiked(userId, recipe.getRecipe_id()));
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("response", recipeListBest);
        mv.setViewName("recipe/recipeListBest");
        return mv;
    }



}
