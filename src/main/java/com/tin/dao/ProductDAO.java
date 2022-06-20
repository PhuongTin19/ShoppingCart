package com.tin.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.tin.entity.Account;
import com.tin.entity.Category;
import com.tin.entity.Color;
import com.tin.entity.Product;
import com.tin.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Integer>{

	//4 sản phẩm mới nhất
	@Query(value="SELECT top 4 * FROM products order by id desc", nativeQuery = true)
	List<Product> findTopNewProduct();
		
	//Lọc sản phẩm theo loại(không bao gồm những sản phẩm đã hết hàng hoặc đã xóa)
	@Query(value="SELECT * FROM Products Where categoryid = ?1 and isDeleted = 0  and Quantity > 0",nativeQuery = true)
	List<Product> findProductByCate(int id);
	
	//Tìm sản phẩm theo màu(không bao gồm những sản phẩm đã hết hàng hoặc đã xóa)
	@Query(value="SELECT * FROM Products where colorid = ?1 and isDeleted = 0  and Quantity > 0",nativeQuery = true)
	List<Product> findProductByColor(int id);
	
	//Tìm sản phẩm trên input search
	@Query(value="SELECT * FROM PRODUCTS where name like ?1 ",nativeQuery = true)
	List<Product> findProductByKeywords(String name);
	
	//Phân trang
	Page<Product> findAllByNameLike(String keywords, Pageable pageable);
	
	
	//Truy vấn list tất cả các sản phẩm(không bao gồm những sản phẩm đã hết hàng hoặc đã xóa)
	@Query(value="SELECT * FROM Products where isDeleted = 0  and Quantity > 0",nativeQuery = true)
	List<Product>findAllAvaiable();
	//
	@Query(value="SELECT * FROM PRODUCTS where id = ?1",nativeQuery = true)
	List<Product>findById(int id);
	
	//
	@Query(value="SELECT * FROM PRODUCTS where id = ?1",nativeQuery = true)
	Product findById2(int id);
	//Truy vấn theo khoảng giá
	List<Product> findByPriceBetween(double minPrice, double maxPrice);
	
	//Truy vấn id product --> giỏ hàng
	@Query(value="SELECT * FROM PRODUCTS where id = ?1",nativeQuery = true)
	Product findProductById(Long id);
	
	//update giỏ hàng mới sau khi checkout
	@Modifying(clearAutomatically = true)
	@Query(value = "UPDATE Products set quantity = ?1 where id = ?2",nativeQuery = true)
	void updateQuantity(Integer newQuantity, Integer productId);
	
	//Thống kê tồn kho
	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
			List<Report> getInventoryByCategory();
	//
	@Query(value="SELECT * FROM Products where isDeleted =0",nativeQuery=true)
	List<Product>findAll();
	//xóa sản phẩm
	@Modifying(clearAutomatically = true)
	@Query(value = "Update Products SET isDeleted = 1 WHERE name = ?",nativeQuery=true)
	void deleteLogical(String name);
	//update sản phẩm
	@Modifying(clearAutomatically = true)
	@Query(value = "Update Products set name = ?1,image=?2,price = ?3,description=?4,quantity=?5,categoryid=?6,colorid=?7 where id = ?8",nativeQuery=true)
	void update(String name,String image,Double price,String description,Integer quantity,String categoryId,Integer colorId,Integer id);
}

