package controllers;

import dao.UserDAO;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import services.EmailService;

import java.io.IOException;
                            //Inheritance
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Polymorphism
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setName(name);
        user.setAddress(address);
        user.setPhone(phone);
        user.setNic(nic);
        user.setEmail(email);
        user.setPassword(password);

        boolean registered = userDAO.registerUser(user);

        if (registered) {
            // Send email notification
            EmailService.sendEmail(email, name, "Welcome to Mega City Cab!", "Thank you for registering.");
            response.setStatus(HttpServletResponse.SC_CREATED);
            
            request.setAttribute("message", "Registration successful! Please login.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("interfaces/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "User already exists. Please try again.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("interfaces/register.jsp").forward(request, response);
        }
    }
}
