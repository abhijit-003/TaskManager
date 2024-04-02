<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Task Manager</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: right;
        }
        .popup-menu {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .popup-menu a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .popup-menu a:hover {
            background-color: #ddd;
        }
        .popup-menu.active {
            display: block;
        }
    </style>
</head>
<body>
<div class="header">
    <button id="menuButton">Menu &#9776;</button>
    <div class="popup-menu" id="popupMenu">
        <a href="#">Home</a>
        <a href="#">Tasks</a>
        <a href="#">Settings</a>
        <a href="#">Logout</a>
    </div>
</div>
<script>
    document.getElementById("menuButton").addEventListener("click", function() {
        var menu = document.getElementById("popupMenu");
        menu.classList.toggle("active");
    });
</script>
</body>
</html>