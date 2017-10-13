package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.model.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private UserService userService=new UserServiceImpl();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String number=request.getParameter("number");
		PrintWriter out=response.getWriter();
		String result="";
		User user;
		if(number==null||number.length()==0){
			result="empty";
		}
		else{
			user=userService.login(number);
			if(user!=null){
				Cookie cookie=new Cookie("njuTJ",user.getQq()+"_"+user.getPhone()+"_"+user.getNumber()+"_"+URLEncoder.encode(user.getDepartment())+"_"+URLEncoder.encode(user.getDepartment()));
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				result="success";
			}
			else{
				result="error";
			}
		}
		out.write(result);
		out.flush();
	}

}
