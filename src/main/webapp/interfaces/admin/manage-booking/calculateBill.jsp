<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="config.connectionProvider" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
  <title>Calculate Bill</title>
  <link rel="stylesheet" href="../../../assets/styles/carstyle.css">
  <link rel="stylesheet" type="text/css" href="../../../assets/styles/main.css">
  <style>
    * {
      box-sizing: border-box;
    }

    .bill-table {
      width: 100%;
      border-collapse: collapse;
    }
    .bill-table th, .bill-table td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
      color: black;
    }
    .bill-table th {
      background-color: #f2f2f2;
    }

    .print-bill, .calculate-btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-weight: bold;
      text-align: center;
      cursor: pointer;
      border: none;
    }

    .print-bill:hover, .calculate-btn:hover {
      background-color: #45a049;
    }

    .center-container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    input[type="number"] {
      padding: 8px;
      width: 100px;
      margin-right: 10px;
    }
  </style>
</head>
<body>

<h2>Calculate Bill for Booking ID: <%= request.getParameter("id") %></h2>

<%
  int bookingId = Integer.parseInt(request.getParameter("id"));

  Connection conn = connectionProvider.getConnection();
  PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM bookings WHERE booking_id = ?");
  pstmt.setInt(1, bookingId);
  ResultSet rs = pstmt.executeQuery();

  if (rs.next()) {
    String customerName = rs.getString("customer_name");
    String pickupLocation = rs.getString("pickup_location");
    String destination = rs.getString("destination");
    double fee = rs.getDouble("fee");
%>

<h3>Customer Information</h3>
<table class="bill-table">
  <tr>
    <th>Customer Name</th>
    <td><%= customerName %></td>
  </tr>
  <tr>
    <th>Pickup Location</th>
    <td><%= pickupLocation %></td>
  </tr>
  <tr>
    <th>Destination</th>
    <td><%= destination %></td>
  </tr>
  <tr>
    <th>Fee per km (LKR)</th>
    <td><%= fee %></td>
  </tr>
</table>

<form method="POST" action="">
  <button type="submit" class="calculate-btn">Calculate Bill</button>
</form>

<%
  if (request.getMethod().equalsIgnoreCase("POST")) {
    double discount = fee * 0.05; // 5% discount
    double tax = (fee - discount) * 0.1; // 10% tax
    double totalAmount = (fee - discount) + tax;

    String updateBillQuery = "UPDATE bookings SET bill = ? WHERE booking_id = ?";
    PreparedStatement updatePstmt = conn.prepareStatement(updateBillQuery);
    updatePstmt.setDouble(1, totalAmount);
    updatePstmt.setInt(2, bookingId);
    updatePstmt.executeUpdate();
    updatePstmt.close();
%>

<h3>Bill Calculation</h3>
<table class="bill-table">
  <tr>
    <th>Total Fee (LKR)</th>
    <td><%= fee %></td>
  </tr>
  <tr>
    <th>Discount (5%)</th>
    <td><%= discount %></td>
  </tr>
  <tr>
    <th>Tax (10%)</th>
    <td><%= tax %></td>
  </tr>
  <tr>
    <th>Total Amount (LKR)</th>
    <td><%= totalAmount %></td>
  </tr>
</table>

<p>Bill successfully updated.</p><br>
<div class="center-container">
  <a class="print-bill" href="printBill.jsp?id=<%= bookingId %>">Print Bill</a>
</div>

<br><br>

<% } %>

<%
  } else {
    out.println("<p>No booking found with this ID.</p>");
  }

  rs.close();
  pstmt.close();
  conn.close();
%>

<a href="managebooking.jsp">Back to Manage Bookings</a>

</body>
</html>
