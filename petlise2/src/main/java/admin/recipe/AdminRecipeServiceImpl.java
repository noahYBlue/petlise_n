package admin.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminRecipeServiceImpl implements AdminRecipeService {
	@Autowired
	AdminRecipeDAO dao;

	public void insertRecipe(AdminRecipeRequestDTO dto) {
		dao.insertRecipe(dto);
	}

	public List<AdminRecipeResponseDTO> findAllRecipe(AdminFindAllRecipeRequestDTO dto) {
		return dao.findAllRecipe(dto);
	}
	
	public void updateRecipeOfTheMonth(String recipe_id, boolean recipe_of_the_month) {
		dao.updateRecipeOfTheMonth(recipe_id, recipe_of_the_month);
	}
	
	public void deleteRecipe(String recipe_id) {
		dao.deleteRecipe(recipe_id);
	}
	public AdminRecipeRequestDTO findRecipe (String recipe_id) {
		return dao.findRecipe(recipe_id);
	}
	public void updateRecipe(AdminEditRecipeRequestDTO dto) {
		dao.updateRecipe(dto);
	}
}
