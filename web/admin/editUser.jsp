<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String modalMessage = "";
    String modalType = "";

    String URL = "jdbc:sqlserver://localhost:1433;databaseName=lorfood;encrypt=true;trustServerCertificate=true";
    String USER = "sa";
    String PASSWORD = "12345678";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('Database connection error');</script>");
    }

    String userID = request.getParameter("userID");

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        String phoneRegex = "^[0-9]{10,11}$";
        String emailRegex = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";

        if (phoneNumber.matches(phoneRegex) && email.matches(emailRegex)) {
            String sql = "SELECT * FROM users WHERE (Email = ? OR PhoneNumber = ?) AND userID != ?";
            PreparedStatement checkStmt = conn.prepareStatement(sql);
            checkStmt.setString(1, email);
            checkStmt.setString(2, phoneNumber);
            checkStmt.setInt(3, Integer.parseInt(userID));

            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                modalMessage = "Email hoặc Số Điện Thoại đã tồn tại!";
                modalType = "error";
            } else {
                String updateQuery = "UPDATE users SET Username = ?, Email = ?, PhoneNumber = ?, Password = ? WHERE userID = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);

                updateStmt.setString(1, userName);
                updateStmt.setString(2, email);
                updateStmt.setString(3, phoneNumber);
                updateStmt.setString(4, password);
                updateStmt.setInt(5, Integer.parseInt(userID));

                int rowsAffected = updateStmt.executeUpdate();
                if (rowsAffected > 0) {
                    modalMessage = "Cập nhật thành công!";
                    modalType = "success";
                } else {
                    modalMessage = "Đã xảy ra lỗi. Vui lòng thử lại.";
                    modalType = "error";
                }
            }
        } else {
            modalMessage = "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.";
            modalType = "error";
        }
    }

    // Truy vấn thông tin người dùng hiện tại
    String query = "SELECT * FROM users WHERE userID = ?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setInt(1, Integer.parseInt(userID));
    ResultSet rs = stmt.executeQuery();
    rs.next(); // Lấy thông tin người dùng

%>

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
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .edit-user-container {
            margin: 0 auto;
            min-height: 80vh;
            padding: 20px;
        }

        .edit-user {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            max-width: 500px;
            margin: 0 auto;
        }

        .edit-user-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .edit-user-group {
            margin-bottom: 15px;
        }

        .edit-user-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #333;
        }

        .edit-user-group input[type="text"],
        .edit-user-group input[type="email"],
        .edit-user-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-shadow: none;
            font-size: 16px;
            color: #333;
        }

        .edit-user-group input[type="text"]:focus,
        .edit-user-group input[type="email"]:focus,
        .edit-user-group input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        .submit-edit {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-edit:hover {
            background-color: #0056b3;
        }

        .alert {
            margin: 20px;
            font-size: 14px;
        }

        .password-container {
            position: relative;
        }

        .password-container input {
            width: 100%;
            padding-right: 40px;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #007bff;
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

                        <a class="nav-link" href="./managementUser.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            User Management
                        </a>

                        <a class="nav-link" href="./managementContact.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Contact Management
                        </a>

                        <a class="nav-link" href="./product.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Product Management
                        </a>

                        <a class="nav-link" href="./Category.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Category Management
                        </a>

                        <a class="nav-link" href="./order.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Order Management
                        </a>

                        <a class="nav-link" href="./orderDetail.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Order Detail
                        </a>

                        <a class="nav-link" href="./managementAdmin.jsp">
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
            <%
                if (!modalMessage.isEmpty()) {
                    out.print("<div class='alert alert-" + (modalType.equals("success") ? "success" : "danger") + "'>");
                    out.print(modalMessage);
                    out.print("</div>");
                }
            %>
            <div class="edit-user-container">
                <div class="edit-user">
                    <form class="edit-user-form" method="POST" action="">
                        <h2>Edit User</h2>
                        <div class="edit-user-group">
                            <label for="username">Username*</label>
                            <input type="text" id="username" name="username" value="<%= rs.getString("Username") %>" required>
                        </div>
                        <div class="edit-user-group">
                            <label for="email">Email*</label>
                            <input type="email" id="email" name="email" value="<%= rs.getString("Email") %>" required>
                        </div>
                        <div class="edit-user-group">
                            <label for="phoneNumber">Phone number*</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" value="<%= rs.getString("PhoneNumber") %>" required>
                        </div>
                        <div class="edit-user-group">
                            <label for="password">Password*</label>
                            <div class="password-container">
                                <input type="password" id="password" name="password" value="<%= rs.getString("Password") %>" required>
                                <span id="togglePassword" class="toggle-password">
                                    <i class="fas fa-eye"></i>
                                </span>
                            </div>
                        </div>

                        <button class="submit-edit" type="submit" name="submit-edit">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('togglePassword').addEventListener('click', function (e) {
            const passwordField = document.getElementById('password');
            const icon = this.querySelector('i');

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    </script>
</body>

</html>
