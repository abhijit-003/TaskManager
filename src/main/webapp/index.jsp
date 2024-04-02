<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TaskManager</title>
    <link rel="stylesheet" href="css/index-style.css">
    <link rel="stylesheet" type="text/css" href="css/header-style.css">
    <style>
    
    </style>
</head>
<body>

<%
//to prevent back button login
		response.setHeader("cache-control","no-cache, no-store, must-revalidate");	//HTTP 1.1
		response.setHeader("pragma","no-cache");//HTTP 1.0	
		response.setHeader("Expires","0");//Proxies
%>
<%@ include file="../includes/dropdown.jsp" %>
    <div class="container">
        <div class="content">
            <h2>Welcome to TaskManager</h2>
            <h4>(Manage your tasks here)</h4>
            <form action="user/login.jsp">
                <input type="submit" value="Login">
            </form>
            <form action="user/register.jsp">
                <input type="submit" value="Register">
            </form>
        </div>
    </div>
    
<%@ include file="../includes/footer.jsp" %>
</body>
</html>
