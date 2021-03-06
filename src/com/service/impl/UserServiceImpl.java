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
	public String signUp(String qq, String phone, String number, String department, String name) {
		return userDao.insertUser(qq,phone,number,department,name);
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
			e.printStackTrace();
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
			e.printStackTrace();
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
	public String loadAmount() {
		try{
			return userDao.loadAmount();
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	public boolean startRegister(String recentTime,String event) {
		try{
			return userDao.startRegister(recentTime,event);
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean stopRegister(String recentTime,String event) {
		try{
			return userDao.stopRegister(recentTime,event);
		}
		catch(Exception e){
			return false;
		}
	}

	@Override
	public String loadArrange() {
		try{
			return userDao.loadArrange();
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	public String submitLength(String lengthMessages) {
		try{
			return userDao.submitLength(lengthMessages);
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	public boolean addEvent(String realName, String event, String recentTime) {
		try{
			userDao.addEvent(realName,event,recentTime);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public String loadDescribe(String event) {
		try{
			return userDao.loadDescribe(event);
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	public String updateDescribe(String info) {
		try{
			return userDao.updateDescribe(info);
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	public String updateWholeInfo(String kind,String content) {
		try{
			return userDao.updateWholeInfo(kind,content);
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	
	@Override
	public String loadWholeInfo(String kind) {
		try{
			return userDao.loadWholeInfo(kind);
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

	@Override
	public String updateUserInfo(String userInfo) {
		try{
			return userDao.upLoadUserInfo(userInfo);
		}
		catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
}
