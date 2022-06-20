package com.tin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactController {

	@RequestMapping("/contact")
	public String index(Model model) {
		return "contact";
	}
}
