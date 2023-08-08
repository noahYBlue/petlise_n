package home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recipe.RecipeDTO;
import recipe.list.RecipeListDTO;

@Service
public class HomeService {
	@Autowired
	HomeDAO dao;
	
	List<RecipeListDTO> getBestExpertRecipes(){
		return dao.getBestExpertRecipes();
	};
	List<RecipeListDTO> getBestMyRecipes(){
		return dao.getBestMyRecipes();
	};
	
	List<HomeProductDTO> getBestProducts(){
		List<HomeProductDTO> list = dao.getBestProducts();
		for( HomeProductDTO dto : list) {
			dto.setReview_avg(dao.getReviewAvgs(String.valueOf(dto.getProduct_id())));
		}
		return list;
	};
}
