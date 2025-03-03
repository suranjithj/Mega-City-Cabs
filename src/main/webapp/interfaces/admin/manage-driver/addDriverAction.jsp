<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<%
  String driverName = request.getParameter("driverName");
  String mobileNo = request.getParameter("mobileNo");
  String nic = request.getParameter("nic");
  String driverStatus = request.getParameter("driverStatus");

  Connection conn = null;
  PreparedStatement ps = null;

  try {
    conn = connectionProvider.getConnection();
    if (conn != null) {

      ps = conn.prepareStatement("INSERT INTO drivers (name, phone, nic, status) VALUES (?, ?, ?, ?)");
      ps.setString(1, driverName);
      ps.setString(2, mobileNo);
      ps.setString(3, nic);
      ps.setString(4, driverStatus);

      int rowsInserted = ps.executeUpdate();


      if (rowsInserted > 0) {
        response.sendRedirect("adddriver.jsp?msg=done");
      } else {
        response.sendRedirect("adddriver.jsp?msg=wrong");
      }
    } else {
      response.sendRedirect("adddriver.jsp?msg=wrong");
    }
  } catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("adddriver.jsp?msg=wrong");
  } finally {
    try {
      if (ps != null) ps.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>