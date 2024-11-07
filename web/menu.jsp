
<%-- Document : menu Created on : Sep 30, 2024, 11:31:22 PM Author : Le Trong Luan _ CE181151 --%> <%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ include file="components/header.jsp" %>


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

            <nav class="navbar navbar-expand-lg navbar-light category-custom" style="margin-top: 130px; background-color: white">
                <div class="container">
                    <a href="#" class="navbar-brand text-success">CATEGORIES</a>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <c:forEach items="${listCate}" var="c">
                                <li class="nav-item">
                                    <a href="categoryServlet?cateid=${c.categoryId}&action=getCate" class="nav-link ${param.cateid == c.categoryId ? 'active-category' : ''}" aria-current="page" style="padding-bottom: 3px;" >${c.category_name}</a>
                                </li>  
                            </c:forEach>
                        </ul>
                    </div>
                    <form class="d-flex" action="product" method="post">
                        <div class="position-relative d-flex" style="width: 260px">
                            <input style="padding-right: 35px;" name="searchFood" class="form-control" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn-icon position-absolute" style="top: 50%; left: 95%; transform: translate(-95%, -50%);" type="submit">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </nav>

            <div class="container menu-body " style="margin-bottom: 90px;">
                <div class="row g-5">
                    <c:forEach items="${listProducts}" var="x">
                        <div class="col-md-6 col-lg-4">
                            <div class="card" style="cursor: pointer" onclick="window.location.href = 'foodDetail?cateid=${x.categoryID}&productid=${x.product_id}'">
                                <span class="position-absolute badge bg-danger" style="top: 5px; left: 5px; font-size: 14px;">
                                    <c:forEach items="${listCate}" var="c">
                                        <c:if test="${c.categoryId == x.categoryID}">
                                            ${c.category_name}
                                        </c:if>
                                    </c:forEach>
                                </span>
                                <img class="card-img-top img-fluid" src="${x.imageURL}" alt=""/>
                                <div class="card-body">
                                    <h4 class="card-title" style="height: 57px;">
                                        <a href="#" class="text-decoration-none">${x.productName}</a>
                                    </h4>
                                    <p class="card-text">${x.description}</p>
                                    <div class="d-flex justify-content-between">
                                        <form action="cartServlet" method="post">
                                            <input type="hidden" name="action" value="increase">
                                            <input type="hidden" name="productID" value="${x.product_id}">
                                            <input type="hidden" name="quantity" value="1">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="bi bi-bag-check-fill ms-0 text-light"></i>
                                                ORDER NOW
                                            </button>

                                        </form>                               
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

            <div class="modal fade" id="noProductModal" tabindex="-1" aria-labelledby="noProductModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <c:if test="${noProduct}">
                                <h5 class="modal-title" id="noProductModalLabel">No Food Found!</h5>
                            </c:if>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <c:if test="${noProduct}">
                                <span>
                                    No food match your search criteria. Please try again with different food name
                                </span>
                                <i class="bi bi-emoji-frown"></i>
                            </c:if>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"
            ></script>
            <script>
                <c:if test="${noProduct || productExist}">
                                var myModal = new bootstrap.Modal(document.getElementById('noProductModal'));
                                myModal.show();
                </c:if>
            </script>
            <%@ include file="components/footer.jsp"%>
        </body>
    </html>