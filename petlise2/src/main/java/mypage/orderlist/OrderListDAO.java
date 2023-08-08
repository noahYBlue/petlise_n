package mypage.orderlist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import shop.payment.ShopOrderInfoDTO;

@Mapper
@Repository
public interface OrderListDAO {
	
	List<ShopOrderInfoDTO> getMyOrder(String user_id);
	int cancelOrder(String order_id);
}
