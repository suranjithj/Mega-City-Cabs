<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<%
    int carId = Integer.parseInt(request.getParameter("id"));

    Connection conn = connectionProvider.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM cars WHERE id = ?");
    pstmt.setInt(1, carId);
    ResultSet rs = pstmt.executeQuery();

    String carCategory = "", driverId = "", carNo = "";
    int seatCount = 0;
    double fee = 0.0;

    if (rs.next()) {
        carCategory = rs.getString("car_category");
        driverId = rs.getString("driver_id");
        carNo = rs.getString("car_no");
        seatCount = rs.getInt("seat_count");
        fee = rs.getDouble("fee");
    }
    rs.close();
    pstmt.close();
    conn.close();
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

        button:hover {
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
            <h2>Edit Car Details</h2>

            <!-- Edit Car Form -->
            <form action="editCarAction.jsp" method="post">
                <input type="hidden" name="carId" value="<%= carId %>"/>

                <label for="carCategory">Car Category:</label>
                <input type="text" id="carCategory" name="carCategory" value="<%= carCategory %>" required/><br/>

                <label for="driverId">Driver Name:</label>
                <input type="text" id="driverId" name="driverId" value="<%= driverId %>" required/><br/>

                <label for="carNo">Car Number:</label>
                <input type="text" id="carNo" name="carNo" value="<%= carNo %>" required/><br/>

                <label for="seatCount">Seat Count:</label>
                <input type="number" id="seatCount" name="seatCount" value="<%= seatCount %>" required/><br/>

                <label for="fee">Fee per 1KM:</label>
                <input type="text" id="fee" name="fee" value="<%= fee %>" required/><br/>

                <button type="submit">Update Car</button>
            </form>
        </div>

        <p><a href="managecar.jsp" class="book-button">Back</a></p>

    </div>
</body>
</html>
