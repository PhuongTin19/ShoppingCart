package com.tin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tin.dao.ProductDAO;
import com.tin.entity.Category;
import com.tin.entity.Color;
import com.tin.entity.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDao;
	
	@Override
	public List<Product> findAll() {
		return productDao.findAll();
	}

	@Override
	@Transactional
	public void deleteLogical(String name) {
		productDao.deleteLogical(name);
	}

	@Override
	@Transactional
	public void update(String name, String image, Double price, String description, Integer quantity, String categoryId,
			Integer colorId, Integer id) {
		productDao.update(name, image, price, description, quantity, categoryId, colorId, id);
		
	}

//	@Override
//	@Transactional
//	public void update(String name, String image, Double price, String description, Integer quantity, Integer id) {
//		productDao.update(name, image, price, description, quantity, id);
//	}

	

	

	


}
