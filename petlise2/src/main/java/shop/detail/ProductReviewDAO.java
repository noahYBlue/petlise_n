package shop.detail;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pagination.SearchDTO;

@Mapper
@Repository
public interface ProductReviewDAO {
	List<ProductReviewDTO> getProductReviews(SearchDTO searchdto);
	int getCount(SearchDTO searchdto);
	
	Integer getCountAllReviews(String product_id);
	Integer getCountAllPhotoReviews(String product_id);
	Integer getCountReviewsScore(HashMap<String, String> map);
	Double getAvgReviews(String product_id);
	int deleteReview(String review_id);
	
	int likeUp(String review_id);
	int likeDown(String review_id);
	
	int insertLike(HashMap<String, String> map);
	int deleteLike(HashMap<String, String> map);
	
	int isLikeReview(HashMap<String, String> map);
	int likeCntReview(String review_id);
}
