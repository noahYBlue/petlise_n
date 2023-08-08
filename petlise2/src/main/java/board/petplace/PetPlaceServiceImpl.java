package board.petplace;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

@Service
public class PetPlaceServiceImpl implements PetPlaceService {
    @Autowired
     PetPlaceDAO dao;

    public PagingResponse<PetPlaceDTO> getAllPetPlacePaging(SearchDTO dto) {
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        List<PetPlaceDTO> list = dao.getAllPetPlacePaging(dto);
        return new PagingResponse<>(list, pagination);
    }

    
    
    public PagingResponse<PetPlaceCommentDTO> getAllCommentPaging(SearchDTO dto) {
        int count = dao.getCCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        List<PetPlaceCommentDTO> list = dao.getAllCommentPaging(dto);
        return new PagingResponse<>(list, pagination);
    }

    
    
    @Override
    public int insertPetPlace(PetPlaceDTO dto) {
  
        dao.insertPetPlace(dto);

        int generatedPlaceId = dto.getSeq();
        dto.setSeq(generatedPlaceId);
		return generatedPlaceId;
    }

    @Override
    public int insertComment(PetPlaceCommentDTO dto) {
  
        return dao.insertComment(dto);

    
    }



	public int viewCnt(int seq) {
		// TODO Auto-generated method stub
		return dao.viewCnt(seq);
	}

	
	public PetPlaceDTO findpetplace(int seq) {
		return dao.findpetplace(seq);
	}




	@Override
	public int updatepetplace(PetPlaceDTO dto) {
		dao.updatepetplace(dto);
		 int generatedPlaceId = dto.getSeq();
	        dto.setSeq(generatedPlaceId);
			return generatedPlaceId;
		
	}




	public void deletepetplace( int seq ) {
	
		 dao.deletepetplace(seq);
	}



	@Override
	public int deleteComment(String comment_id) {
		
		return dao.deleteComment(comment_id);
	}



	@Override
	public UserDTO getUserInfoPetplace(String user_id) {
		return dao.getUserInfoPetplace(user_id);
	}



	@Override
	public int deleteAllComment(String place_id) {
		return dao.deleteAllComment(place_id);
		
	}




	/*
	 * @Override public void insertComment(PetPlaceCommentDTO petplacecommentdto) {
	 * PetPlaceDAO.insertComment(petplacecommentdto);
	 * 
	 * }
	 * 
	 * @Override public List<PetPlaceCommentDTO> getCommentList(PetPlaceCommentDTO
	 * petplacecommentdto) { // TODO Auto-generated method stub return null; }
	 */
	/*
	 * //좋아요 증가 public int likeUp(String user_id,String place_id,String comment_id)
	 * { System.out.println("user_id: " + user_id + ", place_id: " + place_id);
	 * 
	 * HashMap<String, String> map = new HashMap<>(); map.put("user_id", user_id);
	 * map.put("place_id", place_id); map.put("comment_id", comment_id);
	 * 
	 * int result1 = dao.likeUp(place_id); int result2 = dao.insertLike(map);
	 * 
	 * return result1; };
	 * 
	 * //좋아요 감소 public int likeDown(String user_id,String place_id){ HashMap<String,
	 * String> map = new HashMap<>(); map.put("user_id", user_id);
	 * map.put("place_id", place_id);
	 * 
	 * int result1 = dao.likeDown(place_id); int result2 = dao.deleteLike(map);
	 * 
	 * return result1; };
	 * 
	 * public int isLikeReview(String user_id,String place_id) { HashMap<String,
	 * String> map = new HashMap<>(); map.put("user_id", user_id);
	 * map.put("place_id", place_id);
	 * 
	 * return dao.isLikeReview(map); }
	 * 
	 */
		
	}




	

