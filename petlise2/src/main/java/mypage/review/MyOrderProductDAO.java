package mypage.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pagination.SearchDTO;
import shop.detail.ProductReviewDTO;

@Mapper
@Repository
public interface MyOrderProductDAO {
	List<MyOrderProductDTO> getMyOrderDetail(SearchDTO dto);
	Integer getCount(SearchDTO dto);
	ProductReviewDTO getProductReview(HashMap<String, String> map);
	
	int insertReview(ProductReviewDTO dto);
	int updateIsReviewTrue(String order_detail_id);
	int updatePointUp(HashMap<String, String> map);
	
	int updateReview(ProductReviewDTO dto);
	
	int updateDeleteAtReview(String review_id);
	
}
