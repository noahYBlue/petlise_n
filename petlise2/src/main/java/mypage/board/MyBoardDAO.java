package mypage.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pagination.SearchDTO;
import shop.detail.ProductReviewDTO;

@Mapper
@Repository
public interface MyBoardDAO {
	List<MyBoardDTO> getMyBoard(SearchDTO dto);
	Integer getMyBoardCount(SearchDTO dto);
	Integer getMyBoardlike(String board_id);
	int deleteMyBoard(String board_id);

	List<MyPetPlaceDTO> getMyPetPlace(SearchDTO dto);
	Integer getMyPetPlaceCount(SearchDTO dto);
	Integer getMyPetPlacelike(String place_id);
	int deleteMyPetPlace(String place_id);
	
	List<MyRecipeDTO> getMyWriteRecipe(SearchDTO dto);
	Integer getMyWriteRecipeCount(SearchDTO dto);
	int deleteMyWriteRecipe(String recipe_id);
	int deleteMyWriteRecipelike(String recipe_id);
	
	List<MyRecipeLikeDTO> getMyLikeRecipe(SearchDTO dto);
	Integer getMyLikeRecipeCount(SearchDTO dto);

	List<MyQnADTO> getMyQnA(SearchDTO dto);
	Integer getMyQnACount(SearchDTO dto);
	Boolean is_myQnaAnswer(String notice_id);
	int deleteMyQna(String notice_id);
	
	int pointDown(String user_id);
}
