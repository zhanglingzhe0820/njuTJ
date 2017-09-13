package com.action;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.model.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class AdminLoginAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private static final String USERNAME="67cab041a64cb148bf8e3bb0cbf3d49";
	private static final String PASSWORD="bdc0f377ef22d704290a19848f07edd";

	private String username;
	private String password;
	
	public String execute(){
		if(DigestMD5.getMD5Result(username).equals(USERNAME)&&DigestMD5.getMD5Result(password).equals(PASSWORD)){
			return SUCCESS;
		}
		return ERROR;
	}
	
	public void setUsername(String username){
		this.username=username;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void validate(){
		if(username==null||username.length()==0||password==null||password.length()==0){
			this.addActionError("empty number");
		}
	}
}
