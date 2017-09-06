package com.action;

import org.apache.struts2.interceptor.CookiesAware;

public class LogoutAction extends BaseAction implements CookiesAware{
	
	private static final long serialVersionUID = 1L;
	
	private java.util.Map<String, String> cookies;
	
	public String execute() throws Exception{
		System.out.println(cookies);
		return SUCCESS;
	}

	@Override
	public void setCookiesMap(java.util.Map<String, String> cookies) {
		this.cookies=cookies;
	}

}
