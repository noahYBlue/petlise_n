package notice.qna;

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
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class QnaController {
	@Autowired
	@Qualifier("qnaServiceImpl")
	QnaService service;
	
	@GetMapping("/qna")
	public String getQnA(Model model) {
		model.addAttribute("title", "문의사항");

		return "notice/qnaMain";
	}
	
	@ResponseBody
	@RequestMapping("/qna")
	public List<QnAResponseDTO> getQnAList(String keyword, int page) {
		int pages = (page - 1) * 10;

		List<QnAResponseDTO> qna_list = service.findAllQna(keyword, pages);

		return qna_list;
	}
	
	@RequestMapping("/createqna")
	public String createQnA(Model model, HttpSession session, QnaRequestDTO dto) {
		model.addAttribute("title", "문의사항 등록");
		model.addAttribute("check", "등록");
		
		if (session.getAttribute("user_id") != null && dto.getTitle() != null) {
			String user_id = session.getAttribute("user_id").toString();

			dto.setUser_id(user_id);
			service.insertQna(dto);
		}
		
		return "notice/editQna";
	}
	
	@GetMapping("/qnadetail")
	public String detailQnA(Model model, @RequestParam("id") String id) {
		service.updateViewCount(id);
		QnaRequestDTO qnaInfo = service.findQna(id);
		
		List<CommentResponseDTO> comment_list = service.findAllComment(id);
		
		model.addAttribute("qnaInfo", qnaInfo);
		model.addAttribute("commentList", comment_list);
		
		return "notice/detailQna";
	}
	@GetMapping("/getqna")
	public String getFindQnA(Model model, @RequestParam("id") String id) {

		model.addAttribute("title", "문의사항 수정");
		model.addAttribute("check", "수정");
		
		QnaRequestDTO qnaInfo = service.findQna(id);

		model.addAttribute("qnaInfo", qnaInfo);
		
		return "notice/editQna";
	}
	
	@RequestMapping("/editqna")
	public ResponseEntity<Void> editQnA(EditQnaRequestDTO dto) {
		service.updateQna(dto);
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping("/deleteqna")
	public ResponseEntity<Void> deleteQnA(String id) {
		service.deleteQna(id);
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping("/createcomment")
	public ResponseEntity<Void> createComment(Model model, HttpSession session, String id, String content) {
		if (session.getAttribute("user_id") != null) {
			service.insertComment(id, content);
		}
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@RequestMapping("/deletecomment")
	public ResponseEntity<Void> deleteComment(String id) {
		service.deleteComment(id);
		
		return new ResponseEntity(HttpStatus.OK);
	}
}
