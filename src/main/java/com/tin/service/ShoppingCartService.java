package com.tin.service;

import com.tin.dto.CartDto;
import com.tin.entity.Account;


public interface ShoppingCartService {
	//insert cart
	CartDto updateCart(CartDto cart, Long productId, Integer quantity, boolean isReplace);
	//Tổng số lượng thêm vào cart
	Integer getTotalQuantity(CartDto cart);
	//Tổng giá sản phẩm
	Double getTotalPrice(CartDto cart);
	//xóa sản phẩm
	CartDto remove(CartDto cart, Long productId);
	//
	//
	void insert(CartDto cart, Account user,String address,String phone) throws Exception;
}