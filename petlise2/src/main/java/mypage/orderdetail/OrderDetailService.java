package mypage.orderdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.payment.ShopOrderInfoDTO;
import shop.payment.ShopOrderProductDTO;
import user.UserDTO;

@Service
public class OrderDetailService {

	@Autowired
	OrderDetailDAO dao;
	
	public List<ShopOrderProductDTO> myOrderProduct(String order_id){
		return dao.myOrderProduct(order_id);
	}
	
	public UserDTO myUserInfo(String user_id){
		return dao.myUserInfo(user_id);
	}
	
	public ShopOrderInfoDTO myDeliveryInfo(String order_id){
		return dao.myDeliveryInfo(order_id);
	}
	public int cancelOrderDetail(String order_id) {
		return dao.cancelOrderDetail(order_id);
	}	
}
