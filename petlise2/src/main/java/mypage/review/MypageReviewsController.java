package mypage.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.order.OrderDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import mypage.board.MyQnADTO;
import pagination.PagingResponse;
import pagination.SearchDTO;
import shop.detail.ProductReviewDTO;

@Controller
public class MypageReviewsController {
	@Autowired
	MyOrderProductService service;

	@GetMapping("/mypage/review")
	public ModelAndView myreview(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			searchdto.setRecordSize(5);
			String userId = (String)session.getAttribute("user_id");
			searchdto.setSearchType1(userId);
			
			PagingResponse<MyOrderProductDTO> list = service.getMyOrderDetail(searchdto);
			
			mv.addObject("response", list);
			mv.setViewName("/mypage/myReview");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@GetMapping("/editreview")
	public ModelAndView editreview(String di, String pi, String pn, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			String user_id = (String)session.getAttribute("user_id");
			ProductReviewDTO reviewdto = service.getProductReview(di, user_id);
			if(reviewdto != null) {
				reviewdto.setContents(reviewdto.getContents().replace("<br>", "&#10;"));
			}
			
			mv.addObject("product_name", pn);
			mv.addObject("reviewdto", reviewdto);
			mv.setViewName("/mypage/editReview");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@PostMapping("/insertreview")
	@ResponseBody
	public String insertreview(ProductReviewDTO dto, String point) {
		service.updateIsReviewTrue(dto.getOrder_detail_id());
		HashMap<String, String> map = new HashMap<>();
		map.put("point", point);
		map.put("user_id", dto.getUser_id());
		service.updatePointUp(map);
		int result = service.insertReview(dto);
		return "{\"result\":\""+result+"\"}";
	}
	
	@PostMapping("/updatereview")
	@ResponseBody
	public String updatereview(ProductReviewDTO dto) {
		int result = service.updateReview(dto);
		return "{\"result\":\""+result+"\"}";
	}

	@PostMapping("/updatedeletedat")
	@ResponseBody
	public String updatedeletedat(String review_id) {
		int result = service.updateDeleteAtReview(review_id);
		return "{\"result\":\""+result+"\"}";
	}
	
}
