<%@ page import="config.connectionProvider" %>
<%@ page import="java.sql.*" %>

<%
    int carId = Integer.parseInt(request.getParameter("id"));

    Connection conn = connectionProvider.getConnection(); // Encapsulation
    PreparedStatement pstmt = conn.prepareStatement("DELETE FROM bookings WHERE booking_id = ?"); // Abstraction
    pstmt.setInt(1, carId);
    int rowsAffected = pstmt.executeUpdate();

    pstmt.close();
    conn.close();

    if (rowsAffected > 0) {
        response.sendRedirect("../customer-dashboard.jsp?msg=Car deleted successfully");
    } else {
        response.sendRedirect("../customer-dashboard.jsp?msg=Error deleting car");
    }
%>
