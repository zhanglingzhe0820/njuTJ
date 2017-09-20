package com.service;

import com.model.User;

public interface UserService {

	public User login(String number);
	public boolean signUp(String qq, String phone, String number, String department, String name);
	public String register(String event,String number);
	public String drop(String event,String number);
	public String load(String number);
	public String loadAmount();
	public String loadArrange();
	public boolean startRegister(String recentTime,String event);
	public boolean stopRegister(String recentTime,String event);
	public String submitLength(String lengthMessages);
	public boolean addEvent(String realName,String event,String recentTime);
}
