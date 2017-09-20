package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class AddInnerEventAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private UserService userService=new UserServiceImpl();
	
	private String realName;
	private String event;
	private String recentTime;
	
	public String execute() throws Exception{
		if(userService.addEvent(realName,"_"+event,recentTime)){
			return SUCCESS;
		}
		return ERROR;
	}
	
	public void setRealName(String realName){
		this.realName=realName;
	}
	
	public String getRealName(){
		return realName;
	}
	
	public void setEvent(String event){
		this.event=event;
	}
	
	public String getEvent(){
		return event;
	}
	
	public void setRecentTime(String recentTime){
		this.recentTime=recentTime;
	}
	
	public String getRecentTime(){
		return recentTime;
	}

}

