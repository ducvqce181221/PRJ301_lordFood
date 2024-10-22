package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LE TRONG LUAN - CE181151
 */
@WebServlet(urlPatterns = {"/signUpServlet"})
public class signUpServlet extends HttpServlet {

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
            out.println("<title>Servlet signUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signUpServlet at " + request.getContextPath() + "</h1>");
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

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        String URL = "jdbc:sqlserver://localhost:1433;databaseName=lorfood;encrypt=true;trustServerCertificate=true";
        String USER = "sa";
        String PASSWORD = "12345678";
        String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement checkStmt = null;
        ResultSet rs = null;

        //        check email
        // Kiểm tra tên người dùng
        if (username == null || username.trim().isEmpty() || !username.matches("^[a-zA-Z0-9]+$")) {
            request.setAttribute("modalMessage", "Tên người dùng chỉ được chứa chữ cái và số, không được chứa ký tự đặc biệt.");
            request.setAttribute("modalType", "error");

            // Giữ lại các giá trị đã nhập cho người dùng nhập lại nếu có lỗi
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("password", password);  // Không nên truyền mật khẩu trong thực tế vì lý do bảo mật
            request.getRequestDispatcher("signUp.jsp").forward(request, response);

            return;
        }

// Kiểm tra số điện thoại
        if (!phoneNumber.matches("^\\d{10,11}$")) {
            request.setAttribute("modalMessage", "Số điện thoại phải có 10 hoặc 11 chữ số.");
            request.setAttribute("modalType", "error");

            // Giữ lại các giá trị đã nhập cho người dùng nhập lại nếu có lỗi
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("password", password);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);

            return;
        }

// Kiểm tra mật khẩu
        if (password.length() < 6 || !password.matches(".*[a-zA-Z]+.*")) {
            request.setAttribute("modalMessage", "Mật khẩu phải có ít nhất 6 ký tự và chứa ít nhất 1 chữ cái.");
            request.setAttribute("modalType", "error");

            // Giữ lại các giá trị đã nhập cho người dùng nhập lại nếu có lỗi
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("password", password);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);

            return;
        }

        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Sử dụng truy vấn chính xác để kiểm tra trùng lặp
            String checksql = "SELECT * from users where (Email) = ? or (PhoneNumber) = ?";
            checkStmt = conn.prepareStatement(checksql);
            checkStmt.setString(1, email.trim()); // Xóa khoảng trắng trước và sau email
            checkStmt.setString(2, phoneNumber.trim()); // Xóa khoảng trắng trước và sau số điện thoại
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Nếu có bản ghi trùng lặp, trả về lỗi
                request.setAttribute("modalMessage", "Email hoặc số điện thoại đã được sử dụng. Vui lòng nhập dữ liệu khác.");
                request.setAttribute("modalType", "error");
                request.setAttribute("username", username);
                request.setAttribute("email", email);
                request.setAttribute("phoneNumber", phoneNumber);
                request.setAttribute("password", password);
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            } else {
                // Nếu không có bản ghi nào trùng, thực hiện việc đăng ký
                String sql = "INSERT INTO users (Username, Password, Email, PhoneNumber, created_at) VALUES (?, ?, ?, ?, GETDATE())";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setString(3, email.trim()); // Lưu email đã được trim
                stmt.setString(4, phoneNumber.trim()); // Lưu số điện thoại đã được trim

                int row = stmt.executeUpdate();
                if (row > 0) {
                    request.setAttribute("modalMessage", "Đăng ký thành công!");
                    request.setAttribute("modalType", "success");
                    response.sendRedirect("signIn.jsp");
                    return;
                } else {
                    request.setAttribute("modalMessage", "Đăng ký thất bại, vui lòng thử lại.");
                    request.setAttribute("modalType", "error");
                }
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("modalMessage", "Đã xảy ra lỗi khi đăng ký. Vui lòng thử lại.");
            request.setAttribute("modalType", "error");
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
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
