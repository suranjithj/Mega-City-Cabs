<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<%
  String carCategory = request.getParameter("carCategory");
  String driverId = request.getParameter("driverId");
  String carNo = request.getParameter("carNo");
  String seatCount = request.getParameter("seatCount");
  String fee = request.getParameter("fee");

  Connection conn = null;
  PreparedStatement ps = null;
  PreparedStatement updateDriverStatusPs = null;

  try {
    conn = connectionProvider.getConnection();
    conn.setAutoCommit(false);

    if (conn != null) {
      ps = conn.prepareStatement("INSERT INTO cars (car_category, driver_id, car_no, seat_count, fee) VALUES (?, ?, ?, ?, ?)");
      ps.setString(1, carCategory);
      ps.setInt(2, Integer.parseInt(driverId));
      ps.setString(3, carNo);
      ps.setInt(4, Integer.parseInt(seatCount));
      ps.setDouble(5, Double.parseDouble(fee));

      int rowsInserted = ps.executeUpdate();

      if (rowsInserted > 0) {
        // Update driver status to "Assigned"
        updateDriverStatusPs = conn.prepareStatement("UPDATE drivers SET status = 'Assigned' WHERE id = ?");
        updateDriverStatusPs.setInt(1, Integer.parseInt(driverId));
        updateDriverStatusPs.executeUpdate();

        conn.commit();
        response.sendRedirect("addcar.jsp?msg=done");
      } else {
        conn.rollback();
        response.sendRedirect("addcar.jsp?msg=wrong");
      }
    } else {
      response.sendRedirect("addcar.jsp?msg=wrong");
    }
  } catch (Exception e) {
    e.printStackTrace();
    try { if (conn != null) conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
    response.sendRedirect("addcar.jsp?msg=wrong");
  } finally {
    try {
      if (ps != null) ps.close();
      if (updateDriverStatusPs != null) updateDriverStatusPs.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>
