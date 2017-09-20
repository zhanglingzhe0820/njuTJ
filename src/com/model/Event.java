package com.model;

public class Event {
	
	private int id;
	private String event;
	private String number;
	private int time;
	private float timeLength;
	
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
	
	public void setTime(int time){
		this.time=time;
	}
	
	public int getTime(){
		return time;
	}
	
	public void setTimeLength(float timeLength){
		this.timeLength=timeLength;
	}
	
	public float getTimeLength(){
		return timeLength;
	}
}
