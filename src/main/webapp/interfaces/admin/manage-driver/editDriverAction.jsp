<%@ page import="java.sql.*" %>
<%@ page import="config.connectionProvider" %>

<%
    String driverId = request.getParameter("driverId");
    String driverName = request.getParameter("driverName");
    String mobileNo = request.getParameter("mobileNo");
    String nic = request.getParameter("nic");
    String driverStatus = request.getParameter("driverStatus");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        conn = connectionProvider.getConnection();
        if (conn != null) {
            ps = conn.prepareStatement("UPDATE drivers SET name = ?, phone = ?, nic = ?, status = ? WHERE id = ?");
            ps.setString(1, driverName);
            ps.setString(2, mobileNo);
            ps.setString(3, nic);
            ps.setString(4, driverStatus);
            ps.setInt(5, Integer.parseInt(driverId));

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("editdriver.jsp?id=" + driverId + "&msg=updated");
            } else {
                response.sendRedirect("editdriver.jsp?id=" + driverId + "&msg=error");
            }
        } else {
            response.sendRedirect("editdriver.jsp?id=" + driverId + "&msg=error");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("editdriver.jsp?id=" + driverId + "&msg=error");
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
