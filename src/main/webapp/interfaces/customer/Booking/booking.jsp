<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.ResultSet, java.sql.Statement, java.sql.Connection" %>
<%@ page import="config.connectionProvider" %>
<!DOCTYPE html>
<html>
<head>
  <title>Make a Booking - Mega City Cab</title>
  <link rel="stylesheet" href="../assets/styles/main.css">
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      color: #333;

    }
    .container {
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

    .add-form {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      background: #f9f9f9;
      border: 2px solid #0066cc;
      border-radius: 25px;
      box-shadow: 0 2px 10px #0066cc;
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-weight: bold;
      margin-bottom: 5px;
      display: block;
      text-align: left;
    }

    input, select {
      width: 450px;
      padding: 10px;
      border: 1px solid #0066cc;
      border-radius: 5px;
      font-size: 16px;
      transition: border 0.3s ease-in-out;
    }

    input:focus,
    select:focus {
      border-color: #0066cc;
      outline: none;
    }

    button {
      background-color: #0066cc;
      margin-bottom: 25px;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 25px;
      font-size: 16px;
      cursor: pointer;
      justify-content: center;
      transition: background-color 0.3s ease-in-out;
    }

    button:hover,
    .book-button:hover{
      background-color: #004b99;
    }

    .book-button {
      width: 250px;
      background-color: #0066cc;
      color: white;
      padding: 8px 50px;
      text-decoration: none;
      border-radius: 25px;
      display: inline-block;
      margin-top: 10px;
      margin-bottom: 50px;
    }

  </style>
</head>
<body>
  <div class="container">

    <%
      String carIdStr = request.getParameter("carId");
      int carId = 0;
      if (carIdStr != null) {
        carId = Integer.parseInt(carIdStr);
      }

      Connection conn = connectionProvider.getConnection();
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT car_no, fee FROM cars WHERE id = " + carId);
      String carNo = "";
      String fee = "";
      if (rs.next()) {
        carNo = rs.getString("car_no");
        fee = rs.getString("fee");
      }
      rs.close();
      stmt.close();
      conn.close();
    %>

    <h2>Booking Car <%= carNo %></h2>

    <form action="bookingAction.jsp" method="post" class="add-form">

      <label for="carNo">Car No:</label>
      <input type="text" id="carNo" name="carNo" value="<%= carNo %>" /><br/>

      <label for="fee">Fee:</label>
      <input type="text" id="fee" name="fee" value="<%= fee %>" /><br/>

      <label for="pickupLocation">Pickup Location:</label>
      <input type="text" id="pickupLocation" name="pickupLocation" required/><br/>

      <label for="destination">Destination:</label>
      <input type="text" id="destination" name="destination" required/><br/>

      <button type="submit">Book Now</button>
    </form>

    <p><a href="../customer-dashboard.jsp" class="book-button">Back to Dashboard</a></p>

  </div>
</body>
</html>
