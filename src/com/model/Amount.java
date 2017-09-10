package com.model;

public class Amount {

	private int id;
	private String event;
	private int amount;
	
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
}
