package com.tin.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tin.dao.ProductDAO;
import com.tin.entity.Product;

@RestController
@RequestMapping("/api/products")
public class ProductsApi {
	@Autowired
	ProductDAO dao;
	
	
	//ENDPOINT:localhost:8080/api/products/
	@GetMapping("/")
	public ResponseEntity<?> doGetAll(){
		List<Product> list= dao.findAllAvaiable();
		return ResponseEntity.ok(list);
		//return new ResponseEntity(HttpStatus.OK);
	}
}
