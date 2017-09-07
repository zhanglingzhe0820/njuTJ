package com.action;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.CookiesAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.service.UserService;

public class LoginAction extends BaseAction{

	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	
	private String qq;
	private String phone;
	private String department;
	private String name;
	
	@SuppressWarnings("deprecation")
	public String execute() throws Exception{
		Cookie cookie=new Cookie("njuTj",qq+"_"+phone+"_"+URLEncoder.encode(department)+"_"+URLEncoder.encode(name));
		cookie.setMaxAge(60*60*24);
		ServletActionContext.getResponse().addCookie(cookie);
		return SUCCESS;
	}
	
	public void setQq(String qq){
		this.qq=qq;
	}
	
	public String getQq(){
		return qq;
	}
	
	public void setPhone(String phone){
		this.phone=phone;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public void setDepartment(String department){
		this.department=department;
	}
	
	public String getDepartment(){
		return department;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getName(){
		return name;
	}
	
	public void validate(){
		if(qq==null||qq.length()==0||phone==null||phone.length()==0||department==null||department.length()==0||name==null||name.length()==0){
			this.addActionError("has empty text");
		}
		
	}
}
