
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" type="text/css" href="../css/home-style.css">
    <link rel="stylesheet" type="text/css" href="../css/logout-button-style.css">
    <link rel="stylesheet" type="text/css" href="../css/update-profile-style.css">
    <script src="../jsincludes/logout-button.js"></script>
    <script src="../jsincludes/update-profile.js"></script>
    <style>
    	body{
    		background-color: #DEF2F1;
    	}
    </style>
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
    <div class="container">
    <div class="navbar">
        <h2>User Profile</h2>
        <div class="profile-info">
        <center>
        <table>
        	<tr>
        	<td><label>Name:</label></td>
            <td><span>${sessionScope.name}</span></td>
            </tr>
            <tr>
        	<td><label>Username:</label></td>
            <td><span>${sessionScope.username}</span></td>
            <tr>
        	<td><label>Password:</label></td>
            <td><span>${sessionScope.password}</span></td>
            </tr>
            <tr>
            <td><label>Gender:</label></td>
            <td><span>${sessionScope.gender}</span>
            </tr>
            <tr>
            <td><label>Date of Birth:</label></td>
            <td><span>${sessionScope.dob}</span></td>
            </tr>
            </table>
            </center>
        </div>
        
  		
  		
  		

    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close" onclick="closePopup()">&times;</span>
            <h2>Update Profile</h2>
            <form action="../updateProfile_Process" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${sessionScope.name}" required><br><br>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${sessionScope.username}" required><br><br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="${sessionScope.password}" required><br><br>

                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="${sessionScope.dob}" required><br><br>

                <label for="gender">Gender:</label>
                <select id="gender" value="${sessionScope.gender}"name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select><br><br>
                	<button type="submit" class="save-btn">Save</button>
                
                <button type="button" class="cancel-btn" onclick="closePopup()">Cancel</button>
            </form>
        </div>
    </div>
	
        <div class="logout">
        <button id="updateBtn" class="update-btn" onclick="openPopup()">Update Profile</button>
            <button id="logoutBtn">Log Out</button>
            <div id="confirmPopup" class="popup">
                <div class="popup-content">
                    <span class="close">&times;</span>
                    <p>Are you sure you want to log out?</p>
                    <form action="${pageContext.request.contextPath}/logout_process" method="post">
                    	<button id="confirmLogout" type="submit">Logout</button>
                    	<button id="cancelLogout" type="button">Cancel</button> 
                    </form>
                </div>
            </div>
        </div>
      
    </div>
    </div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>
