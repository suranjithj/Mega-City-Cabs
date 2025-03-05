<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="config.connectionProvider" %>
<%@ page import="models.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    User currentUser = (User) session.getAttribute("currentUser");

    if (currentUser == null) {
        response.sendRedirect("../views/login.jsp");
        return;
    }

    String pickupLocation = request.getParameter("pickupLocation");
    String destination = request.getParameter("destination");
    String carNo = request.getParameter("carNo");
    String fee = request.getParameter("fee");

    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement updateCarStmt = null;

    try {
        conn = connectionProvider.getConnection();
        conn.setAutoCommit(false);
        String sql = "INSERT INTO bookings (username, customer_name, address, phone, pickup_location, destination, car_no, fee, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, currentUser.getUsername());
        pstmt.setString(2, currentUser.getName());
        pstmt.setString(3, currentUser.getAddress());
        pstmt.setString(4, currentUser.getPhone());
        pstmt.setString(5, pickupLocation);
        pstmt.setString(6, destination);
        pstmt.setString(7, carNo);
        pstmt.setString(8, fee);
        pstmt.setString(9, "pending");

        int rows = pstmt.executeUpdate();

        if (rows > 0) {
            String updateCarSQL = "UPDATE cars SET status = 'booked' WHERE car_no = ?";
            updateCarStmt = conn.prepareStatement(updateCarSQL);
            updateCarStmt.setString(1, carNo);
            updateCarStmt.executeUpdate();

            conn.commit();
        %>
        <script>
            alert("Booking successful!");
            window.location.href = "../customer-dashboard.jsp";
        </script>
        <%
        } else {
            conn.rollback();
        %>
        <script>
            alert("Booking failed. Please try again.");
            window.history.back();
        </script>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <script>
            alert("An error occurred. Please try again later.");
            window.history.back();
        </script>
        <%
            } finally {
                if (pstmt != null) pstmt.close();
                if (updateCarStmt != null) updateCarStmt.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            }
        %>
