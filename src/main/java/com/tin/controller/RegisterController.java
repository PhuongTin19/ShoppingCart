package com.tin.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tin.dao.AccountDAO;
import com.tin.entity.Account;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	AccountDAO dao;
	
//	@Autowired
//	ServletContext app;
	
	@RequestMapping()
	public String index(Model model) {
		Account a = new Account();
		model.addAttribute("item", a);
		return "register";
	}
	@RequestMapping("/add")
	@Transactional
	public String add(Model model,RedirectAttributes params,@ModelAttribute("item") Account a) {
		if(!dao.existsById(a.getUsername())) {
			a.setAdmin(false);
			a.setImage("user.png");
			dao.save(a);
			params.addAttribute("message", "Đăng ký thành công");
			return "redirect:/register";
		}else {
			params.addAttribute("message", "Tài khoản đã tồn tại");
			return "redirect:/register";
		}
			
		
	}
}
