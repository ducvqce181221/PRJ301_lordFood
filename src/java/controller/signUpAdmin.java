/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DBContext.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;
import model.Product;

/**
 *
 * @author VU QUANG DUC - CE181221
 */
public class signUpAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signUpAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signUpAdmin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String username = request.getParameter("username").trim();
        String password = request.getParameter("pass").trim();
        String email = request.getParameter("email").trim();

        StringBuilder errorMessage = new StringBuilder();

        // Regular expressions for validation
        Pattern usernamePattern = Pattern.compile("^[A-Za-z0-9]+@admin$");
        Pattern passwordPattern = Pattern.compile("^(?=.*[A-Za-z]).{6,}$");

        // Validate username
        if (!usernamePattern.matcher(username).matches()) {
            errorMessage.append("Invalid username!<br>");
            request.setAttribute("user", username);
            request.setAttribute("email", email);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("signUpAdmin.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (!passwordPattern.matcher(password).matches()) {
            errorMessage.append("Password must be at least 6 characters and contain at least 1 letter.<br>");
            request.setAttribute("user", username);
            request.setAttribute("email", email);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("signUpAdmin.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement("SELECT * FROM admin");
            rs = ps.executeQuery();
            if (!rs.next()) {
                ps = conn.prepareStatement("DBCC CHECKIDENT ('admin', RESEED, 0)");
                ps.executeUpdate();
            }
            
            ps = conn.prepareStatement("SELECT * FROM admin WHERE Username = ? OR Email = ?");
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                errorMessage.append("Username or Email already exists!<br>");
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("signUpAdmin.jsp").forward(request, response);
                return;
            }
            ps = conn.prepareStatement("INSERT INTO Admin (Username, Password, Email) VALUES (?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.executeUpdate();

            request.setAttribute("user", username);
            request.setAttribute("pass", password);
            request.setAttribute("successMessage", "Sign up successful!");
            request.getRequestDispatcher("signInAdmin.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
