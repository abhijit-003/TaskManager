package com.login;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.result.ResultSetMetaData;
import com.mysql.cj.xdevapi.Statement;

public class daoClass {
	checkConnection con = new checkConnection();
	Connection conn;
	HttpSession session;
	PreparedStatement statement;
	Statement stm;
	String query;
	ResultSet rs;
	public daoClass(HttpSession s){
		session = s;
	}
	
	//for login
	public boolean isAuthenticate(String username,String password) {
		query = "select * from user where uemail=?";
		try {
			conn = con.establishConncetion();
			if(conn==null) {
				session.setAttribute("error", "connection is null...");
				System.out.println("connection is null...");
				return false;
			}
			statement = conn.prepareStatement(query);
			statement.setString(1,username);
			
			rs = statement.executeQuery();
			System.out.println(statement);
			ResultSetMetaData metadata = (ResultSetMetaData) rs.getMetaData();
			int columns = metadata.getColumnCount();
			System.out.println("count :"+columns);
			if(rs.next()) {
				String password1 = rs.getString("upass");
				if(password1.equals(password)) {
					session.setAttribute("username", username);
					session.setAttribute("password", password1);
					session.setAttribute("name", rs.getString("uname"));
					session.setAttribute("gender", rs.getString("ugender"));
					session.setAttribute("dob", rs.getString("udob"));
					//conn.close();
					return true;
				}else {
					session.setAttribute("error", "wrong pass...");
				}
			}else {
				session.setAttribute("error", "wrong username...");
			}
					
		} catch (SQLException e) {
			session.setAttribute("error", e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	//update profile
	public boolean updateProfile(String name,String username,String password,String dob,String gender,String old_username) {
		try {
			conn = con.establishConncetion();
			query = "UPDATE user SET uemail=?,upass=?,uname=?,ugender=?,udob=? where uemail=?";
			statement = conn.prepareStatement(query);
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, name);
			statement.setString(4, gender);
			statement.setString(5, dob);
			statement.setString(6, old_username);
			try {
				statement.executeUpdate();
				session.setAttribute("name",name);
				session.setAttribute("username",username);
				session.setAttribute("password",password);
				session.setAttribute("gender",gender);
				session.setAttribute("dob",dob);
				session.setAttribute("error","NO Error...");
				System.out.println("done..");
				return true;
			}catch (Exception e) {
				session.setAttribute("error", e.getMessage());
			}
			System.out.println("done statement");
		}catch (Exception e) {
			session.setAttribute("error", e.getMessage());
		}
		return false;
	}
	
	//register user
	public boolean addUser(String username,String password,String name,String gender,String dob) {
		try {
		conn = con.establishConncetion();
		query = "INSERT INTO user VALUE(?,?,?,?,?)";
		statement = conn.prepareStatement(query);
		statement.setString(1, username);
		statement.setString(2, password);
		statement.setString(3, name);
		statement.setString(4, gender);
		statement.setString(5, dob);
		statement.executeUpdate();
		session.setAttribute("error", "NO Error..");
		return true;
		}catch (Exception e) {
			session.setAttribute("error", e);
		}
		return false;
	}
	public boolean addTask(String task_name,String task_details,String task_status,String category) {
		
		try {
			conn = con.establishConncetion();
			String username = session.getAttribute("username").toString();
			int cat_id = 1;
			try {
				query =  "select id from task_category where category=?";
				statement = conn.prepareStatement(query);
				statement.setString(1, category);
				rs = statement.executeQuery();
				while(rs.next()) {
					System.out.println("category id:"+cat_id);
					cat_id = rs.getInt("cat_id");
				}
			}catch (Exception e) {
				session.setAttribute("error", e.getMessage());
			}
			query = "INSERT INTO tasks(task_name, task_details, task_status, cat_id, username) VALUES (?, ?, ?, ?, ?)";
	        statement = conn.prepareStatement(query);
	        statement.setString(1, task_name);
	        statement.setString(2, task_details);
	        statement.setString(3, task_status);
	        statement.setInt(4, cat_id);
	        statement.setString(5, username);
	        statement.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("error: "+ e);
			session.setAttribute("error", e.getMessage());
		}
		return false;
	}
	public boolean deleteTask(int task_id) {
		try {
			conn = con.establishConncetion();
			query = "delete from tasks where task_id = ?";
			statement = conn.prepareStatement(query);
			statement.setInt(1, task_id);
			statement.execute();
			return true;
		}catch (Exception e) {
			System.out.println("error: "+ e);
			session.setAttribute("error", e.getMessage());
		}
		return false;
	}
	public boolean getTask(int task_id) {
		try {
			conn = con.establishConncetion();
			String username = (String) session.getAttribute("username");
			query = "select task_name,task_details,task_status,cat_id from tasks where username = ? AND task_id = ?";
			statement = conn.prepareStatement(query);
			statement.setString(1, username);
			statement.setInt(2, task_id);
			rs = statement.executeQuery();
			
			while(rs.next()) {
				session.setAttribute("task_id", task_id);
				session.setAttribute("task_name", rs.getString("task_name"));
				session.setAttribute("task_details",rs.getString("task_details"));
				session.setAttribute("task_status",rs.getString("task_status"));
				int cat_id = rs.getInt("cat_id");
				
				String query1 = "select category from task_category where cat_id = ?";
				PreparedStatement stm = conn.prepareStatement(query1);
				stm.setInt(1, cat_id);
				ResultSet rs1 = stm.executeQuery();
				while(rs1.next())
					session.setAttribute("category",rs1.getString("category"));
			}
			return true;
		}catch (Exception e) {
			System.out.println("error: "+ e);
			session.setAttribute("error", e.getMessage());
		}
		return false;
	}
	public boolean updateTask(String task_name,String task_details,String task_category,String task_status) {
		try {
			daoClass dao = new daoClass(session);
			conn = con.establishConncetion();
			String username = (String) session.getAttribute("username");
			int task_id = Integer.parseInt(session.getAttribute("task_id").toString());
			query = "UPDATE tasks \n"
					+ "SET task_name = ?, task_details = ?, task_status = ?, cat_id = ? \n"
					+ "WHERE username = ? AND task_id = ?;\n"
					+ "";
			statement = conn.prepareStatement(query);
	        statement.setString(1, task_name);
	        statement.setString(2, task_details);
	        statement.setString(3, task_status);
	        int cat_id = dao.getCatId(task_category);
	        statement.setInt(4, cat_id);
	        statement.setString(5, username);
	        statement.setInt(6, task_id);
	        statement.executeUpdate();
			return true;
		}catch (Exception e) {
			System.out.println("error: "+ e);
			session.setAttribute("error", e.getMessage());
		}
		return false;
	}
	
	public int getCatId(String category) {
		try {
			conn = con.establishConncetion();
			String query1 = "select cat_id from task_category where category = ?";
			PreparedStatement stm = conn.prepareStatement(query1);
			stm.setString(1, category);
			ResultSet rs1 = stm.executeQuery();
			while(rs1.next())
				return rs1.getInt("cat_id");
		}catch (Exception e) {
			System.out.println("error: "+ e);
			session.setAttribute("error", e.getMessage());
		}
		return 0;
	}
	
	public String getTaskCategory(int cat_id) {
		try {
			conn = con.establishConncetion();
			String query1 = "select category from task_category where cat_id = ?";
			PreparedStatement stm = conn.prepareStatement(query1);
			stm.setInt(1, cat_id);
			ResultSet rs1 = stm.executeQuery();
			while(rs1.next())
				return rs1.getString("category");
			
		}catch (Exception e) {
			System.out.println("error: "+ e);
			session.setAttribute("error", e.getMessage());
		}
		return "";
	}
}
