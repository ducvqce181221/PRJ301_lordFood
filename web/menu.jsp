<%-- Document : menu Created on : Sep 30, 2024, 11:31:22 PM Author : Le Trong Luan _ CE181151 --%> <%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Swiper Menu Design</title>
            <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"
                />

            <link
                rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
                />

            <link rel="stylesheet" href="./CSS/menu.css" />
        </head>

        <body>
            <%--<%@include file="components/header.jsp" %>--%>

            <nav class="navbar navbar-expand-lg navbar-light bg-light mb-5 fixed-top">
                <div class="container">
                    <a href="#" class="navbar-brand text-success">CATEGORIES</a>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <c:forEach items="${listCate}" var="c">
                                <li class="nav-item">
                                    <a href="categoryServlet?cateid=${c.categoryId}" class="nav-link active" aria-current="page">${c.category_name}</a>
                                </li>  
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container menu-body">
                <div class="row g-4">
                    <c:forEach items="${listProducts}" var="x">
                        <div class="col-md-6 col-lg-4">
                            <div class="card" style="cursor: pointer"
                                 onclick="window.location.href = 'foodDetail?cateid=${x.categoryID}&productid=${x.product_id}'">
                                <img class="card-img-top img-fluid" src="${x.imageURL}" alt="" />
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#" class="text-decoration-none">${x.productName}</a>
                                    </h4>
                                    <p class="card-text">${x.description}</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="" class="btn btn-primary">
                                            <i class="bi bi-bag-check-fill"></i>
                                            ORDER NOW
                                        </a>                                  
                                        <h4 class="text-danger">
                                            <fmt:formatNumber value="${x.price}" pattern="#,###"/>VND
                                        </h4>              
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <%--<%@include file="components/footer.jsp" %>--%>
            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
            ></script>
        </body>
    </html>
