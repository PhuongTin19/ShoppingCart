package com.tin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tin.contant.SessionConst;
import com.tin.dao.OrderDAO;
import com.tin.entity.Account;
import com.tin.entity.Order;
import com.tin.service.SessionService;

@Controller
public class HistoryController {
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("/history")
	public String history(Model model) {
		Account a = session.get(SessionConst.CURRENT_USER);
		List<Order>list=orderDao.history(a.getUsername());
		model.addAttribute("listHistory", list);
		return "history";
	}
}
