package board.notice;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

@Controller
public class NoticeController {
	
	


	    @Autowired
	    private NoticeService service;

	    
	    
		//펫플레이스리스트 
		@GetMapping("/noticeMain")
		public ModelAndView noticeList(HttpSession session,@ModelAttribute SearchDTO searchdto) {
			
			  String user_id = (String) session.getAttribute("user_id");
			PagingResponse<NoticeDTO> notices = service. getAllNoticePaging(searchdto);
			 UserDTO userInfo = service.getUserInfoNoticeboard(user_id);
			
			
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("response", notices);
		    mv.addObject("userInfo", userInfo);
			mv.setViewName("notice/noticeMain");
			return mv;
		}
	
	
		@GetMapping("/noticeDetail")
		public ModelAndView noticeList(HttpSession session,@RequestParam("notice_id")String notice_id) {
			
			  String user_id = (String) session.getAttribute("user_id");
			 UserDTO userInfo = service.getUserInfoNoticeboard(user_id);
			 NoticeDTO noticeInfo = service.findnotice(notice_id);
			
			
			ModelAndView mv = new ModelAndView();
		
		    mv.addObject("userInfo", userInfo);
		    mv.addObject("noticeInfo", noticeInfo);
			mv.setViewName("notice/noticeDetail");
			return mv;
		}

	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}
	
	

}



