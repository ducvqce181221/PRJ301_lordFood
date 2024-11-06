<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In</title>
        <link rel="stylesheet" href="CSS/signIn.css">
    </head>

    <body>
        <div class="sign-in">
            <div class="left-logo">
                <img src="/img/logoLorFood.png" alt="Logo">
            </div>
            <div class="login-container">
                <form class="login-form" method="POST" action="signInServlet" onsubmit="return validateLogin()">
                    <h2>Sign in</h2>
                    <div class="form-group">
                        <label for="identifier">Email or Phone number*</label>
                        <input type="text" id="identifier" name="identifier" placeholder="Nhập email hoặc số điện thoại của bạn tại đây" required>
                        <span id="identifierError" style="color: red; display: none;"></span>
                    </div>
                    <div class="form-group">
                        <label for="password">Password*</label>
                        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn tại đây" required>
                    </div>
                    <div class="form-group">
                        <p>Don't have an account? <a href="${pageContext.request.contextPath}/signUp.jsp">Create an Account</a></p>
                    </div>
                    <button class="submit-signIn" type="submit" name="submit-signIn">Submit</button>
                </form>
            </div>
        </div>

        <!-- Modal for error messages -->
        <div id="errorModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p id="errorMessage"></p>
            </div>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById("errorModal");
            var modalMessage = document.getElementById("errorMessage");
            var span = document.getElementsByClassName("close")[0];

            // Close the modal when the close button is clicked
            span.onclick = function () {
                modal.style.display = "none";
            }

            // Close the modal when clicking outside the modal
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            // Show the modal if there is an error message from the server
            <% if (request.getAttribute("errorMessage") != null) { %>
            modalMessage.textContent = "<%= request.getAttribute("errorMessage") %>";
            modal.style.display = "block";
            <% } %>
        </script>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
