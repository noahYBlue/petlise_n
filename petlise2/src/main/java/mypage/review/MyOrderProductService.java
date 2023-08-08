package mypage.review;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import shop.cart.ShopCartDTO;
import shop.detail.ProductReviewDTO;

@Service
public class MyOrderProductService {
	@Autowired
	MyOrderProductDAO dao;
	
	//Pagination
	public PagingResponse<MyOrderProductDTO> getMyOrderDetail(SearchDTO dto) {
        // 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<MyOrderProductDTO> list = dao.getMyOrderDetail(dto);
        
        // 리뷰 있는 경우 orderproductdto 담기
        for(MyOrderProductDTO order : list) {
        	HashMap<String, String> map = new HashMap<>();
    		map.put("order_detail_id", String.valueOf(order.getOrder_detail_id()));
    		map.put("user_id", order.getUser_id());
        	order.setReviewdto(dao.getProductReview(map));
        }
        
        return new PagingResponse<>(list, pagination);
    }
	
	public ProductReviewDTO getProductReview(String order_detail_id, String user_id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("order_detail_id", order_detail_id);
		map.put("user_id", user_id);
    	return dao.getProductReview(map);
	}
	
	public int insertReview(ProductReviewDTO dto) {
		return dao.insertReview(dto);
	}
	public int updateIsReviewTrue(String order_detail_id) {
		return dao.updateIsReviewTrue(order_detail_id);
	}
	public int updatePointUp(HashMap<String, String> map) {
		return dao.updatePointUp(map);
	}
	
	public int updateReview(ProductReviewDTO dto) {
		return dao.updateReview(dto);
	}
	
	public int updateDeleteAtReview(String review_id) {
		return dao.updateDeleteAtReview(review_id);
	}
}
