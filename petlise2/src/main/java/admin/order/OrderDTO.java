package admin.order;

import java.util.List;

import org.springframework.stereotype.Component;

import user.UserDTO;

@Component
public class OrderDTO {
	private String order_id,user_id,name,address,phone,require,status,date,delivery_id,delivery_com;
	private int available_point,total_product,total_payment;
	private UserDTO user;
	private List<OrderProductDTO> orderproducts;
	private int total_product_count;
	
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRequire() {
		return require;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDelivery_id() {
		return delivery_id;
	}
	public void setDelivery_id(String delivery_id) {
		this.delivery_id = delivery_id;
	}
	public String getDelivery_com() {
		return delivery_com;
	}
	public void setDelivery_com(String delivery_com) {
		this.delivery_com = delivery_com;
	}
	public int getAvailable_point() {
		return available_point;
	}
	public void setAvailable_point(int available_point) {
		this.available_point = available_point;
	}
	public int getTotal_product() {
		return total_product;
	}
	public void setTotal_product(int total_product) {
		this.total_product = total_product;
	}
	public int getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(int total_payment) {
		this.total_payment = total_payment;
	}
	public List<OrderProductDTO> getOrderproducts() {
		return orderproducts;
	}
	public void setOrderproducts(List<OrderProductDTO> orderproducts) {
		this.orderproducts = orderproducts;
	}
	public int getTotal_product_count() {
		return total_product_count;
	}
	public void setTotal_product_count(int total_product_count) {
		this.total_product_count = total_product_count;
	}
	
	
	
}
