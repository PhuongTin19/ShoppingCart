package com.tin.service;

import java.util.List;

import com.tin.entity.Category;
import com.tin.entity.Color;
import com.tin.entity.Product;

public interface ProductService {

	List<Product>findAll();
	void deleteLogical(String name);
//	void update(String name,String image,Double price,String description,Integer quantity,Integer id);
	void update(String name,String image,Double price,String description,Integer quantity,String categoryId,Integer colorId,Integer id);
}
