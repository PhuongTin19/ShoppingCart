package com.tin.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tin.dao.AccountDAO;

@Controller
public class ForgotPassword {
	
	@Autowired
	AccountDAO dao;
	
	@Autowired
	JavaMailSender mailer;
	
	@RequestMapping("/forgot")
	public String index(Model model) {
		return "forgot-password";
	}
	@RequestMapping("/mailer/forgot")
	public String forgot(ModelMap model, 
			@RequestParam("to") String to,RedirectAttributes params) {
		String a = dao.findByEmail(to);
		try{
			// Tạo mail
			MimeMessage mail =mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			//MimeMessageHelper helper = new MimeMessageHelper(mail);
            MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
            helper.setSubject("Quên mật khẩu!!!");
			helper.setTo("tinnpps18888@fpt.edu.vn");
			helper.setText("Mật khẩu của tài khoản "+to + " " +"là:" +a, true);
			// Gửi mail
			mailer.send(mail);			
			params.addAttribute("message", "Email đã được gửi !");
			return "redirect:/forgot";
		}
		catch(Exception ex){
			ex.printStackTrace();
			params.addAttribute("message", "Gửi email thất bại !");
			return "redirect:/forgot";
		}
	}
}
