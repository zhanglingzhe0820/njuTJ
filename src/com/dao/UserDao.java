package com.dao;

import com.model.User;

public interface UserDao {
	
	public User getUserByNumber(String number);
	public void insertUser(String qq,String phone,String number,String department,String name);
	public boolean register(String event,String number);
	public boolean drop(String event,String number);
	public String load(String number);
	public String loadAmount();
	public boolean stopRegister(String recentTime,String event);
	public boolean startRegister(String recentTime, String event);
	public String loadArrange();
	public String submitLength(String lengthMessages);
	public void addEvent(String realName, String event, String recentTime);
	public String loadDescribe(String event);
	public String updateDescribe(String info);
	public String updateWholeInfo(String kind, String content);
	public String loadWholeInfo(String kind);
	public String upLoadUserInfo(String userInfo);
}
