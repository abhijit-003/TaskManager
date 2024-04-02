package com.updateprofile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.daoClass;

@WebServlet("/updateProfile_Process")
public class updateProfile_Process extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		daoClass user = new daoClass(session);
		String uname = request.getParameter("name");
		String uemail = request.getParameter("username");
		String upass = request.getParameter("password");
		String udob = request.getParameter("dob");
		String ugender = request.getParameter("gender");
		String old_uemail = session.getAttribute("username").toString();
		if(user.updateProfile(uname,uemail,upass,udob,ugender,old_uemail)) {
			response.sendRedirect("user/profile.jsp");
		}else {
			response.sendRedirect("user/error.jsp");
		}
	}

}
