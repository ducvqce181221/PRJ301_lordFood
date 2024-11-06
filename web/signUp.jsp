<%-- 
    Document   : signUp
    Created on : Sep 29, 2024, 8:19:02 PM
    Author     : Le Trong Luan _ CE181151
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link rel="stylesheet" href="CSS/signUp.css">
    </head>

    <body>
        <div class="sign-up-container">
            <div class="left-logo">
                <img src="img/logoLorFood.png" alt="Logo">
            </div>
            <div class="sign-up">
                <div class="login-container">
                    <form class="login-form" method="POST" action="signUpServlet" onsubmit="return validateSignUp()">
                        <h2>Sign Up</h2>
                        <div class="form-group">
                            <label for="username">Username*</label>
                            <input type="text" id="username" name="username" placeholder="Nhập tên người dùng của bạn tại đây" 
                                   value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email*</label>
                            <input type="email" id="email" name="email" placeholder="Nhập email của bạn tại đây" 
                                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
                            <span id="emailError" style="color: red; display: none;"></span>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber">Phone number*</label>
                            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Nhập số điện thoại của bạn tại đây" 
                                   value="<%= request.getAttribute("phoneNumber") != null ? request.getAttribute("phoneNumber") : "" %>" required>
                            <span id="phoneError" style="color: red; display: none;"></span>
                        </div>

                        <div class="form-group">
                            <label for="password">Password*</label>
                            <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn tại đây" 
                                   value="<%= request.getAttribute("password") != null ? request.getAttribute("password") : "" %>" required>
                        </div>
                        <div class="form-group">
                            <p>Already have an account? <a href="${pageContext.request.contextPath}/signIn.jsp">Sign in</a></p>
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
        <%@include file="components/modal.jsp" %>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
