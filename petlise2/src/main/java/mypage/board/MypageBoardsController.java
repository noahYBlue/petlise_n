package mypage.board;

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
public class MypageBoardsController {
	@Autowired
	MyBoardService service;
	
	@GetMapping("/mypage/board")
	public ModelAndView myboard(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("user_id") != null) {
			String userId = (String)session.getAttribute("user_id");
			searchdto.setSearchType1(userId);
			PagingResponse<MyBoardDTO> response = service.getMyBoard(searchdto);
			
			mv.addObject("response", response);
			mv.setViewName("/mypage/myBoard");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@PostMapping("/mypage/deletemyboard")
	@ResponseBody
	public String getMyBoardDelete(String board_id, HttpSession session) {
		String userId = (String)session.getAttribute("user_id");
		service.pointDown(userId);
		int result = service.deleteMyBoard(board_id);
		return "{\"result\":\""+result+"\"}";
	}

	@GetMapping("/mypage/petplace")
	public ModelAndView mypetplace(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("user_id") != null) {
			String userId = (String)session.getAttribute("user_id");
			searchdto.setSearchType1(userId);
			PagingResponse<MyPetPlaceDTO> response = service.getMyPetPlace(searchdto);
			
			mv.addObject("response", response);
			mv.setViewName("/mypage/myPetPlace");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@PostMapping("/mypage/deletemypetplace")
	@ResponseBody
	public String deletemypetplace(String place_id, HttpSession session) {
		String userId = (String)session.getAttribute("user_id");
		service.pointDown(userId);
		int result = service.deleteMyPetPlace(place_id);
		return "{\"result\":\""+result+"\"}";
	}

	@GetMapping("/mypage/mywriterecipe")
	public ModelAndView mywriterecipe(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("user_id") != null) {
			String userId = (String)session.getAttribute("user_id");
			searchdto.setSearchType1(userId);
			PagingResponse<MyRecipeDTO> response = service.getMyWriteRecipe(searchdto);
			
			mv.addObject("response", response);
			mv.setViewName("/mypage/myWriteRecipe");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@PostMapping("/mypage/deletemywriterecipe")
	@ResponseBody
	public String deletemywriterecipe(String recipe_id, HttpSession session) {
		String userId = (String)session.getAttribute("user_id");
		service.pointDown(userId);
		int result = service.deleteMyWriteRecipe(recipe_id);
		return "{\"result\":\""+result+"\"}";
	}

	@GetMapping("/mypage/mylikerecipe")
	public ModelAndView mylikerecipe(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			String userId = (String)session.getAttribute("user_id");
			searchdto.setSearchType1(userId);
			PagingResponse<MyRecipeLikeDTO> response = service.getMyLikeRecipe(searchdto);
			
			mv.addObject("response", response);
			mv.setViewName("/mypage/myLikeRecipe");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}

	@GetMapping("/mypage/qna")
	public ModelAndView myqna(@ModelAttribute SearchDTO searchdto, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user_id") != null) {
			String userId = (String)session.getAttribute("user_id");
			searchdto.setSearchType1(userId);
			PagingResponse<MyQnADTO> response = service.getMyQnA(searchdto);
			
			mv.addObject("response", response);
			mv.setViewName("/mypage/myQnA");
		} else {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("url", "/");
			mv.setViewName("alert");
		}
		return mv;
	}
	
	@PostMapping("/mypage/deletemyqna")
	@ResponseBody
	public String deleteMyQnA(String notice_id) {
		int result = service.deleteMyQna(notice_id);
		return "{\"result\":\""+result+"\"}";
	}
	
}
