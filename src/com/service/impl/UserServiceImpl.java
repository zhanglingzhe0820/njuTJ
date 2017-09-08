package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.User;
import com.service.UserService;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(String number) {
		User user=userDao.getUserByNumber(number);
		return user;
	}

	@Override
	public boolean signUp(String qq, String phone, String number, String department, String name) {
		userDao.insertUser(qq,phone,number,department,name);
		return true;
	}
	
	

}
