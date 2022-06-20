package com.tin.util;

import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;

import com.tin.contant.SessionConst;
import com.tin.dto.CartDto;

public class SessionUtil {

	//Nếu giỏ hàng chưa có thì tạo giỏ mới
	public static void validateCart(HttpSession session) {
		if(ObjectUtils.isEmpty(session.getAttribute(SessionConst.CURRENT_CART))) {
			//tạo cart mới
			session.setAttribute(SessionConst.CURRENT_CART, new CartDto());
		}
		
	}
}
