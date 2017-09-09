package com.service.impl;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.model.User;
import com.service.UserService;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	private UserDao userDao=new UserDaoImpl();
	
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

	@Override
	public String register(String event, String number) {
		try{
			if(userDao.register(event, number)){
				return "success";
			}
			else{
				return "already";
			}
		}
		catch(Exception e){
			return "error";
		}
	}

	@Override
	public String drop(String event, String number) {
		try{
			if(userDao.drop(event, number)){
				return "success";
			}
			else{
				return "fail";
			}
		}
		catch(Exception e){
			return "error";
		}		
	}

	@Override
	public String load(String number) {
		try{
			return userDao.load(number);
		}
		catch(Exception e){
			return "error";
		}		
	}

	@Override
	public int loadAmount(String event) {
		try{
			return userDao.getAmountByEvent(event);
		}
		catch(Exception e){
			return -1;
		}
	}
}
