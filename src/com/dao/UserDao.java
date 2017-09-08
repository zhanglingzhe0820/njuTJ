package com.dao;

import com.model.User;

public interface UserDao {
	
	public User getUserByNumber(String number);
	public void insertUser(String qq,String phone,String number,String department,String name);
}
