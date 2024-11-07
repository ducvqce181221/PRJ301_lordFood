package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateUserServlet This servlet updates user
 * information in the database.
 */
@WebServlet(name = "updateUserServlet", urlPatterns = {"/controller/updateUserServlet"})
public class updateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from the request
        String userID = request.getParameter("id");
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {

            // Establish the connection to the database
            conn = DBContext.ConnectDB.getConnection();

            // SQL update query to update the user information
            String updateQuery = "UPDATE users SET Username = ?, Email = ?, PhoneNumber = ?, Password = ? WHERE userID = ?";
            pstmt = conn.prepareStatement(updateQuery);

            // Set the parameters for the query
            pstmt.setString(1, userName);
            pstmt.setString(2, email);
            pstmt.setString(3, phoneNumber);
            pstmt.setString(4, password);
            pstmt.setInt(5, Integer.parseInt(userID));

            // Execute the update query
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // If the update was successful, redirect back to the management page
                response.sendRedirect(request.getContextPath() + "/admin/homeAdmin.jsp");
            } else {
                // If no rows were affected, send an error message
                request.setAttribute("message", "Error: Update failed.");
                request.getRequestDispatcher("/admin/editUser.jsp?id=" + userID).forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle any SQL or ClassNotFoundException by forwarding to an error page
            request.setAttribute("message", "Error: Database connection problem.");
            request.getRequestDispatcher("/admin/editUser.jsp?id=" + userID).forward(request, response);

        } finally {
            // Close the database resources
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet that updates user information in the database.";
    }
}
