package mypage.review;

import org.springframework.stereotype.Component;

import admin.order.OrderDTO;
import shop.detail.ProductReviewDTO;

@Component
public class MyOrderProductDTO {
	private int order_detail_id, product_id;
	private String order_id,user_id,product_image,product_name;
	private int product_price,quantity,price_total;
	private boolean isreivew;
	
	private OrderDTO orderdto;
	private ProductReviewDTO reviewdto;
	
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice_total() {
		return price_total;
	}
	public void setPrice_total(int price_total) {
		this.price_total = price_total;
	}
	public OrderDTO getOrderdto() {
		return orderdto;
	}
	public void setOrderdto(OrderDTO orderdto) {
		this.orderdto = orderdto;
	}
	public ProductReviewDTO getReviewdto() {
		return reviewdto;
	}
	public void setReviewdto(ProductReviewDTO reviewdto) {
		this.reviewdto = reviewdto;
	}
	public boolean isIsreivew() {
		return isreivew;
	}
	public void setIsreivew(boolean isreivew) {
		this.isreivew = isreivew;
	}
	
	
}
