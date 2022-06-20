package com.tin.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tin.dao.OrderDAO;
import com.tin.dao.OrderDetailDAO;
import com.tin.dao.ProductDAO;
import com.tin.entity.Order;
import com.tin.entity.Report;
import com.tin.service.StatsService;

@Controller(value = "HomeControllerOfAdmin")
@RequestMapping("/admin")
public class homeController {
	
	@Autowired
	StatsService statsService;
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;

	@RequestMapping()
	public String inventory(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		//Tổng lượt mua hàng
		Integer countC = orderDao.countCustomer();
		model.addAttribute("countC", countC);
		//Tổng thu nhập
		String sumR = orderDetailDao.sumRevenue();
		model.addAttribute("sumR", sumR);
		//Tổng sản phẩm bán được
		Integer sumP = orderDetailDao.sumProduct();
		model.addAttribute("sumP", sumP);

		return "admin";
	}
//	@RequestMapping("/order")
//	public String order(Model model) {
//		//
//		List<Order>list = orderDao.donHang();
//		model.addAttribute("listOrder", list);
//		return "admin/order";
//	}
}
