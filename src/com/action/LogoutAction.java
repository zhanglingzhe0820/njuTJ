package com.action;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

public class LogoutAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	public String execute() throws Exception{
		ServletActionContext.getResponse().addCookie(new Cookie("njuTJ","none"));;
		return SUCCESS;
	}

}