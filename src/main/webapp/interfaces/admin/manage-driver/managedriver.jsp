<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="config.connectionProvider" %>
<%--<%@ page import="java.sql.*" %>--%>
<%@ page import="java.sql.*, jakarta.servlet.http.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Cars - Admin</title>
    <link rel="stylesheet" href="../../../assets/styles/carstyle.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/styles/main.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            color: #333;

        }
        .container {
            height: 100vh;
            width: 100vw;
            max-width: 100%;
            margin: 0 auto;
            padding: 40px 10%;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            box-sizing: border-box;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .nav-list{
            margin-top: 30px;
        }

        .nav-list a{
            text-transform: uppercase;
            text-decoration: none;
            background-color: #0066cc;
            color: #fff;
            padding: 10px 20px;
            border-radius: 4px;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        .nav-list a:hover {
            background-color: #004b99;
        }

        .nav-links {
            width: 200px;
            background-color: #0066cc;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
            border: none;
        }

        .book-button {
            width: 200px;
            background-color: #0066cc;
            color: white;
            padding: 8px 50px;
            text-decoration: none;
            border-radius: 25px;
            display: inline-block;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>Manage Cabs</h2>

    <div class="nav-list">
        <a style="width: 100px; height: 30pc; border: 1px solid black; margin: 50px;" href="adddriver.jsp" class="nav-links">Add New Driver</a>
    </div>

    <%--  Existing Driver Table--%>
    <h3>Existing Drivers</h3>


    <p><a href="../admin-dashboard.jsp" class="book-button">Back to Dashboard</a></p>
</div>
</body>
</html>
