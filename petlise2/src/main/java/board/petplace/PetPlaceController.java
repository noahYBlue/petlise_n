package board.petplace;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;


@Controller

public class PetPlaceController {

	@Autowired
	@Qualifier("petPlaceServiceImpl")
	private PetPlaceService service;



//펫플레이스 작성
	@RequestMapping("/petplaceWriteform")
	public ResponseEntity<Integer> petplaceWriteform(HttpSession session, PetPlaceDTO dto, Model model) {
		// 로그인 여부 확인
		if (session.getAttribute("user_id") != null && dto.getTitle() != null) {
			String user_id = session.getAttribute("user_id").toString();
			dto.setUser_id(user_id);
		}

		int seq = service.insertPetPlace(dto); // 새로 생성된 seq를 얻어옵니다.

		// ResponseEntity를 사용하여 seq를 응답합니다.
		return new ResponseEntity<Integer>(seq, HttpStatus.OK);
	}
	
	@RequestMapping("/petplaceCommentform")
	public ResponseEntity<Integer> insertComment(HttpSession session, PetPlaceDTO dto,PetPlaceCommentDTO comment, Model model) {
		if (session.getAttribute("user_id") != null ) {
			String user_id = session.getAttribute("user_id").toString();
			dto.setUser_id(user_id);
			int seq = service.insertComment(comment);; // 새로 생성된 seq를 얻어옵니다.
		}
			int seq = dto.getSeq(); 
		return new ResponseEntity<Integer>(seq, HttpStatus.OK);
			}

	
	
	
	

	@GetMapping("/petplaceWrite")
	public String petplacewrite() {
		// 펫 플레이스 등록으로 이동합니다.
		return "board/petplaceWrite";
	}

	// delete
	@RequestMapping("/petplaceDelete")
	public ResponseEntity<Void> petplaceDetail(PetPlaceDTO dto, HttpSession session) {
	    Integer seq = (Integer) session.getAttribute("seq");
	    dto.setSeq(seq);
	    
	    String place_id = (String) session.getAttribute("place_id");
	    dto.setPlace_id(place_id);
	    service.deleteAllComment(place_id);
	    
	    // 플레이스 삭제
	    service.deletepetplace(seq);

	    return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	// 펫플레이스 리스트
	@GetMapping("/petplaceMain")
	public ModelAndView petPlaceList(@ModelAttribute SearchDTO searchdto) {
		PagingResponse<PetPlaceDTO> petPlaces = service.getAllPetPlacePaging(searchdto);

		ModelAndView mv = new ModelAndView();
		mv.addObject("response", petPlaces);
		mv.setViewName("board/petplaceMain");
		return mv;
	}

	@RequestMapping("/getpetplace")
	public ModelAndView petplaceDetail(Model model, String place_id, @RequestParam("seq") int seq, HttpSession session,
	        @ModelAttribute SearchDTO searchdto) {
	    String user_id = (String) session.getAttribute("user_id");
	    
	    if (user_id == null) {
	        // user_id가 null인 경우 처리
	        // 예를 들어, 로그인 페이지로 리다이렉트 또는 다른 처리 수행
	        // 이때 userInfo를 가져오지 않도록 주의
	    	
	    	service.viewCnt(seq);
		    PetPlaceDTO petplaceInfo = service.findpetplace(seq);
		    session.setAttribute("place_id", place_id);
		    place_id = petplaceInfo.getPlace_id() ;
		    searchdto.setSearchType1(place_id);
		    searchdto.setRecordSize(10);
		    PagingResponse<PetPlaceCommentDTO> comment = service.getAllCommentPaging(searchdto);

	        ModelAndView mv = new ModelAndView();
	        mv.addObject("petplaceInfo", petplaceInfo);
	        mv.addObject("response", comment);
	        mv.setViewName("board/petplaceDetail");

	        model.addAttribute("seq", seq);
	        session.setAttribute("seq", seq);

	        return mv;
	    }

	    service.viewCnt(seq);
	    PetPlaceDTO petplaceInfo = service.findpetplace(seq);
	    session.setAttribute("place_id", place_id);

	    UserDTO userInfo = service.getUserInfoPetplace(user_id);
	    place_id = petplaceInfo.getPlace_id() ;
	    searchdto.setSearchType1(place_id);
	    searchdto.setRecordSize(10);
	    PagingResponse<PetPlaceCommentDTO> comment = service.getAllCommentPaging(searchdto);

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("userInfo", userInfo);
	    mv.addObject("petplaceInfo", petplaceInfo);
	    mv.addObject("response", comment);
	    mv.setViewName("board/petplaceDetail");

	    model.addAttribute("seq", seq);
	    session.setAttribute("seq", seq);

	    return mv;
	}

	
	// update
		@RequestMapping("/getUpdatepetplace")
		public String getUpdatepetplace(Model model, @RequestParam("seq") int seq, HttpSession session) {
			PetPlaceDTO petplaceInfo = service.findpetplace(seq);
			model.addAttribute("petplaceInfo", petplaceInfo);
			model.addAttribute("seq", seq); // seq를 모델 속성으로 추가
			session.setAttribute("seq", seq);

			return "board/petplaceUpdate";
		}

		@RequestMapping("/petplaceUpdate")
		public ResponseEntity<Integer> petplaceUpdate(PetPlaceDTO dto, HttpSession session) {
			// 세션에서 seq를 읽어옴
			Integer seq = (Integer) session.getAttribute("seq");

			// DTO에 세션에서 읽어온 seq를 설정
			dto.setSeq(seq);

			// 서비스를 호출하여 쿼리 실행
			seq = service.updatepetplace(dto); // 새로 생성된 seq를 얻어옵니다.

			// ResponseEntity를 사용하여 seq를 응답합니다.
			return new ResponseEntity<Integer>(seq, HttpStatus.OK);
		}

		@PostMapping("/deletecomment")
		@ResponseBody
		public String deletereview(String comment_id) {
			int result = service.deleteComment(comment_id);
			return "{\"result\":\""+result+"\"}";
		}
		
		 // 후기 좋아요 여부
//	    String user_id = (String) session.getAttribute("user_id");

		/*
		 * // Null check for PetPlaceLike if (petplaceInfo.getPetplacelike() != null &&
		 * user_id != null) { if (service.isLikeReview(user_id,
		 * petplaceInfo.getPetplacelike().getPlace_id()) > 0) {
		 * petplaceInfo.getPetplacelike().setIs_like(true); } else {
		 * petplaceInfo.getPetplacelike().setIs_like(false); } }
		 */
		
	/*
	 * @RequestMapping("/petplacelikeup")
	 * 
	 * @ResponseBody public String petplacelikeup(String user_id, String place_id,
	 * String comment_id) { int result = service.likeUp(user_id, place_id,
	 * comment_id); return "{\"result\":\"" + result + "\"}"; }
	 * 
	 * @RequestMapping("/petplacelikedown")
	 * 
	 * @ResponseBody public String petplacelikedown(String user_id, String place_id)
	 * { int result = service.likeDown(user_id, place_id); return "{\"result\":\"" +
	 * result + "\"}"; }
	 */

}
