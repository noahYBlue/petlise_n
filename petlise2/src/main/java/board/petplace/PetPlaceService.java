package board.petplace;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

@Service
public interface PetPlaceService {

	PagingResponse<PetPlaceDTO> getAllPetPlacePaging(SearchDTO dto);
	PagingResponse<PetPlaceCommentDTO> getAllCommentPaging(SearchDTO dto);

	public int insertPetPlace(PetPlaceDTO dto);

	public int insertComment(PetPlaceCommentDTO comment);

	public PetPlaceDTO findpetplace(int seq);

	public int viewCnt(int seq);

	public int updatepetplace(PetPlaceDTO dto);

	public void deletepetplace(int seq );
	int deleteComment(String comment_id);
	UserDTO getUserInfoPetplace(String user_id);
	
	public int deleteAllComment(String place_id);



	/*
	 * int insertLike(HashMap<String, String> map); int likeUp(String user_id,
	 * String place_id, String comment_id);
	 * 
	 * int likeDown(String user_id, String place_id);
	 * 
	 * int isLikeReview(String user_id, String place_id);
	 */
}
