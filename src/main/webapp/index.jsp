<%@ page import="java.sql.ResultSet, java.sql.Statement, java.sql.Connection" %>
<%@ page import="config.connectionProvider" %>
<%@ page import="models.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome to Mega City Cab</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .top-container {
      position: relative;
      width: 100vw;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      box-sizing: border-box;
    }

    .top-container::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: url("images/background3.jpg") no-repeat center center/cover;
      opacity: 0.8;
      z-index: -1;
    }

    .navbar{
      width: 100vw;
      max-width: 100%;
      margin: 0 auto;
      padding: 40px 10%;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      box-sizing: border-box;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
    }


    h1 {
      color: rgb(255, 255, 255);
      margin-top: 100px;
      font-size: 120px;
    }
    p {
      font-size: 1.2em;
      text-transform: capitalize;
    }

    .p1{
      margin-top: 30px;
      text-transform: uppercase;
      font-size: 25px;
      color: #ffffff;
      font-weight: bold;
    }

    .links {
      background-color: #0066cc;
    }
    .links a {
      display: inline-block;
      font-weight: bold;
      text-transform: uppercase;
      text-decoration: none;
      background-color: #0066cc;
      color: #fff;
      padding: 10px 20px;
      border-radius: 4px;
      margin: 0 10px;
      transition: background-color 0.3s ease;
    }
    .links a:hover {
      background-color: #004b99;
    }

    .nav-button {
      width: 200px;
      background-color: #0066cc;
      color: white;
      padding: 8px 12px;
      text-decoration: none;
      border-radius: 4px;
      display: inline-block;
      margin-top: 10px;
    }

  </style>
</head>
<body>

<%
  User currentUser = (User) session.getAttribute("currentUser");
  boolean isLoggedIn = (currentUser != null);

%>

<div class="top-container">

  <nav class="navbar">

    <div class="links">
      <% if (isLoggedIn) { %>
      <a href="interfaces/customer/customer-dashboard.jsp" class="nav-button">Go to Dashboard</a>
      <% } else { %>
      <a href="interfaces/login.jsp" class="nav-button">Login</a>
      <% } %>
      <a href="interfaces/register.jsp" class="nav-button">Register</a>
      <a href="interfaces/admin/admin-dashboard.jsp" class="nav-button">AD Dashboard</a>
    </div>

    <h1>Welcome to Mega City Cab</h1>
    <p class="p1">Your trusted cab service in Colombo . . .</p>

  </nav>

</div>

</body>
</html>
