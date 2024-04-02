<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="../css/register-style.css">
    <style>
    #backBtn {
    font-size: 40px;
    color: black;
    border: none;
    padding: 0px 10px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
    margin-left: 20px;	
    margin-top: 10px;
}

#backBtn:hover {
    color: #555;
}
    
    </style>
</head>
<body>
<button id="backBtn" onclick="goBack()"> &#8592;</button>
<script>
function goBack() {
    window.history.back();
}
</script>

<div class="register-container">
    <h2>Register</h2>
    <form action="${pageContext.request.contextPath}/registerUser" method="post">
        <div class="input-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="input-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="ugender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
        </div>
        <div class="input-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>
        </div>
        <div class="input-group">
            <label for="username">Username (Email):</label>
            <input type="email" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="button-group">
            <button type="submit" class="btn-register">Register</button>
            <button type="button" class="btn-clear">Clear</button>
        </div>
    </form>
    <p>Already have an account? <br><a href="login.jsp">Login here</a>.</p>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>
