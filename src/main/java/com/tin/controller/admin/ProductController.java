package com.tin.controller.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tin.dao.CategoryDAO;
import com.tin.dao.ColorDAO;
import com.tin.dao.ProductDAO;
import com.tin.entity.Account;
import com.tin.entity.Category;
import com.tin.entity.Color;
import com.tin.entity.Product;
import com.tin.service.ProductService;

@Controller(value = "ProductControllerOfAdmin")
@RequestMapping("/admin/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDao;
	
	@Autowired
	ColorDAO codao;
	
	@Autowired
	CategoryDAO cdao;
	
	@GetMapping("")
	public String doGetIndex(Model model) {
		List<Product>products = productService.findAll();
		model.addAttribute("products", products);
		Product productRequest = new Product();
		model.addAttribute("productRequest", productRequest);
		return "/admin/productAdmin";
	}
	@RequestMapping("/new")
	public String newUser(Model model) {
		List<Product>products = productService.findAll();
		model.addAttribute("products", products);
		Product productRequest = new Product();
		model.addAttribute("productRequest", productRequest);
		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);
		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);
		return "/admin/newProductAdmin";
		
	}

	//xóa user
	@GetMapping("/delete")
	public String doGetDelete(@RequestParam("name") String name,
			RedirectAttributes param) {
		try {
			productService.deleteLogical(name);
			param.addFlashAttribute("succeedMessage","Product " + name+" đã bị xóa");
		} catch (Exception e) {
			param.addFlashAttribute("errorMessage","Không thể xóa product " + name);
			e.printStackTrace();
		}
		return "redirect:/admin/product";
	}
	//thêm user
	@RequestMapping("/create")
	public String createUser(Model model,@ModelAttribute("productRequest") Product productRequest) {
		try {
				productRequest.setIsdeleted(false);
				productRequest.setMaterial("poly");
				productDao.save(productRequest);
				List<Product>products = productService.findAll();
				model.addAttribute("products", products);
		} catch (Exception e) {
				e.printStackTrace();
		}
		return "/admin/productAdmin";
	}

	@RequestMapping("/edit")
	public String editUser(Model model,@ModelAttribute("productRequest") Product productRequest) {
		List<Product>products = productService.findAll();
		model.addAttribute("products", products);
		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);
		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);
		return "/admin/newProductAdmin"; 
	}
//	
	//update 
	@RequestMapping("/update")
	public String updateUser(Model model,@ModelAttribute("productRequest") Product productRequest) {	
		productService.update(productRequest.getName(), productRequest.getImage(), productRequest.getPrice(), productRequest.getDescription(),productRequest.getQuantity()
				,productRequest.getCategory().getId(),productRequest.getColor().getId(),productRequest.getId());
		System.out.println();
		List<Product>products = productService.findAll();
		model.addAttribute("products", products);
		return "/admin/productAdmin";
	}
}
