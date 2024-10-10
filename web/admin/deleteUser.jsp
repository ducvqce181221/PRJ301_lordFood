<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Lấy userID từ tham số URL
    String userID = request.getParameter("id");

    // Kiểm tra nếu userID hợp lệ
    if (userID != null && !userID.isEmpty()) {
        String URL = "jdbc:sqlserver://localhost:1433;databaseName=lorfood;encrypt=true;trustServerCertificate=true";
        String USER = "sa";
        String PASSWORD = "12345678";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Câu truy vấn xóa người dùng theo userID
            String sql = "DELETE FROM users WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(userID));

            // Thực thi câu truy vấn
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Nếu xóa thành công, hiển thị thông báo
                out.println("<script>alert('User deleted successfully');</script>");
            } else {
                // Nếu không tìm thấy người dùng
                out.println("<script>alert('User not found or already deleted');</script>");
            }

            // Chuyển hướng về trang admin.jsp sau khi xóa xong
            response.sendRedirect("admin.jsp");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<script>alert('Error while deleting user');</script>");
        } finally {
            // Đóng tài nguyên
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    } else {
        out.println("<script>alert('Invalid user ID');</script>");
        response.sendRedirect("admin.jsp");
    }
%>
