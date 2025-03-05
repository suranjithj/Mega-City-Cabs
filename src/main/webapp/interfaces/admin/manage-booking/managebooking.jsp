<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="config.connectionProvider" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Bookings - Admin</title>
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

        .booking-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
            border: 2px;
            text-align: left;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .booking-table th,
        .booking-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }

        .booking-table th {
            background-color: #0066cc;
            color: white;
            text-transform: uppercase;
            font-weight: bold;
        }

        .booking-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .booking-table tr:hover {
            background-color: #f1f1f1;
        }

        .booking-table a {
            text-decoration: none;
            color: #0066cc;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .booking-table a:hover {
            color: #004b99;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">

    <h2>Manage Bookings</h2>

    <%
        Connection conn = connectionProvider.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM bookings");
    %>

    <table class="booking-table">
        <tr>
            <th>BookingID</th>
            <th>Customer Username</th>
            <th>Customer Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Pickup Location | Destination</th>
            <th>Car No</th>
            <th>Fee (LKR)</th>
            <th>Status</th>
            <th>Booking Date</th>
            <th>Bill</th>
            <th>Action</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("booking_id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("pickup_location") %> | <%= rs.getString("destination") %></td>
            <td><%= rs.getString("car_no") %></td>
            <td><%= rs.getString("fee") %> | <a href="fee.jsp?id=<%= rs.getInt("booking_id") %>">Update</a></td>
            <td><%= rs.getString("status") %> | <a href="status.jsp?id=<%= rs.getInt("booking_id") %>">Update</a></td>
            <td><%= rs.getString("booking_date") %></td>
            <td><%= rs.getString("bill") %> | <a href="calculateBill.jsp?id=<%= rs.getInt("booking_id") %>">Calculate</a></td>
            <td><a style="color: red" href="delete.jsp?id=<%= rs.getInt("booking_id") %>" onclick="return confirm('Are you sure you want to delete this Booking?');">Delete</a></td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </table>

    <p><a href="../admin-dashboard.jsp" class="book-button">Back to Dashboard</a></p>
</div>
</body>
</html>
