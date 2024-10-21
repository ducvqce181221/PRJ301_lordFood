<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - Management Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/styles.css" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .card {
                margin-top: 50px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                background-color: #007bff;
                color: white;
                font-weight: bold;
                text-align: center;
            }

            .form-label {
                font-weight: bold;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .form-text a {
                color: #007bff;
            }

            .form-text a:hover {
                color: #0056b3;
                text-decoration: underline;
            }
        </style>
    </head>

    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3" href="index.html">Management Admin</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" name="search" placeholder="Tìm kiếm người dùng..." aria-label="Search">
                    <button class="btn btn-primary" id="btnNavbarSearch" type="submit">Tìm kiếm</button>
                </div>
            </form>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="./signInAdmin.php">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Management</div>
                            <a class="nav-link" href="homeAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                User Management
                            </a>
                            <a class="nav-link" href="managementContact.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Contact Management
                            </a>
                            <a class="nav-link" href="managementProduct.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Product Management
                            </a>
                            <a class="nav-link" href="managementCategory.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Category Management
                            </a>
                            <a class="nav-link" href="managementOrder.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Order Management
                            </a>
                            <a class="nav-link" href="managementOrderDetail.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Order Detail
                            </a>
                            <a class="nav-link" href="managementAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Admin account
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Management Admin
                    </div>
                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">User Management</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">View Users</li>
                        </ol>
                        <a style="text-decoration: none;" class="breadcrumb mb-4" href="./addUser.php">Add User</a>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                User List
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Phone Number</th>
                                            <th>Password</th>
                                            <th>Time</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            String URL = "jdbc:sqlserver://localhost:1433;databaseName=lorfood;encrypt=true;trustServerCertificate=true";
                                            String USER = "sa";
                                            String PASSWORD = "12345678";

                                            Connection conn = null;
                                            PreparedStatement pstmt = null;
                                            ResultSet rs = null;

                                            try {
                                                // Sử dụng driver cho SQL Server
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                conn = DriverManager.getConnection(URL, USER, PASSWORD);

                                                // Truy vấn dữ liệu từ bảng user
                                                String sql = "SELECT userID, Username, Email, PhoneNumber, Password, created_at FROM users";  // Chắc chắn rằng tên bảng đúng
                                                pstmt = conn.prepareStatement(sql);
                                                rs = pstmt.executeQuery();

                                                while (rs.next()) {
                                                    int userID = rs.getInt("userID");
                                                    String username = rs.getString("Username");
                                                    String email = rs.getString("Email");
                                                    String phoneNumber = rs.getString("PhoneNumber");
                                                    String password = rs.getString("Password");
                                                    String createdAt = rs.getString("created_at"); // Lấy giá trị created_at

                                                    // Hiển thị dữ liệu trong bảng
                                                    out.println("<tr>");
                                                    out.println("<td>" + userID + "</td>");
                                                    out.println("<td>" + username + "</td>");
                                                    out.println("<td>" + email + "</td>");
                                                    out.println("<td>" + phoneNumber + "</td>");
                                                    out.println("<td>" + password + "</td>");
                                                    out.println("<td>" + createdAt + "</td>");
                                                    out.println("<td>");
                                                    out.println("<a href='editUser.jsp?id=" + userID + "' class='btn btn-warning'>Edit</a> ");
                                                    out.println("<a href='processAdmin/deleteUser.jsp?id=" + userID + "' class='btn btn-danger' onclick='return confirm(\"Are you sure?\")'>Delete</a>");
                                                    out.println("</td>");
                                                    out.println("</tr>");
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                                                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                                                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                                            }
                                        %>
                                    </tbody>
                                   
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const sidebarToggle = document.getElementById('sidebarToggle');
                if (sidebarToggle) {
                    sidebarToggle.addEventListener('click', function (event) {
                        event.preventDefault();
                        document.body.classList.toggle('sb-sidenav-toggled');
                    });
                }
            });
        </script>
    </body>

</html>
