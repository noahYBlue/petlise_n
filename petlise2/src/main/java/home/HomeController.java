package home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import recipe.RecipeDTO;
import recipe.list.RecipeListDTO;

@Controller
public class HomeController {
	@Autowired
	HomeService service;
	
	@RequestMapping("/")
	public ModelAndView home() {
		List<RecipeListDTO> expertRecipes = service.getBestExpertRecipes();
		List<RecipeListDTO> myRecipes = service.getBestMyRecipes();
		List<HomeProductDTO> products = service.getBestProducts();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("expertRecipes", expertRecipes);
		mv.addObject("myRecipes", myRecipes);
		mv.addObject("products", products);
		mv.setViewName("home");
		return mv;
	}
	
}
