package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; //Serialization
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Session Management
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); //Encapsulation
        }
        response.sendRedirect("interfaces/login.jsp"); //Control Flow
    }
}
