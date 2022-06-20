package com.tin.controller;

import java.lang.reflect.InvocationTargetException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tin.contant.SessionConst;
import com.tin.dao.AccountDAO;
import com.tin.entity.Account;
import com.tin.service.SessionService;

import org.apache.commons.beanutils.BeanUtils;


@Controller
public class EditProfileController {

	@Autowired
	AccountDAO dao;
	
//	@Autowired
//	Account account;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/edit-profile")
	public String index(Model model) {
		return "editprofile";
	}
	
	@RequestMapping("/edit-profile/submit")
	public String edit(RedirectAttributes param,Model model,Account a) throws IllegalAccessException, InvocationTargetException {
//		session.get("password");
//		dao.save(session.get("username"));
		//Xóa session
		session.remove(SessionConst.CURRENT_USER);
		
		//Lưu session mới
		session.set(SessionConst.CURRENT_USER,a);
		
		//cập nhật
		dao.save(a);
		param.addAttribute("message","Cập nhật tài khoản thành công");
		return "redirect:/edit-profile";
	}
	
}
