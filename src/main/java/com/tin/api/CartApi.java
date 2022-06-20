package com.tin.api;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tin.contant.SessionConst;
import com.tin.dto.CartDetailDto;
import com.tin.dto.CartDto;
import com.tin.entity.Account;
import com.tin.service.SessionService;
import com.tin.service.ShoppingCartService;
import com.tin.util.SessionUtil;

@RestController
@RequestMapping("/api/cart")
public class CartApi {

	@Autowired
	private ShoppingCartService cartService;
	
	@Autowired
	SessionService session;
	
	//localhost:8080/api/cart/update?productId={...}&quantity={...}&isReplace={...}
	@GetMapping("/update")
	public ResponseEntity<?> doGetUpdate(@RequestParam("productId") Long productId,
			@RequestParam("quantity") Integer quantity,
			@RequestParam("isReplace") Boolean isReplace){
		//Lấy giỏ hàng từ session
		CartDto currentCart = (CartDto) session.get(SessionConst.CURRENT_CART);
		cartService.updateCart(currentCart, productId, quantity, isReplace);
		session.set(SessionConst.CURRENT_CART, currentCart);
		return ResponseEntity.ok(currentCart);
	}
	
	
	//localhost:8080/api/cart/updateCart?productId={...}&quantity={...}&isReplace={...}
//	@GetMapping("/updateCart")
//	public ResponseEntity<?> doGetUpdateCart(CartDto cart,@RequestParam("productId") Long productId,
//			@RequestParam("quantity") Integer quantity,
//			@RequestParam("isReplace") Boolean isReplace){
//		//Lấy giỏ hàng từ session
//		CartDto currentCart = (CartDto) session.get(SessionConst.CURRENT_CART);
//		HashMap<Long, CartDetailDto>listDetail = cart.getListDetail();
//		if(quantity > 0) { //Quantity lớn hơn 0 --> cập nhật
//			// update
//			if(isReplace) {
//				//chưa có trong cart
//				//Thay the sl cu = sl moi
//				listDetail.get(productId).setQuantity(quantity);
//			}else {
//				//Đã có trong cart
//				//cong don
//				Integer oldQuantity = listDetail.get(productId).getQuantity();//Lay so luong cu
//				Integer newQuantity = oldQuantity + quantity;//cong so luong moi
//				listDetail.get(productId).setQuantity(newQuantity);//Thay so luong moi vao gio hang
//			}
//		}
//		session.set(SessionConst.CURRENT_CART, currentCart);
//		return ResponseEntity.ok(currentCart);
//	}
//	
	@GetMapping("/checkout")
	public ResponseEntity<?>doGetCheckOut(
			@RequestParam("address") String address,
			@RequestParam("phone") String phone,HttpSession session) throws Exception{
		Account currentUser = (Account) session.getAttribute(SessionConst.CURRENT_USER);
		
		if(!ObjectUtils.isEmpty(currentUser)) {
			CartDto currentCart = (CartDto) session.getAttribute(SessionConst.CURRENT_CART);
//			try {
				cartService.insert(currentCart, currentUser, address, phone);
				session.setAttribute(SessionConst.CURRENT_CART, new CartDto());
				return new ResponseEntity<>(HttpStatus.OK);//200
//			} catch (Exception e) {
//				e.printStackTrace();
//				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);//400
//			}
		}else {
			return new ResponseEntity<>(HttpStatus.FORBIDDEN);//403
		}
	}
	
}
