<%-- 
    Document   : loginAdmin
    Created on : Nov 3, 2024, 12:46:06 PM
    Author     : Vu Quang Duc - CE181221
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Animated Login Form</title>
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="./css/loginAdmin.css">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <img class="wave" src="../img/loginAdmin/wave.png">
        <div class="container">
            <div class="img">
                <img src="../img/loginAdmin/bg.svg">
            </div>
            <div class="login-content">
                <form action="signInAdmin" method="post">
                    <img src="../img/loginAdmin/avatar.svg">
                    <h2 class="title">Welcome</h2>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>Username</h5>
                            <input type="text" name="user" class="input" value="${user}">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password</h5>
                            <input type="password" name="password" class="input" value="${pass}">
                        </div>
                    </div>

                    <a href="signUpAdmin.jsp">Create an account?</a>
                    <input type="submit" class="btn" value="Login">
                </form>

                <%-- Success Modal --%>
                <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="successModalLabel">Notification</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p id="successMessage"><%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <script>
            const inputs = document.querySelectorAll(".input");

            function addcl() {
                let parent = this.parentNode.parentNode;
                parent.classList.add("focus");
            }

            function remcl() {
                let parent = this.parentNode.parentNode;
                if (this.value == "") {
                    parent.classList.remove("focus");
                }
            }

            // Check all inputs on page load
            function checkInputFocus() {
                inputs.forEach(input => {
                    if (input.value !== "") {
                        let parent = input.parentNode.parentNode;
                        parent.classList.add("focus");
                    }
                });
            }

            inputs.forEach(input => {
                input.addEventListener("focus", addcl);
                input.addEventListener("blur", remcl);
            });

            document.addEventListener("DOMContentLoaded", function () {
                checkInputFocus(); // Check input focus on page load

                const successMessage = "<%= request.getAttribute("successMessage") != null ? request.getAttribute("successMessage") : "" %>";
                if (successMessage) {
                    const successModal = new bootstrap.Modal(document.getElementById('successModal'), {});
                    successModal.show();
                }
            });
        </script>
    </body>
</html>

