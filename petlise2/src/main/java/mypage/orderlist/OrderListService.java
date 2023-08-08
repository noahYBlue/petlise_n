package mypage.orderlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.payment.ShopOrderInfoDTO;

@Service
public class OrderListService {
	
	@Autowired
	OrderListDAO dao;
	
	public List<ShopOrderInfoDTO> getMyOrder(String user_id) {
		return dao.getMyOrder(user_id);
	}
	
	public int cancelOrder(String order_id) {
		return dao.cancelOrder(order_id);
	}
}
