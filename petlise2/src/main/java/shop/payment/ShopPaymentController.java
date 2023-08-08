package shop.payment;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.shop.ProductDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import user.UserDTO;

@Controller
public class ShopPaymentController {

	@Autowired
	ShopPaymentService service;

	@GetMapping("/payment")
	public ModelAndView payment(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			ProductDTO ProductDTO = new ProductDTO();
			String user_id = session.getAttribute("user_id").toString();
			
			List<ShopOrderProductDTO> orderProduct = service.getOrderList(user_id);
			UserDTO userInfo = service.getUserInfo(user_id);
			List<ProductDTO> products = service.getProducts(ProductDTO);
			
			mv.addObject("userInfo", userInfo);
			mv.addObject("orderProduct", orderProduct);
			mv.addObject("products", products);
			mv.setViewName("/shop/payment");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}

	@PostMapping("/saveorderinfo")
	@ResponseBody
	public String saveOrderInfo(ShopOrderInfoDTO dto) {
	    // 주문번호 생성
	    String order_id = UUID.randomUUID().toString();
	    // 주문번호를 DTO에 설정
	    dto.setOrder_id(order_id);
		
		int result = service.saveOrderInfo(dto);
		return "{\"order_id\":\"" + order_id + "\", \"result\":\"" + result + "\"}";
	}

	@PostMapping("/orderconfirm")
	@ResponseBody
	public String orderConfirm(String user_id) {
		int result = service.orderConfirm(user_id);
		return "{\"result\":\"" + result + "\"}";
	}

	@RequestMapping("/deletecart")
	public @ResponseBody String deleteCart(String user_id) {
		service.deleteCart(user_id);
		return "";
	}

	@PostMapping("/updatesales")
	@ResponseBody
	public String updateSales(@RequestParam("product_ids") List<Integer> productIds, @RequestParam("product_sales") List<Integer> productSales) {
		int result = 0;
		HashMap<String, Integer> map = null;
		for (int i=0; i<productIds.size(); i++) {
			map = new HashMap<>();
			map.put("product_id", productIds.get(i));
			map.put("sales", productSales.get(i));
			result += service.updateSales(map);
		}
		return "{\"result\":\"" + result + "\"}";
	}
	
	@PostMapping("/updatepointpayment")
	@ResponseBody
	public String updatePointPayment(String user_id, String point) {
		HashMap<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("point", point);
		int result = service.updatePointPayment(map);
		return "{\"result\":\"" + result + "\"}";
	}
}
