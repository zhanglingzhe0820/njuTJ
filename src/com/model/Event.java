package com.model;

public class Event {
	
	private int id;
	private String event;
	private String number;
	
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
	
	public void setNumber(String number){
		this.number=number;
	}
	
	public String getNumber(){
		return number;
	}

}
