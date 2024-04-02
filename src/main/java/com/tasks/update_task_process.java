package com.tasks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.daoClass;


@WebServlet("/update_task_process")
public class update_task_process extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String task_name = request.getParameter("task_name");
		String task_details = request.getParameter("task_details");
		String task_category = request.getParameter("category");
		String task_status = request.getParameter("status");
		
		daoClass user = new daoClass(request.getSession());
		if(user.updateTask(task_name,task_details,task_category,task_status)) {
			response.sendRedirect("user/tasks.jsp");
		}else {
			response.sendRedirect("user/error.jsp");
		}
	}

}
