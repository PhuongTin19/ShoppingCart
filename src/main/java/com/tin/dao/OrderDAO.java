package com.tin.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tin.entity.Order;


public interface OrderDAO extends JpaRepository<Order, Long>{
	
	//Tổng lượt mua hàng
	@Query(value="select count(*) from Orders",nativeQuery=true)
	Integer countCustomer();
	//truy vấn đơn hàng phân trang
	@Query(value="select * from orders Order by id Desc",nativeQuery=true)
	Page<Order>donHang(Pageable pageable);
	//lịch sử người mua
	@Query(value="select * from orders where username=?1",nativeQuery=true)
	List<Order>history(String username);
}
 