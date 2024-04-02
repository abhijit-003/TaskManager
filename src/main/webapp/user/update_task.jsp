<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

/* Popup styles */
.popup {
    display: block;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent background */
}

.popup-content {
    background-color: #fefefe; /* White background */
    margin: 10% auto; /* Center the popup vertically */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Set the width of the popup */
}

.close-btn {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close-btn:hover,
.close-btn:focus {
    color: black;
    text-decoration: none;
}

/* Styles for the form inside the popup */
form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 10px;
}

input[type="text"],
textarea,
select {
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

button[type="submit"],
button.close-btn {
    padding: 10px 20px;
    background-color: #007bff; /* Blue */
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button[type="submit"]:hover,
button.close-btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
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
session = request.getSession();
%>
<div id="edit-popup" class="popup">
        <div class="popup-content">
       
            <h2>Update Task</h2>
            <form action="../update_task_process" method = "post">
                <label for="task-name" >Name:</label>
                
                <input type="text" id="task-name" name="task_name" value="<%=session.getAttribute("task_name") %>" required>
                <label for="task-details">Task:</label>
                <textarea id="task-details" name="task_details" rows="4" required><%=session.getAttribute("task_details") %></textarea>
                <label for="category">Category:</label>
                <select id="category" name="category" required>
                	<option value="<%=session.getAttribute("category") %>" default><%=session.getAttribute("category") %></option>
                    <option value="School">School</option>
                    <option value="College">College</option>
                    <option value="Office">Office</option>
                    <option value="Home">Home</option>
                    <option value="Other">Other</option>
                </select>
                <label for="category">Status:</label>
                <select id="category" name="status">
                	<option value="<%=session.getAttribute("task_status") %>" default><%=session.getAttribute("task_status") %></option>
                    <option value="Done">Done</option>
                    <option value="Pending">Pending</option>
                    <option value="Progress">Progress</option>
                </select>
                <button type="submit" class="save-btn">Save</button>
            </form>
        </div>
    </div>
  
</body>
</html>