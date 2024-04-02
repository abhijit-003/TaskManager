package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login_process")
public class login_process extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		daoClass user = new daoClass(session); //dao class for JDBC operations
		
		if(user.isAuthenticate(username, password)) {
			response.sendRedirect("user/home.jsp");
		}else {
			response.sendRedirect("user/error.jsp");
		}
		System.out.println("login credential: username :"+username+" Password :"+password);
	}

}
