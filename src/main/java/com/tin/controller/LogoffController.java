package com.tin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tin.contant.SessionConst;
import com.tin.service.SessionService;

@Controller
public class LogoffController {
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/logoff")
	public String logoff() {
		session.remove(SessionConst.CURRENT_USER);
		return "redirect:/index";
	}
}
