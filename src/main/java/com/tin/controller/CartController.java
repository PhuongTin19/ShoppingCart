package com.tin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tin.contant.SessionConst;
import com.tin.dao.OrderDetailDAO;
import com.tin.dao.ProductDAO;
import com.tin.dto.CartDto;
import com.tin.entity.OrderDetail;
import com.tin.entity.Product;
import com.tin.service.ParamService;
import com.tin.service.SessionService;
import com.tin.service.ShoppingCartService;

@Controller
public class CartController {

	@Autowired
	private ShoppingCartService cartService;
	
	@Autowired
	SessionService session;
	
	@Autowired
	ParamService param;
	
	@GetMapping("/cart")
	public String doGetViewCart() {
		return "cart";
		//Hhahahaaah
	}
	@GetMapping("/removeCart")
	public String doGetRemove(@RequestParam("productId") Long productId){
		//Lấy giỏ hàng từ session
		CartDto currentCart = (CartDto) session.get(SessionConst.CURRENT_CART);
		cartService.remove(currentCart, productId);
		session.set(SessionConst.CURRENT_CART, currentCart);
		return "cart";
	}

}
