<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Customer Registration - Mega City Cab</title>
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
      gap: 10px;
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
      color: white;
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
    <h2>Register as a Customer</h2>

    <form action="../register" method="post" class="add-form">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required/><br/>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required/><br/>
      <label for="address">Address:</label>
      <input type="text" id="address" name="address" required/><br/>
      <label for="phone">Phone:</label>
      <input type="text" id="phone" name="phone" required/><br/>
      <label for="nic">NIC:</label>
      <input type="text" id="nic" name="nic" required/><br/>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required/><br/>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required/><br/>
      <button type="submit">Register</button>
    </form>

    <p>Already Have an Account? Click <a href="login.jsp" style="color: #0066cc; font-weight: bold">Login</a></p>
    <p><a href="login.jsp" class="book-button">Back to Login</a></p>
  </div>

</body>
</html>
