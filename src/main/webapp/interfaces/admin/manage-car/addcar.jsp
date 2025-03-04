<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<!DOCTYPE html>
<html>
<head>
  <title>Manage Cars - Admin</title>
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

    .add-form {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
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
      margin-top: 15px;
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
      display: block;
      margin: 0 auto;
    }

    input:focus,
    select:focus {
      border-color: #0066cc;
      outline: none;
    }

    button {
      background-color: #0066cc;
      width: 100%;
      color: white;
      margin-top: 25px;
      margin-bottom: 25px;
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
      width: 200px;
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
  <div class="add-form">
    <h2>Add New Cab</h2>
    <!-- Car Adding Form -->
    <form action="addCarAction.jsp" method="post">

      <label for="carCategory">Car Category:</label>
      <select id="carCategory" name="carCategory" required>
        <option value="">Select a category</option>
        <option value="Motor Bike">Motor Bike</option>
        <option value="Car">Car</option>
        <option value="Van">Van</option>
        <option value="Mini Van">Mini Van</option>
        <option value="Three Wheel">Three Wheel</option>
      </select><br/>

      <label for="carNo">Car Number:</label>
      <input type="text" id="carNo" name="carNo" required/><br/>

      <label for="seatCount">Seat Count:</label>
      <input type="number" id="seatCount" name="seatCount" required/><br/>

      <label for="fee">Fee per 1KM:</label>
      <input type="text" id="fee" name="fee" required/><br/>

      <label for="driverId">Assign Driver:</label>
      <select id="driverId" name="driverId" required>
        <option value="">Select a Driver</option>
        <%
          Connection conn = null;
          PreparedStatement ps = null;
          ResultSet rs = null;

          try {
            conn = connectionProvider.getConnection();
            ps = conn.prepareStatement("SELECT id, name FROM drivers WHERE status = 'Available'");
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
        <%
            }
          } catch (Exception e) {
            e.printStackTrace();
          } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
          }
        %>
      </select><br/>

      <button type="submit">Add Car</button>
    </form>
  </div>


  <%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
  %>
  <p style="color:green;">Car added successfully!</p>
  <%
  } else if ("wrong".equals(msg)) {
  %>
  <p style="color:red;">Failed to add car. Please try again.</p>
  <%
    }
  %>

  <p><a href="managecar.jsp" class="book-button">Back</a></p>

</div>
</body>
</html>
