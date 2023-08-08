package shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.shop.*;
import jakarta.servlet.http.HttpSession;
import pagination.*;
import shop.cart.ShopCartDTO;

@Controller
public class ShopListController {
	@Autowired
	ProductService service;

	@GetMapping("/shop")
	public ModelAndView shop(@ModelAttribute SearchDTO searchdto, HttpSession session) {
		searchdto.setRecordSize(20);
		PagingResponse<ProductDTO> productlist = service.getAllProductPaging(searchdto);
		
		//임의 세션처리 (로그인)
		/* session.setAttribute("user_id", "9a86c657-232b-11ee-b6f4-00ff2f3d08fa"); */
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("response", productlist);
		mv.setViewName("shop/shopList");
		return mv;
	}
	
}
