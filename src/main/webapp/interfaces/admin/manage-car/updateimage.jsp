<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="config.connectionProvider, java.sql.*, jakarta.servlet.http.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = connectionProvider.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT image FROM cars WHERE id = ?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    String imagePath = "images/cabs/no-image.png";
    if (rs.next() && rs.getString("image") != null && !rs.getString("image").isEmpty()) {
        imagePath = rs.getString("image");
    }

    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Car Image</title>
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
            display: block;
            text-align: left;
        }

        input {
            width: 90%;
            padding: 10px;
            border: 1px solid #0066cc;
            border-radius: 5px;
            font-size: 16px;
            transition: border 0.3s ease-in-out;
            display: block;
            margin: 0 auto;
        }

        input:focus {
            border-color: #0066cc;
            outline: none;
        }

        .view-img{
            width: 300px;
            height: 300px;
            border: 1px solid #0066cc;
            border-radius: 15px;
        }

        button {
            background-color: #0066cc;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            justify-content: center;
            transition: background-color 0.3s ease-in-out;
        }

        .submit-bt{
            color: white;
            background-color: #0066cc;
            border-radius: 25px;
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
        }

        .submit-bt:hover,
        .book-button:hover {
            background-color: #004b99;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Update Car Image</h2>

        <% if (msg != null) { %>
        <p style="color: green;"><%= msg %></p>
        <% } %>

        <img src="<%= request.getContextPath() + "/" + imagePath %>" class="view-img"><br><br>

        <form action="<%= request.getContextPath() %>/UpdateImageServlet" method="post" enctype="multipart/form-data" class="add-form">
            <input type="hidden" name="id" value="<%= id %>">
            <label>Select New Image:</label>
            <input type="file" name="imageFile" accept="image/*" required><br><br>
            <input type="submit" value="Upload" class="submit-bt">
        </form>

        <p><a href="managecar.jsp" class="book-button">Back</a></p>
    </div>
</body>
</html>
