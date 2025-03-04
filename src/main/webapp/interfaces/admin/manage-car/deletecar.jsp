<%@ page import="config.connectionProvider" %>
<%@ page import="java.sql.*" %>

<%
  int carId = Integer.parseInt(request.getParameter("id"));

  Connection conn = connectionProvider.getConnection();
  PreparedStatement pstmt = conn.prepareStatement("DELETE FROM cars WHERE id = ?");
  pstmt.setInt(1, carId);
  int rowsAffected = pstmt.executeUpdate();

  pstmt.close();
  conn.close();

  if (rowsAffected > 0) {
    response.sendRedirect("managecar.jsp?msg=Car deleted successfully");
  } else {
    response.sendRedirect("managecar.jsp?msg=Error deleting car");
  }
%>
