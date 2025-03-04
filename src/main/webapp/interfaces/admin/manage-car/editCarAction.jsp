<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<%
    int carId = Integer.parseInt(request.getParameter("carId"));
    String carCategory = request.getParameter("carCategory");
    String driverId = request.getParameter("driverId");
    String carNo = request.getParameter("carNo");
    int seatCount = Integer.parseInt(request.getParameter("seatCount"));
    double fee = Double.parseDouble(request.getParameter("fee"));

    Connection conn = connectionProvider.getConnection();
    PreparedStatement pstmt = conn.prepareStatement(
            "UPDATE cars SET car_category = ?, driver_id = ?, car_no = ?, seat_count = ?, fee = ? WHERE id = ?"
    );
    pstmt.setString(1, carCategory);
    pstmt.setString(2, driverId);
    pstmt.setString(3, carNo);
    pstmt.setInt(4, seatCount);
    pstmt.setDouble(5, fee);
    pstmt.setInt(6, carId);

    int rowsAffected = pstmt.executeUpdate();

    pstmt.close();
    conn.close();

    if (rowsAffected > 0) {
        response.sendRedirect("managecar.jsp?msg=Car updated successfully");
    } else {
        response.sendRedirect("managecar.jsp?msg=Error updating car");
    }
%>
