<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard - Mega City Cab</title>
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
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome, Admin!</h1>
        <nav class="nav-list">
          <ul>
            <li><a href="manage-car/managecar.jsp" class="nav-links">Manage Cabs</a></li>
            <li><a href="manage-booking/managebooking.jsp" class="nav-links">Manage Bookings</a></li>
              <li><a href="manage-driver/managedriver.jsp" class="nav-links">Manage Drivers</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="nav-links">Logout</a></li>
          </ul>
        </nav>
        <div>



        </div>
    </div>
</body>
</html>
