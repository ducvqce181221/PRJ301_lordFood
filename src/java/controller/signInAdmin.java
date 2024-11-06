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
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VU QUANG DUC - CE181221
 */
public class signInAdmin extends HttpServlet {

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
            out.println("<title>Servlet signInAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signInAdmin at " + request.getContextPath() + "</h1>");
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
        String user = request.getParameter("user").trim();
        String pass = EncryMD5(request.getParameter("password").trim());
        
        System.out.println(user);
        System.out.println(pass);

        try {
            if (isValidUser(user, pass)) {
                HttpSession session = request.getSession();
                session.setAttribute("userAdmin", user);
                response.sendRedirect("homeAdmin.jsp");
            } else {
                request.setAttribute("user", user);
                request.setAttribute("successMessage", "Invalid username or password!");
                request.getRequestDispatcher("signInAdmin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(signInAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }

//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            conn = ConnectDB.getConnection();
//            ps = conn.prepareStatement("SELECT * FROM admin WHERE Username = ? AND Password = ?");
//            ps.setString(1, user);
//            ps.setString(2, pass);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                HttpSession session = request.getSession();
//                session.setAttribute("userAdmin", user);
//                response.sendRedirect("homeAdmin.jsp");
//                return;
//            }
//
//            request.setAttribute("user", user);
//            request.setAttribute("successMessage", "Invalid username or password!");
//            request.getRequestDispatcher("signInAdmin.jsp").forward(request, response);
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
    }

    public boolean isValidUser(String user, String pass) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;

        try {
            con = ConnectDB.getConnection();
            pr = con.prepareStatement("SELECT * FROM admin WHERE Username = ? AND Password = ?");
            pr.setString(1, user);
            pr.setString(2, pass);
            rs = pr.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    private static String EncryMD5(String pass) {
        try {
            // Create a MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            // Add password bytes to digest
            md.update(pass.getBytes());
            // Get the hash's bytes
            byte[] digest = md.digest();
            // Convert byte array to hexadecimal format
            StringBuilder hexString = new StringBuilder();
            for (byte b : digest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            // Return the hashed value as a hex string
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
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
