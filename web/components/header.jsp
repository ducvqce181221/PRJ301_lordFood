<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="CSS/header.css">
    </head>
    <style>

        .cart-figure {
            position: relative;
            display: inline-block;
            margin: 0;
            padding: 10px;
            background-color: #f9f9f9; /* Light background */
            border-radius: 8px;
            cursor: pointer;
        }

        .cart-icon {
            font-size: 24px; /* Larger cart icon */
            color: #333; /* Darker color for contrast */
        }

        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: #ff4d4d; /* Eye-catching red for the count */
            color: white;
            border-radius: 50%;
            padding: 4px 8px;
            font-size: 12px;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for depth */
        }
    </style>
    <body>
        <header class="custom-header">
            <!-- Ph?n menu bên trái -->
            <nav class="custom-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/homePage.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/aboutUs.jsp">AboutUs</a></li>
                    <li><a href="${pageContext.request.contextPath}/product">Menu</a></li> <!-- ??i t? PHP sang JSP -->
                </ul>
            </nav>

            <!-- Logo gi?a trang -->
            <div class="logo-header">
                <img src="img/logoLorFood.png" alt="Logo LorFood" />
            </div>

            <!-- Ph?n menu bên ph?i -->
            <nav class="custom-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
                    <li>
                        <div class="custom-h_cart">
                            <a href="cartServlet?productID=0&quantity=0&action=increase" style="text-decoration: none;"> <!-- Prevent default link behavior -->
                                <span>Cart</span>
                                <figure class="cart-figure" style="display: inline; vertical-align: middle;">
                                    <i class="fa fa-shopping-bag cart-icon"></i>
                                    <span class="cart-count">${sessionScope.size}</span>  <!-- Display number of items in cart -->
                                </figure>
                            </a>

                        </div>
                    </li>
                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="custom-nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button">
                                <i class="fas fa-user fa-fw"></i>
                                <span class="username">
                                    <!-- Ki?m tra thu?c tính 'username' trong session -->
                                    <%
                                        if (session != null && session.getAttribute("username") != null) {
                                            out.print(session.getAttribute("username"));
                                        } else {
                                            out.print("Account");
                                        }
                                    %>
                                </span>
                            </a>
                            <ul class="custom-dropdown-menu custom-dropdown-menu-end" aria-labelledby="navbarDropdown">

                                <%
                                    if (session == null || session.getAttribute("username") == null) {
                                %>
                                <li><a class="custom-dropdown-item" href="${pageContext.request.contextPath}/signIn.jsp">Sign In</a></li>
                                <li><a class="custom-dropdown-item" href="${pageContext.request.contextPath}/signUp.jsp">Sign Up</a></li>
                                    <% 
                                        } else { 
                                    %>

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
                    event.preventDefault(); // Ng?n ch?n hành ??ng m?c ??nh khi click vào dropdown
                    dropdownMenu.classList.toggle('show'); // Thay ??i tr?ng thái hi?n th? c?a dropdown
                });

                document.addEventListener('click', function (event) {
                    if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
                        dropdownMenu.classList.remove('show'); // ?óng dropdown n?u click bên ngoài
                    }
                });
            });
        </script>
    </body>
</html>
