package com.model;

public class Amount {

	private int id;
	private String event;
	private int canRegister;
	private int recentTime;
	private String realName;
	private String info;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setEvent(String event){
		this.event=event;
	}
	
	public String getEvent(){
		return event;
	}
	
	public void setCanRegister(int canRegister){
		this.canRegister=canRegister;
	}
	
	public int getCanRegister(){
		return canRegister;
	}
	
	public void setRecentTime(int recentTime){
		this.recentTime=recentTime;
	}
	
	public int getRecentTime(){
		return recentTime;
	}
	
	public void setRealName(String realName){
		this.realName=realName;
	}
	
	public String getRealName(){
		return realName;
	}
	
	public void setInfo(String info){
		this.info=info;
	}
	
	public String getInfo(){
		return info;
	}
}
