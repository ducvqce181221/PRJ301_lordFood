<%-- Document : foodDetail Created on : Oct 15, 2024, 7:42:48 PM Author : Vu Quang Duc - CE181221 --%> <%@page
contentType="text/html" pageEncoding="UTF-8"%> <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>JSP Page</title>
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

        <link rel="stylesheet" href="./CSS/foodDetail.css" />
    </head>
    <body>
        <div class="container mb-5 mt-4">
            <div class="d-flex align-items-center p-3 breadcrumb-container">
                <a href="homePage.jsp" class="breadcrumb-link">HOME</a>
                <i class="bi bi-chevron-right mx-2"></i>
                <a href="product" class="breadcrumb-link">MENU</a>
                <i class="bi bi-chevron-right mx-2"></i>
                <a href="categoryServlet?cateid=${cate.categoryId}" class="breadcrumb-link">${cate.category_name}</a>
                <i class="bi bi-chevron-right mx-2"></i>
                <span class="breadcrumb-item text-secondary">${product.productName}</span>
            </div>
        </div>
        <div class="container">
            <!--Grid row-->
            <div class="row justify-content-center custom-gap">
                <!--Grid column-->
                <div class="col-md-5">
                    <img src="${product.imageURL}" class="img-fluid" alt="" />
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-5 mb-4">
                    <!--Content-->

                    <div class="border border-2 border-white">
                        <div class="p-4">
                            <div class="d-flex align-items-center">
                                <span style="background-color: #ee4d2d" class="badge me-2">${cate.category_name}</span>
                                <strong><span style="font-size: 20px">${product.productName}</span></strong>
                            </div>

                            <p>${product.description}</p>

                            <p class="custom-color p-3">
                                <!--<span class="me-1"><del>$200</del></span>-->
                                <span style="font: bold 26px 'MergeBlack', sans-serif; color: #ff5b6a">
                                    <fmt:formatNumber value="${product.price}"/>
                                    <span class="currency">đ</span>
                                </span>
                                
                            </p>

                            <form class="d-flex justify-content-left">
                                <!-- Default input -->
                                <div class="form-outline me-1" style="width: 80px">
                                    <input type="number" value="1" class="form-control" />
                                </div>
                                <button class="btn btn-primary ms-1" type="submit">
                                    Add to cart
                                    <i class="fas fa-shopping-cart ms-1"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <!--Content-->
                </div>
                <!--Grid column-->
            </div>
            <!--Grid row-->
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
