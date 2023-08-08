package shop.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopCartService {

	@Autowired
	ShopCartDAO dao;

	public List<ShopCartDTO> getCartList(String user_id){
		return dao.getCartList(user_id);
	}

	public int deleteCartList(String product_name) {
		return dao.deleteCartList(product_name);
	}
	
	public int saveCartList(ShopCartDTO dto) {
		return dao.saveCartList(dto);
	}
	
	int deleteNonPayment(String user_id) {
		return dao.deleteNonPayment(user_id);
	}
	
}
