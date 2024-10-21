
package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import DBContext.ConnectDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LE TRONG LUAN - CE181151
 */

@WebServlet(name="deleteUser", urlPatterns={"/deleteUser"

public class deleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("id");

        if (userID != null && !userID.isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = ConnectDB.getConnection();

                // Bước 1: Xóa các bản ghi liên quan trong bảng contact
                String deleteContactsSQL = "DELETE FROM contact WHERE userID = ?";
                stmt = conn.prepareStatement(deleteContactsSQL);
                stmt.setInt(1, Integer.parseInt(userID));
                stmt.executeUpdate();

                // Bước 2: Xóa người dùng từ bảng users
                String deleteUserSQL = "DELETE FROM users WHERE userID = ?";
                stmt = conn.prepareStatement(deleteUserSQL);
                stmt.setInt(1, Integer.parseInt(userID));
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("admin/homeAdmin.jsp");  // Chuyển hướng về trang quản lý người dùng
                } else {
                    response.getWriter().write("Lỗi: Người dùng không tồn tại hoặc không thể xóa.");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response.getWriter().write("Có lỗi xảy ra: " + e.getMessage());
            } finally {
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException ignore) {
                    ignore.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("admin/homeAdmin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If needed, handle POST requests in the same way or redirect to doGet
        doGet(request, response);
    }
}
