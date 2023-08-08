package shop.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderEndService {
	
	@Autowired
	OrderEndDAO dao;
	
	public List<ShopOrderInfoDTO> getOrderInfo(String user_id){
		return dao.getOrderInfo(user_id);
	}
}
