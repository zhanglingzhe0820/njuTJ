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
	public boolean login(String name, String password) {
		User user=userDao.getUserByName(name);
		
		if(user!=null){
			if(password.equals(user.getPwd())){
				return true;
			}
		}
		
		return false;
	}

}
