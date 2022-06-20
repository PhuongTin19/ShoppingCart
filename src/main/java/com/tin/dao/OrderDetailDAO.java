package com.tin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tin.dto.CartDetailDto;
import com.tin.entity.OrderDetail;



public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	
	@Query(value="SELECT o.*,p.Image,p.Name FROM OrderDetails o\r\n"
			+ "inner join products p on o.ProductId = p.id\r\n"
			+ "WHERE o.id = ?1",nativeQuery = true)
	List<OrderDetail> findById(int id);
	//checkout
	@Modifying(clearAutomatically = true)
	@Query(value = "INSERT INTO OrderDetails(orderId,ProductId,price,quantity) "
			+ "VALUES(:#{#cartDetail.orderId},:#{#cartDetail.productId},"
			+ ":#{#cartDetail.price},:#{#cartDetail.quantity})" ,nativeQuery = true)
	void insert(@Param("cartDetail") CartDetailDto dto);
	//Tổng thu nhập
	@Query(value="select FORMAT(sum(OrderDetails.Price),'C') as 'sum' from OrderDetails \r\n"
			+ "inner join Products on OrderDetails.ProductId = Products.Id ",nativeQuery = true)
	String sumRevenue();
	//Tổng sản phẩm bán được
	@Query(value="select sum(OrderDetails.Quantity) as 'sum' from OrderDetails \r\n"
			+ "inner join Products on OrderDetails.ProductId = Products.Id " , nativeQuery=true)
	Integer sumProduct();
	
	
}