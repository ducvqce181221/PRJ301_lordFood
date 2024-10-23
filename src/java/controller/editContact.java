package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import DBContext.ConnectDB;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet for editing contact
 */
@WebServlet("/editContact")
public class editContact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String contactID = request.getParameter("contactID");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String complain = request.getParameter("complain");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectDB.getConnection();
            String sql = "UPDATE contact SET fullname = ?, Email = ?, PhoneNumber = ?, complain = ? WHERE contactID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, email);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, complain);
            stmt.setInt(5, Integer.parseInt(contactID));

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect(request.getContextPath() + "/admin/managementContact.jsp?message=Contact Updated Successfully");
            } else {
                request.setAttribute("message", "Error: Contact update failed.");
                request.getRequestDispatcher("/editContact.jsp?id=" + contactID).forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error updating contact.");
            request.getRequestDispatcher("/editContact.jsp?id=" + contactID).forward(request, response);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
