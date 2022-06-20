package com.tin.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tin.dao.AccountDAO;
import com.tin.dao.OrderDAO;
import com.tin.entity.Account;
import com.tin.entity.Order;
import com.tin.service.SessionService;
import com.tin.service.UsersService;

@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private UsersService userService;
	
	@Autowired
	AccountDAO accountDao;
	
	@Autowired
	SessionService session;
	
	@Autowired
	OrderDAO orderDao;
	
	@GetMapping("")
	public String doGetIndex(Model model) {
			List<Account>users = userService.findAll();
			model.addAttribute("users", users);
			
			Account userRequest = new Account();
			model.addAttribute("userRequest", userRequest);
			return "/admin/userAdmin";
		
		
	}
//	@RequestMapping("/new")
//	public String newUser(Model model) {
//		List<Account>users = userService.findAll();
//		model.addAttribute("users", users);
//		Account userRequest = new Account();
//		model.addAttribute("userRequest", userRequest);
//		return "/admin/newUserAdmin";
//	}
	
	//xóa user
	@GetMapping("/delete")
	public String doGetDelete(@RequestParam("username") String username,
			RedirectAttributes param) {
		try {
			userService.deleteLogical(username);
			param.addFlashAttribute("succeedMessage","admin " + username+" đã bị xóa");
		} catch (Exception e) {
			param.addFlashAttribute("errorMessage","Không thể xóa admin " + username);
			e.printStackTrace();
		}
		return "redirect:/admin/user";
	}
	//thêm user
	@RequestMapping("/create")
	public String createUser(Model model,@ModelAttribute("userRequest") Account userRequest) {
		try {
				userRequest.setAdmin(true);
				userRequest.setIsdeleted(false);
				accountDao.save(userRequest);
				List<Account>users = userService.findAll();
				model.addAttribute("users", users);
		} catch (Exception e) {
				e.printStackTrace();
		}
		return "/admin/userAdmin";
	}

	@RequestMapping("/edit")
	public String editUser(Model model,@ModelAttribute("userRequest") Account userRequest) {
		List<Account>users = userService.findAll();
		model.addAttribute("users", users);
		return "/admin/newUserAdmin"; 
	}
	
	//update 
	@RequestMapping("/update")
	public String updateUser(Model model,@ModelAttribute("userRequest") Account userRequest) {		
		try {
			userService.update(userRequest.getEmail(), userRequest.getPassword(), userRequest.getFullname(), 
					userRequest.getImage(), userRequest.getUsername());
			List<Account>users = userService.findAll();
			model.addAttribute("users", users);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/userAdmin";
	}
	
	
}
