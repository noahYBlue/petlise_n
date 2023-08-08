package admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

	@Autowired
	@Qualifier("adminUserServiceImpl")
	AdminUserService service;

	@RequestMapping
	public String getAdminHome(Model model, HttpSession session, HttpServletRequest request) {
		try {
			if (!session.getAttribute("role").equals("admin")) {
				throw new Exception();
			} else {
				int todayRecipeCount = service.findTodayRecipe();
				int todayOrderCount = service.findTodayOrder();
				int todayBoardCount = service.findTodayBoard();
				int todayPetplaceCount = service.findTodayPetplace();
				
				model.addAttribute("todayRecipeCount", todayRecipeCount);
				model.addAttribute("todayOrderCount", todayOrderCount);
				model.addAttribute("todayBoardCount", todayBoardCount);
				model.addAttribute("todayPetplaceCount", todayPetplaceCount);
								
				return "admin/dashboard";
				
			}
		} catch(Exception e) {
			request.setAttribute("msg", "접근 불가한 페이지입니다.");
			request.setAttribute("url", "/");
			return "alert";
		}
	}
	
	@ResponseBody
	@RequestMapping("/userchart")
	public List<AdminUserResponseDTO> adminHome() {
		List<AdminUserResponseDTO> create_user = service.findJoinUser();
		
		return create_user;
	}
	
	@GetMapping("/usermanagement")
	public String getUserManagement(HttpSession session, HttpServletRequest request) {

		try {
			if (!session.getAttribute("role").equals("admin")) {
				throw new Exception();
			} else {
				return "admin/userManagement";
			}
		} catch(Exception e) {
			request.setAttribute("msg", "접근 불가한 페이지입니다.");
			request.setAttribute("url", "/");
			return "alert";
		}
	}

	@ResponseBody
	@RequestMapping("/usermanagement")
	public List<AdminUserResponseDTO> userManagement(String keyword, int page) {
		int pages = (page - 1) * 10;

		List<AdminUserResponseDTO> user_list = service.findAllUser(keyword, pages);

		return user_list;
	}
	
	@PostMapping("/updatepoint")
	public ResponseEntity<Void> updateUserPoint(int point, String id) {
		service.updateUserPoint(point, id);
		
		return new ResponseEntity(HttpStatus.OK);
	}
}
