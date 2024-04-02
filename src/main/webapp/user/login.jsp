<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../css/login-style.css">
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

<div class="login-container">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/login_process" method="post">
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="email" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="button-group">
            <button type="submit" class="btn-login">Login</button>
            <button type="button" class="btn-clear">Clear</button>
        </div>
    </form>
    <p>Don't have an account?<br> <a href="register.jsp">Register here</a>.</p>
</div>

</body>
</html>
