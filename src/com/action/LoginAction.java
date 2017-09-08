package com.action;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.model.User;
import com.service.UserService;

public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	
	private String number;
	
	@SuppressWarnings("deprecation")
	public String execute(){
		User user;
		if((user=userService.login(number))!=null){
			Cookie cookie=new Cookie("njuTJ",user.getQq()+"_"+user.getPhone()+"_"+user.getNumber()+"_"+URLEncoder.encode(user.getDepartment())+"_"+URLEncoder.encode(user.getDepartment()));
			cookie.setMaxAge(60*60*24);
			ServletActionContext.getResponse().addCookie(cookie);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public void setNumber(String number){
		this.number=number;
	}
	
	public String getNumber(){
		return number;
	}
	
	public void validate(){
		if(number==null||number.length()==0){
			this.addActionError("empty number");
		}
	}

}
