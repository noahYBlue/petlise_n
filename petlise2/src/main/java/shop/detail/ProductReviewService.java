package shop.detail;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.*;

@Service
public class ProductReviewService {
	@Autowired
	ProductReviewDAO dao;
	
	PagingResponse<ProductReviewDTO> getProductReviewsPaging(SearchDTO dto){
		// 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<ProductReviewDTO> list = dao.getProductReviews(dto);
        return new PagingResponse<>(list, pagination);
	}
	
	Integer getCountAllReviews(String product_id) {
		return dao.getCountAllReviews(product_id);
	};
	
	Integer getCountAllPhotoReviews(String product_id) {
		return dao.getCountAllPhotoReviews(product_id);
	};
	
	
	Integer getCountReviewsScore(String product_id, int score) {
		HashMap<String, String> map = new HashMap<>();
		map.put("product_id", product_id);
		map.put("score", String.valueOf(score));
		
		return dao.getCountReviewsScore(map);
	};
	Double getAvgReviews(String product_id) {
		return dao.getAvgReviews(product_id);
	};
	
	int deleteReview(String review_id) {
		return dao.deleteReview(review_id);
	};
	
	//좋아요 증가
	int likeUp(String user_id,String review_id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("review_id", review_id);
		
		int result1 = dao.likeUp(review_id);
		int result2 = dao.insertLike(map);
		
		return result1+result2;
	};
	
	//좋아요 감소
	int likeDown(String user_id,String review_id){
		HashMap<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("review_id", review_id);
		
		int result1 = dao.likeDown(review_id);
		int result2 = dao.deleteLike(map);
		
		return result1+result2;
	};
	
	int isLikeReview(String user_id,String review_id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("review_id", review_id);
		
		return dao.isLikeReview(map);
	}
}
