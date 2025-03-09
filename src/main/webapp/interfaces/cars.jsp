<%@ page import="java.sql.ResultSet, java.sql.Statement, java.sql.Connection" %>
<%@ page import="config.connectionProvider" %>
<%@ page import="models.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cabs</title>
  <link rel="stylesheet" type="text/css" href="assets/styles/main.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .navbar{
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

    .container {
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
    h1 {
      color: #0066cc;
      margin-top: 50px;
      font-size: 60px;
    }
    p {
      font-size: 1.2em;
      text-transform: capitalize;
    }
    .links {
      margin-top: 30px;
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

    .cab-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 20px;
      gap: 30px;
    }

    .cab-item {
      padding: 35px;
      border: 2px solid #0066cc;
      background-color: #f9f9f9;
      text-align: center;
      border-radius: 25px;
      box-shadow: 0 4px 8px #0066cc;
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .cab-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
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
    .cab-item img {
      max-width: 200px;
      height: 180px;
      border-radius: 5px;
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
    .book-button:hover {
      background-color: #004b99;
    }
  </style>
</head>
<body>

<body>

<%
  User currentUser = (User) session.getAttribute("currentUser");
  boolean isLoggedIn = (currentUser != null);

  Connection conn = connectionProvider.getConnection();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery("SELECT * FROM cars WHERE status='Available'");
%>

<nav class="navbar">
  <div class="links">
    <% if (isLoggedIn) { %>
    <a href="customer/customer-dashboard.jsp" class="nav-button">Go to Dashboard</a>
    <% } else { %>
    <a href="login.jsp" class="nav-button">Login</a>
    <% } %>
    <a href="register.jsp" class="nav-button">Register</a>
    <a href="admin/admin-dashboard.jsp" class="nav-button">AD Dashboard</a>
  </div>
  <h1>Welcome to Mega City Cab</h1>
  <p style="margin-top: 30px; text-transform: uppercase; font-size: 25px">Your trusted cab service in Colombo City.</p>
</nav>

<div class="container">
  <div class="cab-list">

    <% while (rs.next()) { %>
    <div class="cab-item">
      <img src="<%= request.getContextPath() + "/" + rs.getString("image") %>">
      <hr style="background-color: black; height: 2px">
      <h3><%= rs.getString("car_category") %></h3>
      <p>Car No: <%= rs.getString("car_no") %></p>
      <p>Driver ID: <%= rs.getString("driver_id") %></p>
      <p>Seats: <%= rs.getString("seat_count") %></p>
      <p><strong>LKR <%= rs.getString("fee") %> per KM</strong></p>

      <% if (isLoggedIn) { %>
      <a href="customer/Booking/booking.jsp?carId=<%= rs.getInt("id") %>" class="book-button">Book This Cab</a>
      <% } else { %>
      <a href="login.jsp" class="book-button">Login to Book</a>
      <% } %>
    </div>
    <% } %>
  </div>

  <div>
    <a href="../index.jsp" style="margin-top: 30px" class="book-button">Back to Home</a>
  </div>
</div>

<%
  rs.close();
  stmt.close();
  conn.close();
%>
</body>
</html>
