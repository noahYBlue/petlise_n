package recipe.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.RecipeDTO;
import user.UserDTO;

@Service
public class RecipeDetailService {
	
	@Autowired
	RecipeDetailDAO dao;
	
	public RecipeDTO getRecipeDetail(String recipe_id){
		return dao.getRecipeDetail(recipe_id);
	}
	public List<RecipeCommentDTO> getRecipeComment(String recipe_id){
		return dao.getRecipeComment(recipe_id);
	}
	public int writeRecipeComment(RecipeCommentDTO dto) {
		return dao.writeRecipeComment(dto);
	}
	public int editComment(RecipeCommentDTO dto) {
		return dao.editComment(dto);
	}
	public int deleteMyRecipe(String recipe_id, String user_id) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("recipe_id", recipe_id);
		parameters.put("user_id", user_id);
		return dao.deleteMyRecipe(parameters);
	}
	public UserDTO getUserInfoRecipe(String user_id){
		return dao.getUserInfoRecipe(user_id);
	}
	public boolean checkLike(RecipeLikeDTO dto) {
		return dao.checkLike(dto);
	}
	public boolean liked(RecipeLikeDTO dto) {
		return dao.liked(dto);
	}
	public int likeCount(RecipeLikeDTO dto) {
		return dao.likeCount(dto);
	}
	public int updateLike(RecipeLikeDTO dto) {
		return dao.updateLike(dto);
	}
	public int recipeLike(RecipeDTO dto) {
		return dao.recipeLike(dto);
	}
	public UserDTO getUserProfile(String recipe_id) {
		return dao.getUserProfile(recipe_id);
	}
	public int deleteRecipeComment(String comment_id, String user_id) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("comment_id", comment_id);
		parameters.put("user_id", user_id);
		return dao.deleteRecipeComment(parameters);
	}
	public void incrementViewCount(String recipe_id) {
		dao.incrementViewCount(recipe_id);
	}
	public void commentCnt(String recipe_id) {
		dao.commentCnt(recipe_id);
	}
}
