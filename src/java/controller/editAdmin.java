/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

/**
 *
 * @author VU QUANG DUC - CE181221
 */
public class editAdmin extends HttpServlet {

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
            out.println("<title>Servlet editAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editAdmin at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);

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
        int adminID = Integer.parseInt(request.getParameter("id").trim());
        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        Pattern usernamePattern = Pattern.compile("^[A-Za-z0-9]+@admin$");
        Pattern passwordPattern = Pattern.compile("^(?=.*[A-Za-z]).{6,}$");

        if (!usernamePattern.matcher(username).matches()) {
            request.setAttribute("errorMessage", "Invalid username format!");
            request.setAttribute("showErrorModal", true);
            request.getRequestDispatcher("managementAdmin.jsp").forward(request, response);
            return;
        }
        
        if (!passwordPattern.matcher(password).matches()) {
            request.setAttribute("errorMessage", "Password must be at least 6 characters and contain at least 1 letter.");
            request.setAttribute("showErrorModal", true);
            request.getRequestDispatcher("managementAdmin.jsp").forward(request, response);
            return;
        }

//        System.out.println(adminID);
//        System.out.println(username);
//        System.out.println(email);
//        System.out.println(password);
        // Update admin logic here
        try {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                conn = DBContext.ConnectDB.getConnection();
                ps = conn.prepareStatement("UPDATE admin SET Username=?, Email=?, Password=? WHERE adminID=?");
                ps.setString(1, username);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setInt(4, adminID);
                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("managementAdmin.jsp");
                } else {
                    response.getWriter().println("ERROR UPDATE");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(editAdmin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database Error!");
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
