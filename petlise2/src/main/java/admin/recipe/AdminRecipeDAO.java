package admin.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AdminRecipeDAO {
	public void insertRecipe(AdminRecipeRequestDTO dto);
	public List<AdminRecipeResponseDTO> findAllRecipe(AdminFindAllRecipeRequestDTO dto);
	public void updateRecipeOfTheMonth(String recipe_id, boolean recipe_of_the_month);
	public void deleteRecipe(String recipe_id);
	public AdminRecipeRequestDTO findRecipe (String recipe_id);
	public void updateRecipe(AdminEditRecipeRequestDTO dto);
}
