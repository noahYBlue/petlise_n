package admin.board;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {

	@Autowired
	@Qualifier("adminBoardServiceImpl")
	AdminBoardService service;

	@GetMapping("/boardmanagement")
	public String getBoard(Model model) {
		model.addAttribute("title", "자유게시판");
		
		return "admin/boardManagement";
	}

	@ResponseBody
	@RequestMapping("/boardmanagement")
	public List<AdminBoardResponseDTO> board(String keyword, int page) {
		int pages = (page - 1) * 10;
		List<AdminBoardResponseDTO> board_list = service.findAllBoard(keyword, pages);

		return board_list;
	}
	
	@ResponseBody
	@RequestMapping("/boardreport")
	public List<AdminBoardReportResponseDTO> boardReport(String keyword, int page) {
		int pages = (page - 1) * 10;
		List<AdminBoardReportResponseDTO> board_report_list = service.findAllBoardReport(keyword, pages);
		
		return board_report_list;
	}
	
	@ResponseBody
	@RequestMapping("/commentreport")
	public List<AdminCommentReportResponseDTO> commentReport(String keyword, int page) {
		int pages = (page - 1) * 10;
		List<AdminCommentReportResponseDTO> comment_report_list = service.findAllCommentReport(keyword, pages);

		return comment_report_list;
	}
	
	@RequestMapping("/deleteboard")
	public ResponseEntity<Void> deleteBoard(Date deleted_at, String board_id) {
		service.deleteBoard(deleted_at, board_id);

		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping("/updatecommentdeleted")
	public ResponseEntity<Void> updateBoardCommentDeleted(Date deleted_at, String comment_id) {
		service.updateBoardCommentDeleted(deleted_at, comment_id);
		
		return new ResponseEntity(HttpStatus.OK);
	}

	@GetMapping("/petplacemanagement")
	public String getPetplace(Model model) {
		model.addAttribute("title", "펫플레이스");
		
		return "admin/boardManagement";
	}
	
	@ResponseBody
	@RequestMapping("/petplacemanagement")
	public List<AdminBoardResponseDTO> petplace(String keyword, int page) {
		int pages = (page - 1) * 10;
		List<AdminBoardResponseDTO> petplace_list = service.findAllPetplace(keyword, pages);

		return petplace_list;
	}
	
	@ResponseBody
	@RequestMapping("/petplacereport")
	public List<AdminBoardReportResponseDTO> petplaceReport(String keyword, int page) {
		int pages = (page - 1) * 10;
		List<AdminBoardReportResponseDTO> petplace_report_list = service.findAllPetplaceReport(keyword, pages);

		return petplace_report_list;
	}
	
	@ResponseBody
	@RequestMapping("/petplacecommentreport")
	public List<AdminCommentReportResponseDTO> petplaceCommentReport(String keyword, int page) {
		int pages = (page - 1) * 10;
		List<AdminCommentReportResponseDTO> comment_report_list = service.findAllPetplaceCommentReport(keyword, pages);

		return comment_report_list;
	}
	
	@RequestMapping("/deletepetplace")
	public ResponseEntity<Void> deletePetplace(Date deleted_at, String board_id) {
		service.deletePetplace(deleted_at, board_id);

		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping("/updatepetplacecommentdeleted")
	public ResponseEntity<Void> updatePetplaceCommentDeleted(Date deleted_at, String comment_id) {
		service.updatePetplaceCommentDeleted(deleted_at, comment_id);
		
		return new ResponseEntity(HttpStatus.OK);
	}

}
