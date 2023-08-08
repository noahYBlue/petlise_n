package admin.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pagination.SearchDTO;
import shop.cart.ShopCartDTO;
import shop.detail.ShopOrderProductDTO;

@Mapper
@Repository
public interface ProductDAO {
	int insertProduct(ProductDTO dto);
	int maxProductNum();
	int countTotalProductNum();
	List<ProductDTO> getAllProduct();
	int deleteProduct(String product_id);	
	ProductDTO getProductById(String product_id);
	int updateProduct(ProductDTO dto);
	
	//Pagination
	List<ProductDTO> getAllProductPaging(SearchDTO dto);
	int getCount(SearchDTO dto);
	
	//cart
	int insertCart(ShopCartDTO dto);
	int isinCart(ShopCartDTO dto);
	
	//orderProduct
	int insertOrderProduct(ShopOrderProductDTO dto);
}
