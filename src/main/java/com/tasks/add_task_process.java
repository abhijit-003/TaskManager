package com.tasks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.daoClass;

@WebServlet("/add_task_process")
public class add_task_process extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("called app_task_process");
		daoClass user = new daoClass(request.getSession());
		String task_name = request.getParameter("task-name");
		String task_details = request.getParameter("task-details");
		String task_status = request.getParameter("status");
		String task_category = request.getParameter("category");
		if(user.addTask(task_name,task_details,task_status,task_category)) {
			response.sendRedirect("user/tasks.jsp");
		}else {
			response.sendRedirect("user/error.jsp");
		}
		
		
	}

}
