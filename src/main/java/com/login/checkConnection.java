package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class checkConnection {
	public Connection establishConncetion() {
		String url = "jdbc:mysql://localhost:3306/TaskManager";
		String username = "root";
		String password = "root";
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
