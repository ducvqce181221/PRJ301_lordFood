<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="CSS/header.css">
    </head>

    <body>
        <header class="custom-header">
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/homePage.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/aboutUs.jsp">AboutUs</a></li>
                    <li><a href="${pageContext.request.contextPath}/menu.jsp">Menu</a></li> <!-- Đổi từ PHP sang JSP -->
                </ul>
            </nav>

            <div class="logo-header-main">
                <img src="img/logoLorFood.png" alt="" />
            </div>

            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>

                    <li>
                        <div class="custom-h_cart">
                            <a href="${pageContext.request.contextPath}/cart.jsp">
                                <span>Cart</span>
                                <figure>
                                    <i class="fa fa-shopping-bag"></i>
                                    <!-- Sử dụng JSP EL để hiển thị số lượng sản phẩm -->
                                    <code>${cartItemCount != null ? cartItemCount : 0}</code>
                                </figure>
                            </a>
                        </div>
                    </li>

                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="custom-nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button">
                                <i class="fas fa-user fa-fw"></i>
                                <span class="username">
                                    <!-- Kiểm tra thuộc tính 'username' trong session -->
                                    <%
                                        if (session != null && session.getAttribute("username") != null) {
                                            out.print(session.getAttribute("username"));
                                        } else {
                                            out.print("Tài Khoản");
                                        }
                                    %>
                                </span>
                            </a>
                            <ul class="custom-dropdown-menu custom-dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <!-- Nếu chưa đăng nhập, hiển thị Sign In và Sign Up -->
                                <%
                                    if (session == null || session.getAttribute("username") == null) {
                                %>
                                <li><a class="custom-dropdown-item" href="${pageContext.request.contextPath}/signIn.jsp">Sign In</a></li>
                                <li><a class="custom-dropdown-item" href="${pageContext.request.contextPath}/signUp.jsp">Sign Up</a></li>
                                    <% 
                                        } else { 
                                    %>
                                <!-- Nếu đã đăng nhập, hiển thị nút Logout -->
                                <li><a class="custom-dropdown-item" href="${pageContext.request.contextPath}/logOutServlet">Logout</a></li>
                                    <% 
                                        }
                                    %>

                            </ul>
                        </li>
                    </ul>

                </ul>
            </nav>
        </header>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var dropdownToggle = document.querySelector('.nav-link.dropdown-toggle');
                var dropdownMenu = document.querySelector('.custom-dropdown-menu');

                dropdownToggle.addEventListener('click', function (event) {
                    event.preventDefault(); // Prevent default action when clicking dropdown toggle
                    dropdownMenu.classList.toggle('show'); // Toggle 'show' class to open/close menu
                });

                document.addEventListener('click', function (event) {
                    if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
                        dropdownMenu.classList.remove('show'); // Close the dropdown if clicked outside
                    }
                });

                var dropdownItems = document.querySelectorAll('.custom-dropdown-item');
                dropdownItems.forEach(function (item) {
                    item.addEventListener('click', function (event) {
                        dropdownMenu.classList.remove('show'); // Close the dropdown after selecting an item
                    });
                });
            });
        </script>

    </body>

</html>
