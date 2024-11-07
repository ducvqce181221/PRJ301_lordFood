<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String modalMessage = "";
    String modalType = "";

    

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;  // Make sure to declare 'rs' here

    try {
        conn = DBContext.ConnectDB.getConnection();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('Database connection error');</script>");
    }

    // Get the id parameter from the request
    String id = request.getParameter("id");

    // Check if the id is not null or empty
    if (id == null || id.isEmpty()) {
        modalMessage = "User ID is missing.";
        modalType = "error";
    } else {
        // Query the current user info
        try {
            String query = "SELECT * FROM users WHERE userID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(id));
            rs = pstmt.executeQuery();

            // Check if the result set has any data
            if (!rs.next()) {
                modalMessage = "User not found with the given ID.";
                modalType = "error";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            modalMessage = "Error fetching user information.";
            modalType = "error";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
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
            /* Tạo khoảng trống cho biểu tượng */
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

<body>
    <div id="layoutSidenav_content">
        <% if (!modalMessage.isEmpty()) { %>
        <div class='alert alert-<%= modalType.equals("success") ? "success" : "danger" %>'>
            <%= modalMessage %>
        </div>
        <% } %>

        <% if (rs != null) { %> <!-- Only show the form if the user is found -->
        <div class="edit-user-container">
            <div class="edit-user">
                <form class="edit-user-form" method="POST" action="${pageContext.request.contextPath}/controller/updateUserServlet">
                    <input type="hidden" name="id" value="<%= id %>"> <!-- Pass the user ID -->
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
        <% } %> <!-- Close the form display condition -->
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
