<%-- 
    Document   : managementAdmin
    Created on : Oct 7, 2024, 12:02:59 PM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    </style>
</head>

<body class="sb-nav-fixed">
    <c:if test="${empty sessionScope.userAdmin}">
        <% 
           response.sendRedirect("signInAdmin.jsp");
        %>
    </c:if>

    <% 
            String userAdmin = (String) session.getAttribute("userAdmin");
    %>

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
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i>
                    <% if (userAdmin != null) { %> 
                    <span><%= userAdmin %></span> <!-- Hiển thị tên admin -->
                    <% } %>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="/logOutServlet">Logout</a></li>
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
                        <a class="nav-link" href="productManagement">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Product Management
                        </a>
                        <a class="nav-link" href="categoryServlet?&action=showInfo">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Category Management
                        </a>
                        <a class="nav-link" href="managementAdmin.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Admin account
                        </a>
                        <a class="nav-link" href="ShippingMethodServlet?&action=showInfo">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Shipping Method
                        </a>
                        <a class="nav-link" href="PaymentMethodServlet?&action=showInfo">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Payment Method
                        </a>
                        <a class="nav-link" href="PaymentServlet?&action=show">
                            <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                            Payment Management
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
                    <h1 class="mt-4">Admin Management</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">View Admins</li>
                    </ol>
                    <a style="text-decoration: none; " class="breadcrumb mb-4" href="signUpAdmin.jsp">Add Admin</a>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Admin List
                        </div>
                        <!--                        <form method="GET" action="admin.php" class="d-flex">
                                                    <input type="text" name="search" class="form-control" placeholder="Tìm kiếm người dùng..." aria-label="Search">
                                                    <button class="btn btn-primary ms-2" type="submit">Tìm kiếm</button>
                                                </form>-->
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Admin ID</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Sign up at</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Connection con = null;
                                        PreparedStatement ps = null;
                                        ResultSet rs = null;
                                        
                                        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm");

                                        try {
                                            con = DBContext.ConnectDB.getConnection();
                                            ps = con.prepareStatement("SELECT * FROM admin");
                                            rs = ps.executeQuery();
                                            if (!rs.isBeforeFirst()) { // Kiểm tra xem có kết quả hay không
                                                session.removeAttribute("userAdmin");
                                                response.sendRedirect("signInAdmin.jsp");
                                                return;
                                            }
                                            while (rs.next()) {     
                                    %>
                                    <tr>
                                        <td><%= rs.getInt("adminID") %></td>
                                        <td><%= rs.getString("Username") %></td>
                                        <td><%= rs.getString("Email") %></td>
                                        <td><%= rs.getString("Password") %></td>                
                                        <td><%= formatter.format(rs.getTimestamp("created_at")) %></td>
                                        <td>
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editUserModal_<%= rs.getInt("adminID") %>">
                                                Edit
                                            </button>
                                            <a href="deleteAdmin?id=<%= rs.getInt("adminID") %>" class="btn btn-danger" role="button" onclick="return confirmDelete('<%= rs.getString("Username") %>');">Delete</a>

                                        </td>

                                        <!-- Modal -->
                                <div class="modal fade" id="editUserModal_<%= rs.getInt("adminID") %>" tabindex="-1" aria-labelledby="editUserModalLabel_<%= rs.getInt("adminID") %>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editUserModalLabel_<%= rs.getInt("adminID") %>">Edit Admin Info</h5> 
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form action="editAdmin?id=<%= rs.getInt("adminID") %>" method="post">
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label for="username" class="form-label">Username</label>
                                                        <input type="text" class="form-control" id="username" name="username" value="<%= rs.getString("Username") %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="email" class="form-label">Email</label>
                                                        <input type="email" class="form-control" id="email" name="email" value="<%= rs.getString("Email") %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="password" class="form-label">Password</label>
                                                        <input type="password" class="form-control" id="password" name="password" value="<%= rs.getString("Password") %>" required>
                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                </tr>
                                <% 
                                        } 
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                            if (rs != null) rs.close();
                                            if (ps != null) ps.close();
                                            if (con != null) con.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>


        <!-- Modal HTML -->
        <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="errorModalLabel">Error</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script>
                                                function confirmDelete(username) {
                                                    return confirm("Are you sure you want to delete " + username + "?");
                                                }


                                                const modalElements = document.querySelectorAll('.modal');
                                                modalElements.forEach(function (modal) {
                                                    modal.addEventListener('hidden.bs.modal', function () {
                                                        const form = modal.querySelector('form');
                                                        if (form) {
                                                            form.reset(); // Đặt lại form
                                                        }
                                                    });
                                                });


        <c:if test="${showErrorModal}">
                                                var myModal = new bootstrap.Modal(document.getElementById('errorModal'));
                                                myModal.show();
        </c:if>
    </script>
</body>

</html>