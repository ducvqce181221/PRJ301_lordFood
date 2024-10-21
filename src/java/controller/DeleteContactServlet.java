package controller;

import DBContext.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet to delete contact by contactID
 * Author: LE TRONG LUAN - CE181151
 */
@WebServlet(urlPatterns = {"/controller/DeleteContactServlet"})
public class DeleteContactServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteContactServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Contact deleted successfully</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * Deletes a contact from the database using contactID passed as a parameter.
     * 
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the contactID from the request parameter
        String contactID = request.getParameter("id");

        if (contactID != null && !contactID.isEmpty()) {
            try (Connection conn = ConnectDB.getConnection()) {
                // SQL query to delete the contact
                String sql = "DELETE FROM contact WHERE contactID = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(contactID));
                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        // If the contact was deleted successfully
                        System.out.println("Contact deleted successfully.");
                    } else {
                        System.out.println("No contact found with the given ID.");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Invalid contact ID.");
        }

        // Redirect back to the contact management page after deletion
        response.sendRedirect("managementContact.jsp");
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * 
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for deleting contact based on contactID";
    }

}
