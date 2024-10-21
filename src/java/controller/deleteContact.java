package controller;

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

@WebServlet("/deleteContact")  // Đường dẫn URL cho servlet
public class deleteContact extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy contactID từ URL
        String contactID = request.getParameter("id");

        // Kiểm tra xem contactID có hợp lệ không
        if (contactID != null && !contactID.isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                // Kết nối tới cơ sở dữ liệu
                conn = ConnectDB.getConnection();

                // Tạo câu lệnh SQL để xóa liên hệ
                String deleteContactSQL = "DELETE FROM contact WHERE contactID = ?";
                stmt = conn.prepareStatement(deleteContactSQL);
                stmt.setInt(1, Integer.parseInt(contactID));

                // Thực thi câu lệnh SQL
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Nếu xóa thành công, chuyển hướng về trang quản lý liên hệ với thông báo
                    response.sendRedirect("admin/managementContact.jsp?message=deleted");
                } else {
                    // Nếu không xóa được, thông báo lỗi
                    response.getWriter().write("Lỗi: Không thể xóa liên hệ.");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                response.getWriter().write("Có lỗi xảy ra: " + e.getMessage());
            } finally {
                // Đóng các kết nối cơ sở dữ liệu
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
            // Nếu contactID không hợp lệ, chuyển hướng về trang quản lý liên hệ
            response.sendRedirect("managementContact.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng các yêu cầu POST đến phương thức doGet
        doGet(request, response);
    }
}
