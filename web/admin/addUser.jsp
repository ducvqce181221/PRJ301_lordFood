<%-- 
    Document   : signUp
    Created on : Sep 29, 2024, 8:19:02 PM
    Author     : Le Trong Luan _ CE181151
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link rel="stylesheet" href="../CSS/signUp.css">
    </head>

    <body>
        <div class="sign-up-container">
            <div class="left-logo">
                <img src="../img/logoLorFood.png" alt="Logo">
            </div>
            <div class="sign-up">
                <div class="login-container">
                    <form class="login-form" method="POST"action="${pageContext.request.contextPath}/controller/addUserServlet" onsubmit="return validateSignUp()">
                        <h2>Sign Up</h2>
                        <div class="form-group">
                            <label for="username">Username*</label>
                            <input type="text" id="username" name="username" placeholder="Enter your username"
                                   value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email*</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email"
                                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber">Phone number*</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number"
                                   value="<%= request.getAttribute("phoneNumber") != null ? request.getAttribute("phoneNumber") : "" %>" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password*</label>
                            <input type="password" id="password" name="password" placeholder="Enter your password"
                                   value="<%= request.getAttribute("password") != null ? request.getAttribute("password") : "" %>" required>
                        </div>

                        <button class="submit-signUp" type="submit" name="submit-signUp">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            // Hàm đóng modal
            function closeModal() {
                document.getElementById('modal').style.display = 'none';
            }

            // Tự động đóng modal khi nhấn vào nút "X"
            var span = document.getElementsByClassName("close")[0];
            span.onclick = function () {
                closeModal();
            }

            // Tự động đóng modal khi nhấn bất kỳ đâu ngoài modal
            window.onclick = function (event) {
                var modal = document.getElementById('modal');
                if (event.target == modal) {
                    closeModal();
                }
            }
        </script>
        <!-- Include the modal -->
        <%@include file="../components/modal.jsp" %>

    </body>
</html>
