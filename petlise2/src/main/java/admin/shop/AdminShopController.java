package admin.shop;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Controller
public class AdminShopController {
	@Autowired
	ProductService service;
	
	//상품목록페이지
	@GetMapping("/adminshoplist")
	public ModelAndView adminproductlist(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			if (!session.getAttribute("role").equals("admin")) {
				throw new Exception();
			} else {
				PagingResponse<ProductDTO> productlist = service.getAllProductPaging(searchdto);
				
				mv.addObject("response", productlist);
				mv.setViewName("admin/shopManagement");
				return mv;
			}
		} catch(Exception e) {
			request.setAttribute("msg", "접근 불가한 페이지입니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
			return mv;
		}
	}

	//상품목록페이지(Post)
	@PostMapping("/adminshoplist")
	public ModelAndView adminproductlistpost(@ModelAttribute SearchDTO searchdto) {
		PagingResponse<ProductDTO> productlist = service.getAllProductPaging(searchdto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("response", productlist);
		mv.setViewName("admin/shopManagement");
		return mv;
	}
	
	//상품등록페이지
	@PostMapping("/shopproductregister")
	public String shopproductregister() {
		return "admin/shopProductRegister";
	}
	
	//상품수정페이지
	@PostMapping("/shopproductedit")
	public ModelAndView shopproductedit(String product_id) {
		ProductDTO product = service.getProductById(product_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("product", product);
		mv.setViewName("admin/shopProductEdit");
		return mv;
	}

	//상품디테일페이지(Read)
	@PostMapping("/shopproductread")
	public ModelAndView shopproductread(String product_id, String page) {
		ProductDTO product = service.getProductById(product_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("currentpage", Integer.parseInt(page));
		mv.addObject("product", product);
		mv.setViewName("admin/shopProductRead");
		return mv;
	}

	
	//상품수정 - ajax
	@PostMapping("/editproduct")
	@ResponseBody
	public String editproduct(ProductDTO dto) {
		int result = service.updateProduct(dto);
		return "{\"result\":\""+result+"\"}";
	}

	//상품삭제 - ajax
	@PostMapping("/deleteproduct")
	@ResponseBody
	public String deleteProduct(String product_id) {
		int result = service.deleteProduct(product_id);
		return "{\"result\":\""+result+"\"}";
	}
	
	//상품등록 - ajax
	@PostMapping("/productsave")
	@ResponseBody
	public String productSave(ProductDTO dto) {
		/*
		 * product_id / pet_type / category / product_code / reg_date / product_name /
		 * price / quatity / image_main / image_detail
		 */

		//상품코드만들기
		String productCode = "";
		if(dto.getPet_type().equals("강아지")) {
			productCode += "D";
		}else {
			productCode += "C";
		}

		if(dto.getCategory().equals("사료")) {
			productCode += "01_";
		}else if(dto.getCategory().equals("간식")) {
			productCode += "02_";
		}else if(dto.getCategory().equals("영양제")) {
			productCode += "03_";
		}else if(dto.getCategory().equals("장난감")) {
			productCode += "04_";
		}

		int product_nextnum = 0;
		if(service.countTotalProductNum()!=0) {
			product_nextnum = service.maxProductNum()+1;
		}else {
			product_nextnum = 1;
		}

		productCode += String.format("%03d", product_nextnum);

		dto.setProduct_code(productCode);
		
		service.insertProduct(dto);
		int page = service.countTotalProductNum()%10==0?service.countTotalProductNum()/10:service.countTotalProductNum()/10+1;
		return "{\"page\":\""+page+"\"}";
	}
	
	
	
}
