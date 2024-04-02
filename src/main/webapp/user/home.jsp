<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		if(session.getAttribute("username") == null)
			response.sendRedirect("../index.jsp");
		//to prevent back button login
		response.setHeader("cache-control","no-cache, no-store, must-revalidate");	//HTTP 1.1
		response.setHeader("pragma","no-cache");//HTTP 1.0	
		response.setHeader("Expires","0");//Proxies
%>

	<%@ include file="../includes/dropdown.jsp" %>
	
		<center><h1>Welcome home</h1></center>
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>
