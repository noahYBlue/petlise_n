package shop.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class OrderEndController {

	@Autowired
	OrderEndService service;
	
	@GetMapping("/orderend")
	public ModelAndView orderEnd(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			String user_id = session.getAttribute("user_id").toString();
			
			List<ShopOrderInfoDTO> orderInfo = service.getOrderInfo(user_id);
			mv.addObject("orderInfo", orderInfo);
			mv.setViewName("/shop/orderEnd");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
}
