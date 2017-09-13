package com.model;

public class EventTime {

	private int id;
	private int time;
	private String event;
	private int num;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setTime(int time){
		this.time=time;
	}
	
	public int getTime(){
		return time;
	}
	
	public void setEvent(String event){
		this.event=event;
	}
	
	public String getEvent(){
		return event;
	}
	
	public void setNum(int num){
		this.num=num;
	}
	
	public int getNum(){
		return num;
	}
}
