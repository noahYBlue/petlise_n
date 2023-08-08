package shop.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface OrderEndDAO {
	
	List<ShopOrderInfoDTO> getOrderInfo(String user_id);
}
