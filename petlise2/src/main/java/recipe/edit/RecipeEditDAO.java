package recipe.edit;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import recipe.RecipeDTO;

@Mapper
@Repository
public interface RecipeEditDAO {
	RecipeDTO getRecipeEdit(String recipe_id);
	int updateLastRecipe(RecipeDTO dto);
}
