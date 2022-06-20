package com.tin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tin.dao.AccountDAO;
import com.tin.entity.Account;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	AccountDAO accountDao;
	
	@Override
	public List<Account> findAll() {
		return accountDao.findAll();
	}

	@Override
	@Transactional
	public void deleteLogical(String username) {
		accountDao.deleteLogical(username);
	}


	@Override
	public Account findByUsername(String username) {
		return accountDao.findByUsername(username);
	}

	@Override
	@Transactional
	public void update(String email,String password,String fullname,String image,String username) {
			accountDao.update(email, password, fullname, image, username);
		}

	@Override
	public void insert(String username, String email, String password, String fullname, String image,boolean admin,boolean isDeleted) {
		accountDao.insert(username, email, password, fullname, image,admin,isDeleted);
		
	}
}


