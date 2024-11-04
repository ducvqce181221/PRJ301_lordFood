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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Animated Login Form</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
                <form action="signUpAdmin" method="post" id="signupForm">
                    <img src="../img/loginAdmin/avatar.svg">
                    <h2 class="title">FIRST TIME?</h2>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>Username</h5>
                            <input type="text" class="input" name="username" required
                                   <c:if test="${user != null}">
                                       value="${user}"
                                   </c:if>>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password</h5>
                            <input type="password" class="input" name="pass" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fa-solid fa-paper-plane"></i>
                        </div>
                        <div class="div">
                            <h5>Email</h5>
                            <input type="email" class="input" name="email" required
                                   <c:if test="${email != null}">
                                       value="${email}"
                                   </c:if>>
                        </div>
                    </div>

                    <a href="signInAdmin.jsp">Already a admin?</a>
                    <input type="submit" class="btn" value="Sign up">
                </form>

                <!-- Modal Bootstrap cho thông báo lỗi -->
                <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="errorModalLabel">Sign up Error</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p id="errorMessage"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %></p>
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

                const errorMessage = "<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>";
                if (errorMessage) {
                    const errorModal = new bootstrap.Modal(document.getElementById('errorModal'), {});
                    errorModal.show();
                }
            });

        </script>
    </body>
</html>

