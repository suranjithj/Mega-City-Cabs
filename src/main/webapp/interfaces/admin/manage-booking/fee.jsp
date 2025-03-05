<%@ page import="java.sql.*, config.connectionProvider" %>

<%
  int bookingId = Integer.parseInt(request.getParameter("id"));
  Connection conn = connectionProvider.getConnection(); // Encapsulation
  PreparedStatement pstmt = conn.prepareStatement("SELECT booking_id, fee FROM bookings WHERE booking_id = ?");  // Abstraction
  pstmt.setInt(1, bookingId);
  ResultSet rs = pstmt.executeQuery();

  int storedBookingId = 0;
  double currentFee = 0;

  if (rs.next()) {
    storedBookingId = rs.getInt("booking_id");
    currentFee = rs.getDouble("fee");
  }
  rs.close();
  pstmt.close();
  conn.close();
%>

<!DOCTYPE html>
<html>
<head>
  <title>Update Fee</title>
  <link rel="stylesheet" href="../../../assets/styles/main.css">
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
      border-radius: 25px;      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-weight: bold;
      margin-top: 25px;
      margin-bottom: 5px;
      display: block;
      text-align: left;
    }

    input {
      width: 100%;
      padding: 10px;
      border: 1px solid #0066cc;
      border-radius: 5px;
      font-size: 16px;
      transition: border 0.3s ease-in-out;
    }

    input:focus {
      border-color: #0066cc;
      outline: none;
    }

    button {
      background-color: #0066cc;
      width: 100%;
      color: white;
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
    <div class="add-form">
      <h2>Update Fee for Booking ID: <%= storedBookingId %></h2>

      <form action="updateFeeAction.jsp" method="post">

        <input type="hidden" name="bookingId" value="<%= storedBookingId %>">

        <label for="fee">New Fee:</label>
        <input type="number" id="fee" name="fee" value="<%= currentFee %>" step="0.01" required>

        <label for="distance">Enter Distance (km):</label>
        <input type="number" id="distance" name="distance" step="0.1" required>

        <button type="submit">Update Fee</button>

      </form>
    </div>

    <p><a href="managebooking.jsp" class="book-button">Back</a></p>
  </div>
</body>
</html>
