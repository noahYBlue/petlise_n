package shop.detail;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.shop.ProductDTO;
import admin.shop.ProductService;
import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;
import shop.cart.ShopCartDTO;


@Controller
public class ShopDetailController {
	@Autowired
	ProductService service;
	@Autowired
	ProductReviewService reviewService;

	@GetMapping("/shopdetail")
	public ModelAndView shopdetail(String product_id, @ModelAttribute SearchDTO searchdto, HttpSession session) {
		ProductDTO product = service.getProductById(product_id);
		
		//전체후기리스트
		searchdto.setSearchType1(product_id);
		searchdto.setRecordSize(5);
		PagingResponse<ProductReviewDTO> reviewlist = reviewService.getProductReviewsPaging(searchdto);
		
		//전체리뷰개수
		int totalCnt = reviewService.getCountAllReviews(product_id);
		int totalPhotoCnt = reviewService.getCountAllPhotoReviews(product_id);
		
		//전체평점평균
		double totalAvg = 0;
		if(reviewService.getAvgReviews(product_id) != null) {
			totalAvg = reviewService.getAvgReviews(product_id);
		}
		
		//점수별개수
		int scores [] = new int[5];
		for(int i=0 ; i<5; i++) {
			scores[i] = reviewService.getCountReviewsScore(product_id, i+1);
		}
		
		//후기 좋아요 여부
		String user_id = (String) session.getAttribute("user_id");
		for(ProductReviewDTO reviewdto : reviewlist.getList()) {
			if(reviewService.isLikeReview(user_id, reviewdto.getReview_id())>0) {
				reviewdto.setIslike(true);
			}else {
				reviewdto.setIslike(false);
			}
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", product);
		mv.addObject("response", reviewlist);
		mv.addObject("searchdto", searchdto);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("totalPhotoCnt", totalPhotoCnt);
		mv.addObject("totalAvg", totalAvg);
		mv.addObject("scores", scores);
		mv.setViewName("shop/shopDetail");
		return mv;
	}
	
	@PostMapping("/isincart")
	@ResponseBody
	public String isincart(ShopCartDTO cartdto) {
		int cartcnt = service.isinCart(cartdto);
		
		String result ="";
		if(cartcnt <= 0) { result = "no";}
		else { result = "yes";}
		
		return "{\"result\":\""+result+"\"}";
	}
	
	@PostMapping("/insertcart")
	@ResponseBody
	public String insertcart(String user_id, String product_id, int quantity) {
		//상품정보조회
		ProductDTO product = service.getProductById(product_id);
		
		//ShopCart정보 담기
		ShopCartDTO cartdto = new ShopCartDTO();
		cartdto.setUser_id(user_id);
		cartdto.setProduct_id(product.getProduct_id());
		cartdto.setProduct_image(product.getImage_main());
		cartdto.setProduct_name(product.getProduct_name());
		cartdto.setQuantity(quantity);
		cartdto.setProduct_price(product.getPrice());
		cartdto.setPrice_total(quantity*product.getPrice());
		
		int result = service.insertCart(cartdto);
		return "{\"result\":\""+result+"\"}";
	}

	@PostMapping("/insertorderproduct")
	@ResponseBody
	public String insertOrderProduct(String user_id, String product_id, int quantity) {
		//상품정보조회
		ProductDTO product = service.getProductById(product_id);
		
		//ShopCart정보 담기
		ShopOrderProductDTO orderproductdto = new ShopOrderProductDTO();
		orderproductdto.setUser_id(user_id);
		orderproductdto.setProduct_id(product.getProduct_id());
		orderproductdto.setProduct_image(product.getImage_main());
		orderproductdto.setProduct_name(product.getProduct_name());
		orderproductdto.setQuantity(quantity);
		orderproductdto.setProduct_price(product.getPrice());
		orderproductdto.setPrice_total(quantity*product.getPrice());
		
		int result = service.insertOrderProduct(orderproductdto);
		return "{\"result\":\""+result+"\"}";
	}
	
	@PostMapping("/deletereview")
	@ResponseBody
	public String deletereview(String review_id) {
		int result = reviewService.deleteReview(review_id);
		return "{\"result\":\""+result+"\"}";
	}
	
	@PostMapping("/likeup")
	@ResponseBody
	public String likeup(String user_id, String review_id) {
		int result = reviewService.likeUp(user_id, review_id);
		return "{\"result\":\""+result+"\"}";
	}

	@PostMapping("/likedown")
	@ResponseBody
	public String likedown(String user_id, String review_id) {
		int result = reviewService.likeDown(user_id, review_id);
		return "{\"result\":\""+result+"\"}";
	}
}
