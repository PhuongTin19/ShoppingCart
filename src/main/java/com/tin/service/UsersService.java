package com.tin.service;

import java.util.List;

import com.tin.entity.Account;

public interface UsersService {
	
	List<Account>findAll();
	void deleteLogical(String username);
	void update(String email,String password,String fullname,String image,String username);
	void insert(String username,String email,String password,String fullname,String image,boolean admin,boolean isDeleted);
	Account findByUsername(String username);
}
