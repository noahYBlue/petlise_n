package admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.notice.AdminEditNoticeRequestDTO;
import admin.notice.AdminFindAllNoticeRequestDTO;
import admin.notice.AdminNoticeRequestDTO;
import admin.notice.AdminNoticeResponseDTO;
import admin.notice.AdminNoticeService;
import admin.notice.AdminQnAResponseDTO;
import admin.recipe.AdminEditRecipeRequestDTO;
import admin.recipe.AdminRecipeRequestDTO;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController {

	@Autowired
	@Qualifier("adminNoticeServiceImpl")
	AdminNoticeService service;
	
	@RequestMapping("/createnotice")
	public String editNotice(Model model, HttpSession session, AdminNoticeRequestDTO dto) {
		model.addAttribute("check", "등록");
		
		if (session.getAttribute("user_id") != null && dto.getTitle() != null) {
			String user_id = session.getAttribute("user_id").toString();

			dto.setUser_id(user_id);
			service.insertNotice(dto);
		}
		
		return "admin/editNotice";
	}

	@GetMapping("/noticemanagement")
	public String getNotice() {
		return "admin/noticeManagement";
	}
	
	@ResponseBody
	@RequestMapping("/noticemanagement")
	public List<AdminNoticeResponseDTO> notice(AdminFindAllNoticeRequestDTO dto) {
		int pages = (dto.getPage() - 1) * 10;
		dto.setPage(pages);
		List<AdminNoticeResponseDTO> notice_list = service.findAllNotice(dto);

		return notice_list;
	}
	
	@GetMapping("/getnotice")
	public String getFindNotice(Model model, @RequestParam("id") String id) {
		model.addAttribute("check", "수정");
		AdminNoticeRequestDTO noticeInfo = service.findNotice(id);

		model.addAttribute("noticeInfo", noticeInfo);
		
		return "admin/editNotice";
	}
	
	@RequestMapping("/editnotice")
	public ResponseEntity<Void> editNotice(AdminEditNoticeRequestDTO dto) {
		service.updateNotice(dto);
		
		return new ResponseEntity(HttpStatus.OK);
	}

	@RequestMapping("/deletenotice")
	public ResponseEntity<Void> deleteNotice(String notice_id) {
		service.deleteNotice(notice_id);

		return new ResponseEntity(HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/qnamanagement")
	public List<AdminQnAResponseDTO> QnA(String keyword, int page) {
		int pages = (page - 1) * 10;

		List<AdminQnAResponseDTO> notice_list = service.findAllQnA(keyword, pages);

		return notice_list;
	}

	@RequestMapping("/deleteqna")
	public ResponseEntity<Void> deleteQnA(String notice_id) {
		service.deleteQnA(notice_id);

		return new ResponseEntity(HttpStatus.OK);
	}
}
