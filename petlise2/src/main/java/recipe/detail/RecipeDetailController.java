package recipe.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import recipe.RecipeDTO;
import user.UserDTO;

@Controller
public class RecipeDetailController {

	@Autowired
	RecipeDetailService service;
	
	@GetMapping("/recipedetail")
	public ModelAndView recipeDetail(HttpSession session, String recipe_id) {
		service.incrementViewCount(recipe_id);
		service.commentCnt(recipe_id);
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id == null) {
			user_id = "guest";
		} else {
			user_id = user_id.toString();
		}
		
		ModelAndView mv = new ModelAndView();
		UserDTO userInfo = service.getUserInfoRecipe(user_id);
		UserDTO userProfile = service.getUserProfile(recipe_id);
		RecipeDTO recipeDetail = service.getRecipeDetail(recipe_id);
		List<RecipeCommentDTO> recipeComment = service.getRecipeComment(recipe_id);
		
		mv.addObject("userInfo", userInfo);
		mv.addObject("recipeDetail", recipeDetail);
		mv.addObject("recipeComment", recipeComment);
		mv.addObject("userProfile", userProfile);
		mv.setViewName("/recipe/recipeDetail");
		return mv;
	}
	
	@PostMapping("/writerecipecomment")
	@ResponseBody
	public String writeRecipeComment(@RequestBody RecipeCommentDTO dto, String recipe_id) {
		int result = service.writeRecipeComment(dto);
		return "{\"result\":\"" + result + "\"}";
	}
	
	@PostMapping("/deletemyrecipe")
	@ResponseBody
	public String deleteMyRecipe(@RequestParam("recipe_id") String recipe_id,
								 @RequestParam("user_id") String user_id) {
		int result = service.deleteMyRecipe(recipe_id, user_id);
		return "{\"result\":\"" + result + "\"}";
	}
	
	@PostMapping("/deleterecipecomment")
	@ResponseBody
	public String deleteRecipeComment(@RequestParam("comment_id") String comment_id,
									  @RequestParam("user_id") String user_id) {
	int result = service.deleteRecipeComment(comment_id, user_id);
	return "{\"result\":\"" + result + "\"}";
	}
	
	@PostMapping("/editcomment")
	@ResponseBody
	public String editComment(@RequestBody RecipeCommentDTO dto) {
		int result = service.editComment(dto);
		return "{\"result\":\"" + result + "\"}";
	}
	
	@PostMapping("/checklike")
	@ResponseBody
	public Map<String, Boolean> checkLike(@RequestBody RecipeLikeDTO dto) {
	    Map<String, Boolean> response = new HashMap<>();	    
	    boolean exists = service.checkLike(dto);
	    response.put("exists", exists);
	    return response;
	}
	
	@PostMapping("/liked")
	@ResponseBody
	public Map<String, Boolean> liked(@RequestBody RecipeLikeDTO dto){
		Map<String, Boolean> response2 = new HashMap<>();
		boolean liked = service.liked(dto);
		response2.put("liked", liked);
		return response2;
	}
	
	@PostMapping("/likecount")
	@ResponseBody
	public String likeCount(@RequestBody RecipeLikeDTO dto) {
	    UUID uuid = UUID.randomUUID();
	    dto.setLike_id(uuid.toString());
	    
		int result = service.likeCount(dto);
		return "{\"result\":\"" + result + "\"}";		
	}
	
	@PostMapping("/updatelike")
	@ResponseBody
	public String updateLike(@RequestBody RecipeLikeDTO dto) {
		int result = service.updateLike(dto);
		return "{\"result\":\"" + result + "\"}";
	}
	
	@PostMapping("/recipelike")
	@ResponseBody
	public String recipeLike(@RequestBody RecipeDTO dto) {
		int result = service.recipeLike(dto);
		return "{\"result\":\"" + result + "\"}";
	}
}
