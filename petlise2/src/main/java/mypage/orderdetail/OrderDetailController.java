package mypage.orderdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import shop.payment.ShopOrderInfoDTO;
import shop.payment.ShopOrderProductDTO;
import user.UserDTO;

@Controller
public class OrderDetailController {
	
	@Autowired
	OrderDetailService service;
	
	@GetMapping("/orderdetail")
	public ModelAndView orderDetail(@RequestParam("order_id") String order_id, @RequestParam("user_id") String user_id, 
										HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			List<ShopOrderProductDTO> myOrderProduct = service.myOrderProduct(order_id);
			UserDTO myUserInfo = service.myUserInfo(user_id);
			ShopOrderInfoDTO myDeliveryInfo = service.myDeliveryInfo(order_id);
			
			mv.addObject("myOrderProduct", myOrderProduct);
			mv.addObject("myUserInfo", myUserInfo);
			mv.addObject("myDeliveryInfo", myDeliveryInfo);
			mv.setViewName("/mypage/orderDetail");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@PostMapping("/cancelorderdetail")
	@ResponseBody
	public String cancelOrder(@RequestParam("order_id") String order_id) {
	    int result = service.cancelOrderDetail(order_id);
	    return "{\"result\":\"" + result + "\"}";
	}

}

