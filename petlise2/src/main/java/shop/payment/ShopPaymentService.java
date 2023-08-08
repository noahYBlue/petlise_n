package shop.payment;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.shop.ProductDTO;
import user.UserDTO;

@Service
public class ShopPaymentService {
	
	@Autowired
	ShopPaymentDAO dao;
	
	public List<ShopOrderProductDTO> getOrderList(String user_id){
		return dao.getOrderList(user_id);
	}
	
	public UserDTO getUserInfo(String user_id){
		return dao.getUserInfo(user_id);
	}
	
	public int saveOrderInfo(ShopOrderInfoDTO dto){
		return dao.saveOrderInfo(dto);
	}
	
	public int orderConfirm(String user_id) {
		return dao.orderConfirm(user_id);
	}
	
	public int deleteCart(String user_id) {
		return dao.deleteCart(user_id);
	}
	
	public List<ProductDTO> getProducts(ProductDTO dto){
		return dao.getProducts(dto);
	}
	
	public int updateSales(HashMap<String, Integer> map) {
		return dao.updateSales(map);
	}
	
	public int updatePointPayment(HashMap<String, String> map) {
		return dao.updatePointPayment(map);
	}
}
