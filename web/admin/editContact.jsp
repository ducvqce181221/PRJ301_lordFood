<%@ page import="DBContext.ConnectDB, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Contact</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                margin-top: 50px;
                max-width: 600px;
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .btn-primary {
                width: 100%;
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <a href="managementContact.jsp">Back to Contact Management</a>
            <h2>Edit Contact</h2>

            <%
                String contactID = request.getParameter("id");
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                String fullname = "", email = "", phoneNumber = "", complain = "";

                try {
                    conn = ConnectDB.getConnection();
                    String sql = "SELECT * FROM contact WHERE contactID = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, Integer.parseInt(contactID));
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        fullname = rs.getString("fullname");
                        email = rs.getString("Email");
                        phoneNumber = rs.getString("PhoneNumber");
                        complain = rs.getString("complain");
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>

            <form action="<%= request.getContextPath() %>/editContact" method="POST">

                <input type="hidden" name="contactID" value="<%= contactID %>">

                <div class="form-group">
                    <label for="fullname" class="form-label">Full Name</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" value="<%= fullname %>" required>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="<%= phoneNumber %>" required>
                </div>

                <div class="form-group">
                    <label for="complain" class="form-label">Complain</label>
                    <textarea id="complain" name="complain" class="form-control" required><%= complain %></textarea>
                </div>

                <button type="submit" class="btn btn-primary mt-3">Update</button>

            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
