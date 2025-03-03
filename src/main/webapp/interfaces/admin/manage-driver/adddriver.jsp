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
      max-width: 500px;
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
      margin-top: 25px;
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
      width: 100%;
      margin-top: 25px;
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
  <div class="add-form">
    <h2>Add New Cab</h2>
    <!-- Driver Adding Form -->
    <form action="addDriverAction.jsp" method="post">

      <label for="driverName">Driver Name:</label>
      <input type="text" id="driverName" name="driverName" required/><br/>

      <label for="mobileNo">Mobile No:</label>
      <input type="text" id="mobileNo" name="mobileNo" required/><br/>

      <label for="nic">NIC:</label>
      <input type="text" id="nic" name="nic" required/><br/>

      <label for="driverStatus">Driver Status:</label>
      <select id="driverStatus" name="driverStatus" required>
        <option value="Available">Available</option>
        <option value="Unavailable">Unavailable</option>
      </select>

      <button type="submit">Add Driver</button>
    </form>
  </div>


  <%
    String msg = request.getParameter("msg");
    if ("done".equals(msg)) {
  %>
  <p style="color:green;">Driver added successfully!</p>
  <%
  } else if ("wrong".equals(msg)) {
  %>
  <p style="color:red;">Failed to add Driver. Please try again.</p>
  <%
    }
  %>

  <p><a href="managedriver.jsp" class="book-button">Back</a></p>

</div>
</body>
</html>
