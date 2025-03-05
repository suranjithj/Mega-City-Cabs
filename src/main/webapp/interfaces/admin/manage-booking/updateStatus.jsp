<%@ page import="java.sql.*, config.connectionProvider" %>

<% // Encapsulation
  int bookingId = Integer.parseInt(request.getParameter("bookingId"));
  String newStatus = request.getParameter("status");

  Connection conn = connectionProvider.getConnection(); // Encapsulation
  // Modularity
  PreparedStatement pstmt = conn.prepareStatement("UPDATE bookings SET status = ? WHERE booking_id = ?");
  pstmt.setString(1, newStatus);
  pstmt.setInt(2, bookingId);
  // Modularity
  int rowsUpdated = pstmt.executeUpdate();

  pstmt.close();
  conn.close();

  if (rowsUpdated > 0) {
    response.sendRedirect("managebooking.jsp?msg=status_updated");

  } else {
    response.sendRedirect("managebooking.jsp?msg=status_update_failed");

  }
%>
