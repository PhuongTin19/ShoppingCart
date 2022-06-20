package com.tin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tin.dto.CartDto;
import com.tin.service.SessionService;
import com.tin.util.SessionUtil;

@Component
public class SessionFilter implements Filter{

	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		//Nếu giỏ hàng chưa có trong session thì cấp giỏ hàng mới
		SessionUtil.validateCart(session);
		//Nếu có thì pass qua filter
		chain.doFilter(request, response);
	}
}
