package com.model;

public class User {
	
	private int id;  
    private String qq;  
    private String phone;
    private String number;
    private String department;
    private String name;
    private String position;
    
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	public void setNumber(String number){
		this.number=number;
	}
	
	public String getNumber(){
		return number;
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
	
	public void setPosition(String position){
		this.position=position;
	}
	
	public String getPosition(){
		return position;
	}
    
}
