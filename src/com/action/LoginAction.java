package com.action;

public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private String sNumber;
	
	public String execute(){
		return SUCCESS;
	}
	
	public void setSNumber(String sNumber){
		this.sNumber=sNumber;
	}
	
	public String getSNumber(){
		return sNumber;
	}
	
	public void validate(){
		if(sNumber==null||sNumber.length()==0){
			this.addActionError("wrong sNumber");
		}
	}

}
