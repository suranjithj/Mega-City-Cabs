<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="config.connectionProvider" %>
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
    .nav-list a {
      text-transform: uppercase;
      text-decoration: none;
      background-color: #0066cc;
      color: #fff;
      padding: 10px 20px;
      border-radius: 4px;
      margin: 0 10px;
      transition: background-color 0.3s ease;
    }
    .car-table {
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
    .car-table th, .car-table td {
      padding: 12px 15px;
      border: 1px solid #ddd;
    }
    .car-table th {
      background-color: #0066cc;
      color: white;
      text-transform: uppercase;
      font-weight: bold;
    }
    .car-table tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    .car-table tr:hover {
      background-color: #f1f1f1;
    }
    .car-table a {
      text-decoration: none;
      color: #0066cc;
      font-weight: bold;
      transition: color 0.3s ease;
    }
    .car-table a:hover {
      color: #004b99;
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Manage Cabs</h2>

  <div class="nav-list">
    <a href="addcar.jsp" class="nav-links">Add New Cab</a>
  </div>

  <h3>Existing Cars</h3>

  <%
    Connection conn = connectionProvider.getConnection();
    PreparedStatement ps = conn.prepareStatement(
            "SELECT cars.id, cars.car_category, cars.car_no, cars.seat_count, cars.fee, cars.image, cars.status, " +
                    "drivers.name AS driver_name FROM cars " +
                    "INNER JOIN drivers ON cars.driver_id = drivers.id"
    );
    ResultSet rs = ps.executeQuery();
  %>

  <table class="car-table">
    <tr>
      <th>Car Category</th>
      <th>Driver Name</th>
      <th>Car No</th>
      <th>Seat Count</th>
      <th>Fee</th>
      <th>Image</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
    <%
      while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getString("car_category") %></td>
      <td><%= rs.getString("driver_name") %></td>
      <td><%= rs.getString("car_no") %></td>
      <td><%= rs.getString("seat_count") %></td>
      <td><%= rs.getString("fee") %></td>
      <td>
        <img src="<%= request.getContextPath() + "/" + rs.getString("image") %>" width="100" height="100"><br>
        <a href="updateimage.jsp?id=<%= rs.getInt("id") %>">Update</a>
      </td>
      <td><%= rs.getString("status") %> | <a href="updatestatus.jsp?id=<%= rs.getInt("id") %>">Update</a></td>
      <td>
        <a href="editcar.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
        <a style="color: red" href="deletecar.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure you want to delete this car?');">Delete</a>
      </td>
    </tr>
    <%
      }
      rs.close();
      ps.close();
      conn.close();
    %>
  </table>

  <p><a href="../admin-dashboard.jsp" class="book-button">Back to Dashboard</a></p>
</div>
</body>
</html>
