<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="config.connectionProvider" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Print Bill</title>
    <link rel="stylesheet" href="../../../assets/styles/carstyle.css">
    <link rel="stylesheet" type="text/css" href="../../../assets/styles/main.css">
    <style>
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
    </style>
</head>
<body>
<h2>Print Bill for Booking ID: <%= request.getParameter("id") %></h2>

<% // Encapsulation
    int bookingId = Integer.parseInt(request.getParameter("id"));

    Connection conn = connectionProvider.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM bookings WHERE booking_id = ?");
    pstmt.setInt(1, bookingId);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        String customerName = rs.getString("customer_name");
        String pickupLocation = rs.getString("pickup_location");
        String destination = rs.getString("destination");
        double fare = rs.getDouble("fee");
        double tax = fare * 0.1;
        double totalAmount = fare + tax;
        double billAmount = rs.getDouble("bill");
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
        <th>Fare (LKR)</th>
        <td><%= fare %></td>
    </tr>
    <tr>
        <th>Tax (10%)</th>
        <td><%= tax %></td>
    </tr>
    <tr>
        <th>Total Amount (LKR)</th>
        <td><%= totalAmount %></td>
    </tr>
    <tr>
        <th>Bill Amount (LKR)</th>
        <td><%= billAmount %></td>
    </tr>
</table>

<%
    } else {
        out.println("<p>No booking found with this ID.</p>");
    }
    // Modularity
    rs.close();
    pstmt.close();
    conn.close();
%>

<br><br>
<button onclick="window.print()">Print Bill</button><br><br>

</body>
</html>
