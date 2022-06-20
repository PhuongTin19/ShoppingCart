package com.tin.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tin.entity.Account;



public interface AccountDAO extends JpaRepository<Account, String>{
	Account findByUsername(String username);
	//
	@Query("SELECT o.password FROM Account o WHERE Email= ?1 ")
	String findByEmail(String email);
	//
	@Query("SELECT o FROM Account o WHERE username = ?1 and password = ?2")
	Account login(String username,String password);
	//lấy danh sách user(những user chưa bị xóa)
	@Query(value="SELECT * FROM Accounts where admin = 1 and isDeleted =0",nativeQuery=true)
	List<Account>findAll();
	
	//Xóa user
	@Modifying(clearAutomatically = true)
	@Query(value = "Update Accounts SET isDeleted = 1 WHERE username = ?",nativeQuery=true)
	void deleteLogical(String username);
	
	//update tài khoản admin
	@Modifying(clearAutomatically = true)
	@Query(value = "Update Account set email = ?1,password=?2,fullname = ?3,image=?4 where username = ?5")
	void update(String email,String password,String fullname,String image,String username);
	//Thêm admin
	@Modifying(clearAutomatically = true)
	@Query(value = "Insert into Accounts(username,email,password,fullname,image,admin,isdeleted) Values(username=?1,email = ?2,password=?3,fullname = ?4,image=?5,admin=?6,isdeleted=?7",
			nativeQuery=true)
	void insert(String username,String email,String password,String fullname,String image,boolean admin,boolean isDeleted);
	
}
