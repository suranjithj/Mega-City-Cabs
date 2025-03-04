<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<%
  String driverId = request.getParameter("id");
  Connection conn = null;
  PreparedStatement ps = null;
  ResultSet rs = null;

  String driverName = "", mobileNo = "", nic = "", driverStatus = "";

  try {
    conn = connectionProvider.getConnection();
    ps = conn.prepareStatement("SELECT * FROM drivers WHERE id = ?");
    ps.setInt(1, Integer.parseInt(driverId));
    rs = ps.executeQuery();

    if (rs.next()) {
      driverName = rs.getString("name");
      mobileNo = rs.getString("phone");
      nic = rs.getString("nic");
      driverStatus = rs.getString("status");
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Edit Car - Admin</title>
  <link rel="stylesheet" href="../../assets/styles/carstyle.css">
  <link rel="stylesheet" type="text/css" href="../../../assets/styles/main.css">
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

    form {
      max-width: 600px;
      margin: 20px auto;
      padding: 50px;
      background: #f9f9f9;
      border: 2px solid #0066cc;
      border-radius: 25px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
      width: 100%;
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
      color: white;
      width: 100%;
      padding: 12px;
      margin-top: 25px;
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
    <div class="edit-form">
      <h2>Edit Driver</h2>
      <form action="editDriverAction.jsp" method="post">
        <input type="hidden" name="driverId" value="<%= driverId %>"/>

        <label for="driverName">Driver Name:</label>
        <input type="text" id="driverName" name="driverName" value="<%= driverName %>" required/><br/>

        <label for="mobileNo">Mobile No:</label>
        <input type="text" id="mobileNo" name="mobileNo" value="<%= mobileNo %>" required/><br/>

        <label for="nic">NIC:</label>
        <input type="text" id="nic" name="nic" value="<%= nic %>" required/><br/>

        <label for="driverStatus">Driver Status:</label>
        <select id="driverStatus" name="driverStatus" required>
          <option value="Available" <%= driverStatus.equals("Available") ? "selected" : "" %>>Available</option>
          <option value="Unavailable" <%= driverStatus.equals("Unavailable") ? "selected" : "" %>>Unavailable</option>
        </select>

        <button type="submit">Update Driver</button>
      </form>
    </div>

    <%
      String msg = request.getParameter("msg");
      if ("updated".equals(msg)) {
    %>
    <p style="color:green;">Driver updated successfully!</p>
    <%
    } else if ("error".equals(msg)) {
    %>
    <p style="color:red;">Failed to update driver. Please try again.</p>
    <%
      }
    %>

    <p><a href="managedriver.jsp" class="book-button">Back</a></p>
  </div>
</body>
</html>
