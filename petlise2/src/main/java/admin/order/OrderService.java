package admin.order;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import shop.cart.ShopCartDTO;

@Service
public class OrderService {
	@Autowired
	OrderDAO dao;
	
	//Pagination
	public PagingResponse<OrderDTO> getOrdersPaging(SearchDTO dto) {
        // 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<OrderDTO> list = dao.getOrdersPaging(dto);
        
        //주문정보리스트
        for(OrderDTO order : list) {
        	if(dao.getOrderDetail(order.getOrder_id())!=null) {
        		order.setOrderproducts(dao.getOrderDetail(order.getOrder_id()));
        		order.setTotal_product_count(dao.getOrderDetail(order.getOrder_id()).size());
        	}
        }
        return new PagingResponse<>(list, pagination);
    }
	
	public int getCountWait() {
		return dao.getCountWait();
	}
	
	public int updateDelivery(HashMap<String, String> map) {
		return dao.updateDelivery(map);
	}
}
