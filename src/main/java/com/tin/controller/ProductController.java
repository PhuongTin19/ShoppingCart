package com.tin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tin.dao.CategoryDAO;
import com.tin.dao.ProductDAO;
import com.tin.entity.Category;
import com.tin.entity.Product;

@Controller
public class ProductController {

	@Autowired
	ProductDAO dao;
	
	@Autowired
	CategoryDAO cdao;
	
	@RequestMapping("/product")
	public String index(Model model,@RequestParam("id") int id) {
		
		//Hiện ra tất cả các loại hàng
		Category listc = cdao.findByCategoryId(id);
		model.addAttribute("itemsC", listc);
		//
		List<Product>list = dao.findById(id);
		model.addAttribute("list",list);
		return "product";
	}
}
