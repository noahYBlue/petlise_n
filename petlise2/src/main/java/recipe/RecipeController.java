package recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class RecipeController {
    private final RecipeService recipeService;

    @Autowired
    public RecipeController(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

    @GetMapping("/recipecreate")
    public String showRecipeCreateForm() {
        return "recipe/recipeCreate";
    }
  

    @PostMapping("/recipecreate")
    public String createRecipe(RecipeDTO recipeDTO, HttpSession session) {
        String user_id = (String) session.getAttribute("user_id");
        recipeDTO.setRecipe_id(recipeDTO.getRecipe_id());
        recipeService.insertRecipe(recipeDTO, user_id); // user_id 값을 전달
        return "recipe/recipeCreate";
    }

    // 세션
    @RequestMapping("/recipecreate")
    public String recipeCreate(HttpSession session, RecipeDTO dto) {
        // 로그인 여부 확인

        if (session.getAttribute("user_id") != null && dto.getRecipe_title() != null) {
            String user_id = session.getAttribute("user_id").toString();
            dto.setUser_id(user_id);
        }
        return "recipe/recipeCreate";
    }

    @PostMapping("/recipe/likeup")
    @ResponseBody
    public String likeup(String user_id, String recipe_id) {
        int result = recipeService.likeUp(user_id, recipe_id);
        return "{\"result\":\"" + result + "\"}";
    }

    @PostMapping("/recipe/likedown")
    @ResponseBody
    public String likedown(String user_id, String recipe_id) {
        int result = recipeService.likeDown(user_id, recipe_id);
        return "{\"result\":\"" + result + "\"}";
    }

}
