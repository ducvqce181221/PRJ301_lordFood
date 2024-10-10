package controller;

import DBContext.ConnectDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/contactServlet"})
public class contactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {   

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String complain = request.getParameter("message");

        Connection conn = null;
        PreparedStatement pstmt = null;
        String message = "";
        String modalType = "";

        try {
            conn = ConnectDB.getConnection();

            String sql = "INSERT INTO contact (fullName, Email, PhoneNumber, complain, created_at) VALUES (?, ?, ?, ?, GETDATE())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, phoneNumber);
            pstmt.setString(4, complain);

            int row = pstmt.executeUpdate();
            if (row > 0) {
                // Đặt thông báo thành công
                message = "Cảm ơn bạn đã gửi phản hồi! Chúng tôi sẽ xử lý sớm nhất có thể.";
                modalType = "success";
            } else {
                // Đặt thông báo thất bại
                message = "Có lỗi xảy ra khi gửi phản hồi của bạn. Vui lòng thử lại!";
                modalType = "error";
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Đặt thông báo lỗi khi có Exception
            message = "Đã xảy ra lỗi kết nối cơ sở dữ liệu. Vui lòng thử lại!";
            modalType = "error";
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Gửi thông báo và loại modal tới JSP để hiển thị modal
        request.setAttribute("modalMessage", message);
        request.setAttribute("modalType", modalType);
        request.getRequestDispatcher("feedBack.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý phản hồi khách hàng";
    }
}
