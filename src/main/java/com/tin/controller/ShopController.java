package com.tin.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tin.service.SessionService;
import com.tin.service.ShoppingCartService;
import com.tin.contant.SessionConst;
import com.tin.dao.CategoryDAO;
import com.tin.dao.ColorDAO;
import com.tin.dao.ProductDAO;
import com.tin.dto.CartDto;
import com.tin.entity.Category;
import com.tin.entity.Color;
import com.tin.entity.Product;

@Controller
public class ShopController {

	@Autowired
	ProductDAO dao;

	@Autowired
	CategoryDAO cdao;

	@Autowired
	ColorDAO codao;

	@Autowired
	SessionService session;

	@Autowired
	private ShoppingCartService cartService;
	
	@RequestMapping("/index")
	public String index(Model model) {

		// Hiện ra tất cả các sản phẩm
		List<Product> list = dao.findAllAvaiable();
		model.addAttribute("items", list);

		// Hiện ra 4 sản phẩm mới nhất
		List<Product> listTopNew = dao.findTopNewProduct();
		model.addAttribute("items4", listTopNew);

		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);

		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);

		return "index";
	}

	@RequestMapping("/filter")
	public String filter(Model model, @RequestParam("id") int id) {

		// Hiện ra tất cả các sản phẩm
		List<Product> list = dao.findAllAvaiable();
		model.addAttribute("items", list);

		// Hiện ra 4 sản phẩm mới nhất
		List<Product> listTopNew = dao.findTopNewProduct();
		model.addAttribute("items4", listTopNew);

		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);

		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);

		// Filter category
		List<Product> filterCate = dao.findProductByCate(id);
		model.addAttribute("items", filterCate);

		return "index";
	}

	@RequestMapping("/filterColor")
	public String filterColor(Model model, @RequestParam("cid") int cid) {

		// Hiện ra tất cả các sản phẩm
		List<Product> list = dao.findAllAvaiable();
		model.addAttribute("items", list);

		// Hiện ra 4 sản phẩm mới nhất
		List<Product> listTopNew = dao.findTopNewProduct();
		model.addAttribute("items4", listTopNew);

		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);

		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);

		// Filter color
		List<Product> filterColor = dao.findProductByColor(cid);
		model.addAttribute("items", filterColor);

		return "index";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam("keywords") Optional<String> kw) {

		// Hiện ra tất cả các sản phẩm
		List<Product> list = dao.findAllAvaiable();
		model.addAttribute("items", list);

		// Hiện ra 4 sản phẩm mới nhất
		List<Product> listTopNew = dao.findTopNewProduct();
		model.addAttribute("items4", listTopNew);

		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);

		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);

		// Search theo keyword
		String keywords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keywords);
		List<Product> items = dao.findProductByKeywords("%" + keywords + "%");
		model.addAttribute("items", items);
		return "index";
	}

	@RequestMapping("/searchByPrice")
	public String search2(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {

		// Hiện ra tất cả các sản phẩm
		List<Product> list = dao.findAllAvaiable();
		model.addAttribute("items", list);

		// Hiện ra 4 sản phẩm mới nhất
		List<Product> listTopNew = dao.findTopNewProduct();
		model.addAttribute("items4", listTopNew);

		// Hiện ra tất cả các loại hàng
		List<Category> listc = cdao.findAll();
		model.addAttribute("itemsC", listc);

		// Hiện ra tất cả các màu sắc
		List<Color> listColor = codao.findAll();
		model.addAttribute("itemsColor", listColor);

		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		List<Product> items = dao.findByPriceBetween(minPrice, maxPrice);
		model.addAttribute("items", items);
		return "index";
	}
	@GetMapping("/removeCartIndex")
	public String doGetUpdate(@RequestParam("productId") Long productId,Model model){
		//Lấy giỏ hàng từ session
		CartDto currentCart = (CartDto) session.get(SessionConst.CURRENT_CART);
		cartService.remove(currentCart, productId);
		session.set(SessionConst.CURRENT_CART, currentCart);
//		// Hiện ra tất cả các sản phẩm
//		List<Product> list = dao.findAllAvaiable();
//		model.addAttribute("items", list);
		this.index(model);
		return "index";
	}

	
//	@RequestMapping("/layout")
//	public String demo(ModelMap modelMap) {	
////		modelMap.put("products", dao.findAll());
//		return "layout";
//	}
	
	

}
