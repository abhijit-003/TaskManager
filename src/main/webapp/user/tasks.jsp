<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/task-table-style.css">
<link rel="stylesheet" type="text/css" href="../css/update-profile-style.css">
    <script src="../jsincludes/logout-button.js"></script>
<script src="../jsincludes/task-edit.js"></script>
<style>
#add-btn {
    padding: 5px 10px;
    border: ;
    height: 40px;
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 10px;
}
.Done {
    background-color: #4CAF50;
    color: white;
}

.Pending {
    background-color: #ff9800;
    color: white;
}

.Progress {
    background-color: #2196F3;
    color: white;
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
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>



	
 <div class="container">
        <h1>Task Management</h1>
        <button class='edit-btn' id='add-btn'>Add Tasks</button></td>
        <table class="task-table">
            <thead>
                <tr>
                	<th>Id</th>
                    <th>Status</th>
                    <th>Task Name</th>
                    <th>Task Details</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            
            <tbody>
         
       	<%

// Define the database connection parameters
String url = "jdbc:mysql://localhost:3306/TaskManager";
String username = "root";
String password = "root";

Connection conn = null;
Statement stmt = null;
PreparedStatement statement=null;
ResultSet rs = null;
String id;
session = request.getSession();

try {
    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");
    
    // Establish the database connection
    conn = DriverManager.getConnection(url, username, password);
    
	
    // Execute a SQL query
    statement = conn.prepareStatement("SELECT * FROM tasks where username=?");
    statement.setString(1,session.getAttribute("username").toString());
    rs = statement.executeQuery();
    // Process the query results
     while (rs.next()) {
        // Retrieve data from the result set
        int task_id = rs.getInt("task_id");
        String task_name = rs.getString("task_name");
        String task_details = rs.getString("task_details");
        Date date = rs.getDate("task_date");
        String status = rs.getString("task_status");
        int cat_id = rs.getInt("cat_id");
        id = task_name;
        String category = "";
        
        statement = conn.prepareStatement("select category from task_category where cat_id=?");
    	statement.setInt(1, cat_id);
    	ResultSet rs1 = statement.executeQuery();
    	while(rs1.next()) {
    		category = rs1.getString("category");
    	}
        // Output the data or perform further processingc
        out.println("<tr>");
        out.println("<td>"+ task_id +"</td>");
        
        out.println("<td>");
  		out.println("<select id='category' class="+status+" name='status'>");
  		out.println("<option value="+status+">"+status+"</option>");
  		out.println("<option class='done' value='Done'>Done</option>");
        out.println("<option class='Pending' value='Pending'>Pending</option>");
        out.println("<option value='Progress'>Progress</option>)");
        out.println("</select>");      
       // out.println("<td>"+ status +"</td>");
        out.println("</td>");
        out.println("<td>"+ task_name +"</td>");
        out.println("<td>"+ task_details +"</td>");
        out.println("<td>"+ category +"</td>");
        out.println("<td>"+ date +"</td>");
        out.println("<form action='../update_task_getdata' method='post'>");
        out.println("<td><button class='edit-btn1' name='taskID' value="+task_id+">Update</button></td>");
        out.println("</form>");
        out.println("<form action='../delete_task_process' method='post'>");
        out.println("<td><button type='submit' id='logoutBtn' name='taskID' value="+task_id+">Delete</button></td>");
        out.println("</form>");
        out.println("</tr>");
        //System.out.println("ID: " + task_id + ", Name: " + task_name+ " Task Details: "+task_details+ " Creation Date: "+date+" Task Status: "+status);
    } 
} catch (Exception e) {
    // Handle any exceptions
    out.println("Error: " + e.getMessage());
}
%>

         
                <!-- Add more rows as needed -->
            </tbody>
        </table><br>
        
    </div>
    
<div class="container">
</div>
    <!-- Edit Popup -->
    <div id="edit-popup" class="popup">
        <div class="popup-content">
            <span class="close-btn">&times;</span>
            <h2>Edit Task</h2>
            <form action="../add_task_process" method = "post">
                <label for="task-name">Name:</label>
                <input type="text" id="task-name" name="task-name" required>
                <label for="task-details">Details:</label>
                <textarea id="task-details" name="task-details" rows="4" required></textarea>
                <label for="category">Category:</label>
                <select id="category" name="category" required>
                    <option value="School">School</option>
                    <option value="College">College</option>
                    <option value="Office">Office</option>
                    <option value="Home">Home</option>
                    <option value="Other">Other</option>
                </select>
                <label for="category">Status:</label>
                <select id="category" name="status">
                    <option value="Done">Done</option>
                    <option value="Pending">Pending</option>
                    <option value="Progress">Progress</option>
                </select>
                <button type="submit" class="save-btn">Save</button>
            </form>
        </div>
    </div>

 <script>

/**
 * 
 */
 
 
//Get the edit popup element
var editPopup = document.getElementById('edit-popup');

// Get the button that opens the edit popup
var editBtns = document.querySelectorAll('.edit-btn');

// Get the <span> element that closes the edit popup
var closeBtn = document.getElementsByClassName('close-btn')[0];

// When the user clicks on the edit button, open the edit popup
editBtns.forEach(function(btn) {
    btn.onclick = function() {
        editPopup.style.display = 'block';
    }
});

// When the user clicks on <span> (x), close the edit popup
closeBtn.onclick = function() {
    editPopup.style.display = 'none';
}

// When the user clicks anywhere outside of the edit popup, close it
window.onclick = function(event) {
    if (event.target == editPopup) {
        editPopup.style.display = 'none';
    }
};

// When the user presses the Escape key, close the edit popup
document.onkeydown = function(event) {
    if (event.key === 'Escape') {
        editPopup.style.display = 'none'; // Close the edit popup
    }
};
</script>

<script>

</script>

<%-- <%@ include file="../includes/footer.jsp" %> --%>
</body>
</html>