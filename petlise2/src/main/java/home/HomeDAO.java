package home;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import recipe.RecipeDTO;
import recipe.list.RecipeListDTO;

@Mapper
@Repository
public interface HomeDAO {
	List<RecipeListDTO> getBestExpertRecipes();
	List<RecipeListDTO> getBestMyRecipes();
	List<HomeProductDTO> getBestProducts();
	Double getReviewAvgs(String product_id);
}
