package admin.recipe;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface AdminRecipeService {
	public void insertRecipe(AdminRecipeRequestDTO dto);
	public List<AdminRecipeResponseDTO> findAllRecipe(AdminFindAllRecipeRequestDTO dto);
	public void updateRecipeOfTheMonth(String recipe_id, boolean recipe_of_the_month);
	public void deleteRecipe(String recipe_id);
	public AdminRecipeRequestDTO findRecipe (String recipe_id);
	public void updateRecipe(AdminEditRecipeRequestDTO dto);
}
