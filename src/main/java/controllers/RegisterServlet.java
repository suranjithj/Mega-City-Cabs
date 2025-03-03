package controllers;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; //Serialization
    private UserDAO userDAO = new UserDAO(); //Dependency Injection

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //Object Creation
        User user = new User();
        user.setUsername(username);
        user.setName(name);
        user.setAddress(address);
        user.setPhone(phone);
        user.setNic(nic);
        user.setEmail(email);
        user.setPassword(password);

        //Interaction between Objects
        boolean registered = userDAO.registerUser(user);
        //Control Flow
        if (registered) {
            request.setAttribute("message", "Registration successful! Please login.");
            request.getRequestDispatcher("interfaces/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed! Try again.");
            request.getRequestDispatcher("interfaces/register.jsp").forward(request, response);
        }
    }
}
