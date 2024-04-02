package com.tasks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.daoClass;

@WebServlet("/delete_task_process")
public class delete_task_process extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("taskID");
		daoClass user = new daoClass(request.getSession());
		if(user.deleteTask(Integer.parseInt(id))) {
			response.sendRedirect("user/tasks.jsp");
		}else {
			response.sendRedirect("user/error.jsp");
		}
		System.out.println(id);
	}

}
