package com.model;

public class Amount {

	private int id;
	private String event;
	private int amount;
	private int canRegister;
	private int recentTime;
	private String realName;
	
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
	
	public void setAmount(int amount){
		this.amount=amount;
	}
	
	public int getAmount(){
		return amount;
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
}
