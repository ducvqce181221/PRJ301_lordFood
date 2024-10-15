<%-- Document : foodDetail Created on : Oct 15, 2024, 7:42:48 PM Author : Vu Quang Duc - CE181221 --%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container mt-5">
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-md-6 mb-4">
                    <img src="${product.imageURL}" class="img-fluid" alt="" />
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 mb-4">
                    <!--Content-->
                    <div class="d-flex align-items-center p-3 breadcrumb-container">
                        <a href="menu" class="me-2 breadcrumb-link">Menu</a>
                        <i class="bi bi-arrow-right mx-2"></i>
                        <span class="ms-2 breadcrumb-item">Food Detail</span>
                    </div>

                    <div class="p-4">
                        <p class="lead">
                            <!--<span class="me-1"><del>$200</del></span>-->
                            <span>${product.price}VND</span>
                        </p>

                        <div class="d-flex align-items-center">
                            <strong><span style="font-size: 20px">${product.productName}</span></strong>
                            <span class="badge bg-danger ms-2">${cate.category_name}</span>
                        </div>

                        <p>${product.description}</p>

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
