package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class StartRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService=new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean temp=userService.startRegister(request.getParameter("recentTime"),request.getParameter("event"));
		String result="";
		if(temp){
			result="success";
		}
		else{
			result="fail";
		}
		PrintWriter out=response.getWriter();
		out.write(result);
		out.flush();
	}
}
