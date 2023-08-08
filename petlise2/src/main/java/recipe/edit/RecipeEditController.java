package recipe.edit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import recipe.RecipeDTO;

@Controller
public class RecipeEditController {
	
	@Autowired
	RecipeEditService service;
	
	@GetMapping("/recipeedit")
	public ModelAndView getRecipeEdit(HttpSession session, String recipe_id) {
	    String user_id = (String) session.getAttribute("user_id");
	    ModelAndView mv = new ModelAndView();
	    RecipeDTO recipeEdit = service.getRecipeEdit(recipe_id);
	    mv.addObject("recipeEdit", recipeEdit);
	    mv.addObject("user_id", user_id); // 세션에서 가져온 user_id 추가 
	    mv.setViewName("recipe/recipeEdit"); 
	    return mv;
	}

	
	@PostMapping("/recipeupdate")
	@ResponseBody
	public String recipeUpdate(RecipeDTO dto) {
		int result = service.updateLastRecipe(dto);
	    return "{\"result\":\"success\":\"" + result +"\"}";
	}
}
