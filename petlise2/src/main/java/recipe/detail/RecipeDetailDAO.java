package recipe.detail;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import recipe.RecipeDTO;
import user.UserDTO;

@Mapper
@Repository
public interface RecipeDetailDAO {

	RecipeDTO getRecipeDetail(String recipe_id);
	List<RecipeCommentDTO> getRecipeComment(String recipe_id);
	int writeRecipeComment(RecipeCommentDTO dto);
	int editComment(RecipeCommentDTO dto);
	UserDTO getUserInfoRecipe(String user_id);
	boolean checkLike(RecipeLikeDTO dto);
	boolean liked(RecipeLikeDTO dto);
	int likeCount(RecipeLikeDTO dto); 
	int updateLike(RecipeLikeDTO dto);
	int recipeLike(RecipeDTO dto);
	UserDTO getUserProfile(String recipe_id);
	int deleteMyRecipe(Map<String, Object> parameters);
	int deleteRecipeComment(Map<String, Object> parameters);
	void incrementViewCount(String recipe_id);
	void commentCnt(String recipe_id);
}
