package mypage.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import user.BCryptService;

@Controller
public class MypageController {

	@Value("${spring.bcrypt.number}")
	private int bcryptNum;

	@Autowired
	@Qualifier("mypageServiceImpl")
	MypageService service;

	@GetMapping("/mypage")
	public ModelAndView userInfo(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("user_id") != null) {
			String user_id = session.getAttribute("user_id").toString();
			MypageDTO my_info = service.userInfo(user_id);
			
			int orderCount = service.orderCount(user_id);
			int productCommentsCount = service.productCommentsCount(user_id);
			int qnaCount = service.qnaCount(user_id);
			int recipeCount = service.recipeCount(user_id);
			int recipeCommentsCount = service.recipeCommentsCount(user_id);
			int boardCount = service.boardCount(user_id);
			int boardCommentsCounts = service.boardCommentsCounts(user_id);
			
			MyTotalInfoDTO myTotalInfo = new MyTotalInfoDTO();
			
			myTotalInfo.setOrderCount(orderCount);
			
			myTotalInfo.setProductCommentsCount(productCommentsCount);
			myTotalInfo.setQnaCount(qnaCount);
			myTotalInfo.setRecipeCount(recipeCount);
			myTotalInfo.setRecipeCommentsCount(recipeCommentsCount);
			myTotalInfo.setBoardCount(boardCount);
			myTotalInfo.setBoardCommentsCounts(boardCommentsCounts);

			mv.addObject("my_info", my_info);
			mv.addObject("my_total_info", myTotalInfo);
			mv.setViewName("mypage/myInfo");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}

		return mv;
	}

	@RequestMapping("/mypage/edit")
	public ModelAndView editUser(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("user_id") != null) {
			String user_id = session.getAttribute("user_id").toString();
			MypageDTO my_info = service.userInfo(user_id);

			mv.addObject("my_info", my_info);
			mv.setViewName("mypage/editMyInfo");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}

		return mv;
	}

	@Autowired
	private BCryptService bCryptService;

	@ResponseBody
	@PostMapping("/updateuser")
	public String updateUser(HttpSession session, String name, String password, String new_password, String address,
			String profile_image, String pet_type, String pet_name, String pet_age) {
		
		if (session.getAttribute("user_id") != null) {
			String user_id = session.getAttribute("user_id").toString();
			String checkPw = service.checkPw(user_id);

			if (bCryptService.matchesBcrypt(password, checkPw, bcryptNum)) {
				service.updateUser(name, address, profile_image, pet_type, pet_name, pet_age, user_id);
				
				if (!new_password.equals("")) {
					String hashPassword = bCryptService.encodeBcrypt(new_password, bcryptNum);
					
					service.updatePw(hashPassword, user_id);
				}
			} else {
				return "{\"response\" :  \"비밀번호가 틀렸습니다.\"}";
			}
		}
		
		return "{\"response\" :  \"수정이 완료되었습니다.\"}";
	}

	@RequestMapping("/deleteuser")
	public ResponseEntity<Void> deleteUser(HttpSession session, Date today) {

		if (session.getAttribute("user_id") != null) {
			String user_id = session.getAttribute("user_id").toString();
			service.updateDelete(today, user_id);

			session.removeAttribute("user_id");
		}
		return new ResponseEntity(HttpStatus.OK);
	}
}