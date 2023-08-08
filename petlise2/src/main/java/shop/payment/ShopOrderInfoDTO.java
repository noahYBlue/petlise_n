package shop.payment;

import java.util.Date;

public class ShopOrderInfoDTO {
	String user_id, name, address, phone, require, status, order_id, product_name, product_image;
	Date date;
	int available_point, total_product, total_payment;
	
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getAvailable_point() {
		return available_point;
	}
	public void setAvailable_point(int available_point) {
		this.available_point = available_point;
	}
	
}
