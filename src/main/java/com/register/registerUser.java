package com.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.daoClass;

@WebServlet("/registerUser")
public class registerUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("registeUser called...");
		HttpSession session = request.getSession();
		daoClass user = new daoClass(session);
		String uname = request.getParameter("name");
		String uemail = request.getParameter("username");
		String upass = request.getParameter("password");
		String udob = request.getParameter("dob");
		String ugender = request.getParameter("gender");
		if(user.addUser(uemail,upass,uname,ugender,udob)) {
			response.sendRedirect("user/login.jsp");
		}else {
			response.sendRedirect("user/error.jsp");
		}
	}

}
