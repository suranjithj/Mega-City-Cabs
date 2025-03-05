<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%@ page import="java.util.*" %>

<%
    if (session.getAttribute("currentUser") == null || session.getAttribute("username") == null) {
        response.sendRedirect("../../index.jsp");
        return;
    }

    String customeruserNameObj = (String) session.getAttribute("username");
    if (customeruserNameObj == null) {
        response.sendRedirect("../../index.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");

    String jdbcUrl = "jdbc:mysql://localhost:3306/mccabsdb1";
    String dbUser = "root";
    String dbPass = "root";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="../../assets/styles/main.css">
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
            display: inline-block;
            margin-top: 10px;
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

    <h1>Welcome, ${currentUser.name}!</h1>

    <nav class="nav-list">
        <ul>
            <li><a class="nav-links" href="../cars.jsp">View Cabs</a></li>
            <li><a class="nav-links" href="${pageContext.request.contextPath}/logout">Logout</a></li>
        </ul>
    </nav>

    <div class="view-booking">
        <h2>Your Bookings</h2>
        <table class="booking-table">
            <tr>
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
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

                    String query = "SELECT * FROM bookings WHERE username = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, username);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("pickup_location") %> | <%= rs.getString("destination") %></td>
                <td><%= rs.getString("car_no") %> </td>
                <td><%= rs.getString("fee") %> </td>
                <td><%= rs.getString("status") %> </td>
                <td><%= rs.getString("booking_date") %></td>
                <td><%= rs.getString("bill") %> | <a href="printBill.jsp?id=<%= rs.getInt("booking_id") %>">Print Bill</a></td>
                <td>
                    <a style="color: red" href="Booking/delete.jsp?id=<%= rs.getInt("booking_id") %>" onclick="return confirm('Are you sure you want to cancel this booking?');">Cancel Booking</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
        </table>
    </div>

    <p><a href="../../index.jsp" class="book-button">Back to Home</a> </p>
</div>
</body>
</html>
