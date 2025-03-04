<%@ page import="config.connectionProvider" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, java.io.*" %>

<%
  int carId = Integer.parseInt(request.getParameter("id"));
  String newStatus = request.getParameter("status");

  Connection conn = null;
  PreparedStatement ps = null;

  try {
    conn = connectionProvider.getConnection();
    ps = conn.prepareStatement("UPDATE cars SET status = ? WHERE id = ?");
    ps.setString(1, newStatus);
    ps.setInt(2, carId);
    int rowsAffected = ps.executeUpdate();

    if (rowsAffected > 0) {
      response.sendRedirect("managecar.jsp?success=1");
    } else {
      response.sendRedirect("managecar.jsp?error=1");
    }
  } catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("managecar.jsp?error=1");
  } finally {
    if (ps != null) ps.close();
    if (conn != null) conn.close();
  }
%>
