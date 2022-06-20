package com.tin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tin.entity.Order;

public interface StatsDAO extends JpaRepository<Order, Long> {

	@Query(value = "{CALL sp_getTotalPricePerMonth(:month, :year)}", nativeQuery = true)
	String getTotalPricePerMonth(@Param("month") String month, @Param("year") String year);
}
