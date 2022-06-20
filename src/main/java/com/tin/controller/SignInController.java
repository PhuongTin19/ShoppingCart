package com.tin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tin.contant.SessionConst;
import com.tin.dao.AccountDAO;
import com.tin.entity.Account;
import com.tin.service.CookieService;
import com.tin.service.ParamService;
import com.tin.service.SessionService;

@Controller
public class SignInController {

	@Autowired
	ParamService paramService;
	
	@Autowired
	CookieService cookieService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	AccountDAO dao;
	
	@RequestMapping("/login")
	public String index(Model model) {
		return "signin";
	}
	
	@RequestMapping("/account/login")
	public String login(RedirectAttributes param,HttpServletRequest req) {
		String un = paramService.getString("username","");
		String pw = paramService.getString("password","");
		boolean rm = paramService.getBoolean("remember", false);
		Account a = dao.login(un, pw);
		Account a2 = dao.getOne(un);
		if(a != null) {
			sessionService.set(SessionConst.CURRENT_USER, a2);
			if(a.getAdmin() == true) {
				return "redirect:/admin";
			}
			if(rm == true) {
				cookieService.add("user",un,20);
				param.addAttribute("username",un);
			}else {
				cookieService.remove("user");
				param.addAttribute("username","");
			}
			
			param.addAttribute("message","Đăng nhập thành công");
			return "redirect:/index";
		}else if(a == null) {
			param.addAttribute("message","Tài khoản không tồn tại");
			return "redirect:/login";
		}else {
			param.addAttribute("message","Đăng nhập thất bại");
			return "redirect:/login";
		}
		
	}
}
