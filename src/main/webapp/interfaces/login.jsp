<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Mega City Cab - Login</title>
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
      gap: 15px;
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
    .book-button:hover {
      background-color: #004b99;
    }

    .book-button {
      width: 250px;
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
  <h2>Login</h2>
  <form action="../auth" method="post" class="add-form" onsubmit="storeLoginData()">
    <label for="username">Username:</label>
    <input type="text" name="username" id="username" required/><br/>

    <label for="password">Password:</label>
    <input type="password" name="password" id="password" required/><br/>

    <label>
      <input type="checkbox" id="rememberMe"> Remember Me
    </label>

    <button type="submit">Login</button>
  </form>

  <p>Not Registered? Click <a href="register.jsp" style="color: #0066cc; font-weight: bold">Register</a></p>
  <p style="color:red;">
    ${error != null ? error : ""}
  </p>

  <p><a href="../index.jsp" class="book-button">Back to Home</a></p>
</div>

<script>
  window.onload = function () {
    let storedUsername = localStorage.getItem("rememberedUsername") || getCookie("username");

    if (storedUsername) {
      document.getElementById("username").value = storedUsername;
      document.getElementById("rememberMe").checked = true;
    }
  };

  function storeLoginData() {
    let username = document.getElementById("username").value;
    let rememberMe = document.getElementById("rememberMe").checked;

    if (rememberMe) {
      localStorage.setItem("rememberedUsername", username);
      document.cookie = "username=" + username + "; path=/;";
    } else {
      localStorage.removeItem("rememberedUsername");
      document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    }

    sessionStorage.setItem("isLoggedIn", "true");
  }

  function getCookie(name) {
    let cookies = document.cookie.split("; ");
    for (let i = 0; i < cookies.length; i++) {
      let cookie = cookies[i].split("=");
      if (cookie[0] === name) {
        return cookie[1];
      }
    }
    return null;
  }
</script>
</body>
</html>
