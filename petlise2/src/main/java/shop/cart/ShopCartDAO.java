package shop.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ShopCartDAO {

	List<ShopCartDTO> getCartList(String user_id);
	int deleteCartList(String product_name);
	int saveCartList(ShopCartDTO dto);
	int deleteNonPayment(String user_id);
}
