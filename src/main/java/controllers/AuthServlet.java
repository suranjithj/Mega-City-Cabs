package controllers;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

import java.io.IOException;

public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.validateUser(username, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            session.setAttribute("username", user.getUsername());

            String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");
            session.removeAttribute("redirectAfterLogin");

            if (redirectAfterLogin != null) {
                response.sendRedirect(redirectAfterLogin);
            } else if ("admin".equalsIgnoreCase(user.getUsername())) {
                response.sendRedirect("interfaces/admin/admin-dashboard.jsp");
            } else {
                response.sendRedirect("interfaces/customer/customer-dashboard.jsp");
            }
        } else {

            request.setAttribute("error", "Invalid credentials!");
            request.getRequestDispatcher("interfaces/login.jsp").forward(request, response);
        }
    }
}
