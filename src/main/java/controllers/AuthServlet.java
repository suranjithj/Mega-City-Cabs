package controllers;

import dao.UserDAO;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;

import java.io.IOException;

public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        User user = userDAO.validateUser(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            session.setAttribute("username", user.getUsername());

            // Set cookie if "Remember Me" is checked
            if ("on".equals(rememberMe)) {
                Cookie userCookie = new Cookie("username", user.getUsername());
                userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                userCookie.setPath("/");
                response.addCookie(userCookie);
            }

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
