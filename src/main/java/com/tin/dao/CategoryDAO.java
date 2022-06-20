package com.tin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tin.entity.Category;
import com.tin.entity.Product;



public interface CategoryDAO extends JpaRepository<Category, String>{
	
//	@Query(value="SELECT * FROM Categories \r\n"
//			+ "inner join Products \r\n"
//			+ "on Categories.id = Products.CategoryId\r\n"
//			+ "WHERE Products.Id=?1",nativeQuery = true)
//	List<Category> findByCategoryId(int id);
	
	
	@Query(value="SELECT * FROM Categories \r\n"
			+ "inner join Products \r\n"
			+ "on Categories.id = Products.CategoryId\r\n"
			+ "WHERE Products.Id=?1",nativeQuery = true)
	Category findByCategoryId(int id);

	
}
