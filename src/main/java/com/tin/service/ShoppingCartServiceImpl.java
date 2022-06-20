package com.tin.service;


import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.tin.dao.OrderDAO;
import com.tin.dao.OrderDetailDAO;
import com.tin.dao.ProductDAO;
import com.tin.dto.CartDetailDto;
import com.tin.dto.CartDto;
import com.tin.entity.Account;
import com.tin.entity.Order;
import com.tin.entity.OrderDetail;
import com.tin.entity.Product;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{

	@Autowired
	ProductDAO dao;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@Override
	public CartDto updateCart(CartDto cart, Long productId, Integer quantity, boolean isReplace) {
		
		//Tìm sản phẩm theo productid
		Product product = dao.findProductById(productId);
		//Lấy danh sách đã có trong giỏ hàng
		HashMap<Long, CartDetailDto>listDetail = cart.getListDetail();
		//Nếu chưa có trong giỏ hàng --> thêm mới
		if(!listDetail.containsKey(productId)) {
			// Them moi
			CartDetailDto cartDetail = new CartDetailDto();
			cartDetail.setProductId(productId);
			cartDetail.setQuantity(quantity);//so luong trong cart
			cartDetail.setPrice(product.getPrice());
			cartDetail.setName(product.getName());
			cartDetail.setImage(product.getImage());
			//put:them moi
			listDetail.put(productId, cartDetail);
		}else if(quantity > 0) { //Quantity lớn hơn 0 --> cập nhật
			// update
			if(isReplace) {
				//chưa có trong cart
				//Thay the sl cu = sl moi
				listDetail.get(productId).setQuantity(quantity);
			}else {
				//Đã có trong cart
				//cong don
				Integer oldQuantity = listDetail.get(productId).getQuantity();//Lay so luong cu
				Integer newQuantity = oldQuantity + quantity;//cong so luong moi
				listDetail.get(productId).setQuantity(newQuantity);//Thay so luong moi vao gio hang
			}
		}
		//cap nhat tong gia va so luong truoc khi tra ve cart
		cart.setTotalQuantity(getTotalQuantity(cart));
		cart.setTotalPrice(getTotalPrice(cart));
		
		return cart;
	}
	
	//Lay tong so luong
	@Override
	public Integer getTotalQuantity(CartDto cart) {
		Integer totalQuantity = 0;
		HashMap<Long, CartDetailDto>listDetail = cart.getListDetail();
		for (CartDetailDto cartDetail : listDetail.values()) {
			totalQuantity += cartDetail.getQuantity();
		}
		return totalQuantity;
	}
	//Lay tong gia tien
	@Override
	public Double getTotalPrice(CartDto cart) {
		Double totalPrice = 0.0;
		HashMap<Long, CartDetailDto>listDetail = cart.getListDetail();
		for (CartDetailDto cartDetail : listDetail.values()) {
			totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
		}
		return totalPrice;
	}
	//xóa sản phẩm
	@Override
	public CartDto remove(CartDto cart, Long productId) {
			//Lấy danh sách đã có trong giỏ hàng
			HashMap<Long, CartDetailDto>listDetail = cart.getListDetail();
			listDetail.remove(productId);
			//cap nhat tong gia va so luong truoc khi tra ve cart
			cart.setTotalQuantity(getTotalQuantity(cart));
			cart.setTotalPrice(getTotalPrice(cart));
			return cart;
		
	}
	//Update sản phẩm

//	@Override
//	public CartDto update(CartDto cart, Long productId, Integer quantity) {
//		//Lấy danh sách đã có trong giỏ hàng
//		HashMap<Long, CartDetailDto>listDetail = cart.getListDetail();
//		listDetail.get(productId).setQuantity(quantity);
//		//cap nhat tong gia va so luong truoc khi tra ve cart
//		cart.setTotalQuantity(getTotalQuantity(cart));
//		cart.setTotalPrice(getTotalPrice(cart));
//		return cart;
//	}
	//checkout
	@Override
	@Transactional
	public void insert(CartDto cart, Account user, String address, String phone) throws Exception {
		Order order = new Order();
		order.setAddress(address);
		order.setPhone(phone);
		order.setAccount(user);
		
		try {
			Order orderResponse = orderDao.saveAndFlush(order);
			for (CartDetailDto cartDetail : cart.getListDetail().values()) {
				//insert ORDER_DETAILS
				cartDetail.setOrderId(orderResponse.getId());
				orderDetailDao.insert(cartDetail);
				
				//update quantity
				Product product = dao.findProductById(cartDetail.getProductId());
				Integer newQuantity = product.getQuantity() - cartDetail.getQuantity();
				dao.updateQuantity(newQuantity, product.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	
	
}