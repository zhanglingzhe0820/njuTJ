package com.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.service.UserService;

public class LoginAction extends BaseAction {

	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	
	private String username;
	private String password;

	public String execute() throws Exception{
		if(userService.login(username, password)){
			return "success";
		}
		return "error";
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
}
