<%@ page import="java.sql.*, config.connectionProvider" %>

<%
  int bookingId = Integer.parseInt(request.getParameter("bookingId"));
  double newFee = Double.parseDouble(request.getParameter("fee"));
  double distance = Double.parseDouble(request.getParameter("distance"));

  double updatedFee = newFee * distance;

  Connection conn = connectionProvider.getConnection(); // Encapsulation

  PreparedStatement pstmt = conn.prepareStatement("UPDATE bookings SET fee = ? WHERE booking_id = ?");
  pstmt.setDouble(1, updatedFee);
  pstmt.setInt(2, bookingId);

  int rowsUpdated = pstmt.executeUpdate();

  pstmt.close();
  conn.close();

  if (rowsUpdated > 0) {
    response.sendRedirect("managebooking.jsp?msg=fee_updated");
  } else {
    response.sendRedirect("managebooking.jsp?msg=fee_update_failed");
  }
%>
