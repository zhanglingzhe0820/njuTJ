package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class SubmitLengthServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private UserService userService=new UserServiceImpl();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String result=userService.submitLength(request.getParameter("timeLength"));
		PrintWriter out=response.getWriter();
		out.write(result);
		out.flush();
	}

}
