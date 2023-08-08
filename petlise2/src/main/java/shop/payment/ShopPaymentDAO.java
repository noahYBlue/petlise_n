package shop.payment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import admin.shop.ProductDTO;
import user.UserDTO;

@Mapper
@Repository
public interface ShopPaymentDAO {
	
	List<ShopOrderProductDTO> getOrderList(String user_id);
	UserDTO getUserInfo(String user_id);
	int saveOrderInfo(ShopOrderInfoDTO dto);
	int orderConfirm(String user_id);
	int deleteCart(String user_id);
	List<ProductDTO> getProducts(ProductDTO dto);
	int updateSales(HashMap<String, Integer> map);
	int updatePointPayment(HashMap<String, String> map);
}
