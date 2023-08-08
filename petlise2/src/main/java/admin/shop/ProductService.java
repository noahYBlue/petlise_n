package admin.shop;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import shop.cart.ShopCartDTO;
import shop.detail.ShopOrderProductDTO;

@Service
public class ProductService {
	@Autowired
	ProductDAO dao;

	public int insertProduct(ProductDTO dto) {
		return dao.insertProduct(dto);
	}

	public int maxProductNum() {
		return dao.maxProductNum();
	}

	public int countTotalProductNum() {
		return dao.countTotalProductNum();
	}
	
	public List<ProductDTO> getAllProduct() {
		return dao.getAllProduct();
	}
	
	public ProductDTO getProductById(String product_id) {
		return dao.getProductById(product_id);
	};
	
	public int deleteProduct(String product_id) {
		return dao.deleteProduct(product_id);
	};
	
	public int updateProduct(ProductDTO dto) {
		return dao.updateProduct(dto);
	};
	
	//Pagination
	public PagingResponse<ProductDTO> getAllProductPaging(SearchDTO dto) {

        // 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<ProductDTO> list = dao.getAllProductPaging(dto);
        return new PagingResponse<>(list, pagination);
    }
	
	//cart
	public int insertCart(ShopCartDTO dto) {
		return dao.insertCart(dto);
	}
	
	public int isinCart(ShopCartDTO dto) {
		return dao.isinCart(dto);
	}
	
	//insertOrderProduct
	public int insertOrderProduct(ShopOrderProductDTO dto) {
		return dao.insertOrderProduct(dto);
	}
	
}
