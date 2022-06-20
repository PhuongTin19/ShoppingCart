package com.tin.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tin.dao.OrderDAO;
import com.tin.entity.Account;
import com.tin.entity.Category;
import com.tin.entity.Color;
import com.tin.entity.Order;
import com.tin.entity.Product;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	OrderDAO orderDao;
	
	@GetMapping("")
	public String order(Model model,@RequestParam("p") Optional<Integer> p) {
//		List<Order>list = orderDao.donHang();
//		model.addAttribute("listOrder", list);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Order> page = orderDao.donHang(pageable);
		model.addAttribute("listOrder", page);
		Order orderRequest = new Order();
		model.addAttribute("orderRequest", orderRequest);
		return "/admin/orderAdmin";
	}
	@RequestMapping("/edit")
	public String editUser(Model model,@ModelAttribute("orderRequest") Order oderRequest) {
		List<Order>orders = orderDao.findAll();
		model.addAttribute("orders", orders);
//		Order orderRequest = new Order();
//		model.addAttribute("otherRequest", orderRequest);
		return "/admin/newOrderAdmin"; 
	}
}
