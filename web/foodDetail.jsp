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
            <link href="CSS/contact.css" rel="stylesheet" type="text/css" />
        </head>
        <body>
            <div class="container mb-5 mt-4 px-0">
                <div class="d-flex align-items-center p-3 breadcrumb-container">
                    <a href="homePage.jsp" class="breadcrumb-link">HOME</a>
                    <i class="bi bi-chevron-right mx-2"></i>
                    <a href="product" class="breadcrumb-link">MENU</a>
                    <i class="bi bi-chevron-right mx-2"></i>
                    <a href="categoryServlet?cateid=${cate.categoryId}&action=getCate" class="breadcrumb-link"
                       >${cate.category_name}</a
                    >
                    <i class="bi bi-chevron-right mx-2"></i>
                    <span class="breadcrumb-item text-secondary">${product.productName}</span>
                </div>
            </div>
            <div class="container">
                <!--Grid row-->
                <div class="row justify-content-center custom-gap">
                    <!--Grid column-->
                    <div class="col-md-5">
                        <img src="${product.imageURL}" class="img-fluid image-custom" alt="" />
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

                                <p style="word-wrap: break-word; margin-top: 10px">${product.description}</p>

                                <p style="background-color: hsl(0, 0%, 92%)" class="custom-color p-3">
                                    <!--<span class="me-1"><del>$200</del></span>-->
                                    <span style="font: bold 26px 'MergeBlack', sans-serif; color: #ff5b6a">
                                        <fmt:formatNumber value="${product.price}" />
                                        <span class="currency">đ</span>
                                    </span>
                                </p>
                                <form
                                    id="cartForm"
                                    action="cartServlet"
                                    method="get"
                                    class="d-flex align-items-center flex-wrap"
                                    >
                                    <h6 class="m-0 me-4">Số lượng</h6>
                                    <button
                                        class="btn btn-outline-secondary quantity-btn"
                                        type="button"
                                        onclick="decreaseQuantity()"
                                        >
                                        <span class="btn-text">-</span>
                                    </button>
                                    <input
                                        type="number"
                                        class="quantity-input"
                                        name="quantity"
                                        value="1"
                                        id="quantityInput"
                                        readonly
                                        max="${product.quantityOfStock}"
                                        />
                                    <button
                                        class="btn btn-outline-secondary quantity-btn"
                                        type="button"
                                        onclick="increaseQuantity()"
                                        >
                                        <span class="btn-text">+</span>
                                    </button>
                                    <h6 class="m-0 ms-4">${product.quantityOfStock} Sản phẩm có sẵn</h6>
                                    <input type="hidden" name="action" value="increase" />
                                    <input type="hidden" name="productID" value="${product.product_id}" />
                                    <button type="submit" class="text-primary btn btn-primary border-setting add-cart">
                                        <i class="bi bi-cart-plus ms-0 pe-1"></i>
                                        Add To Cart
                                    </button>
                                    <button type="submit" class="btn btn-primary ms-3 border-setting">
                                        <i class="bi bi-bag-check-fill ms-0 pe-1 text-light"></i>
                                        Order Now
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
            <script>
                                            // JavaScript to increase and decrease quantity
                                            function decreaseQuantity() {
                                                var quantityInput = document.getElementById("quantityInput");
                                                var currentQuantity = parseInt(quantityInput.value);
                                                if (currentQuantity > 1) {
                                                    // Prevent quantity from going below 1
                                                    quantityInput.value = currentQuantity - 1;
                                                }
                                            }

                                            function increaseQuantity() {
                                                var quantityInput = document.getElementById("quantityInput");
                                                var currentQuantity = parseInt(quantityInput.value);
                                                var maxQuantity = parseInt(quantityInput.max); // Lấy giá trị tối đa
                                                if (currentQuantity < maxQuantity) { // Kiểm tra nếu số lượng hiện tại nhỏ hơn max
                                                    quantityInput.value = currentQuantity + 1; // Tăng số lượng
                                                }
                                            }
            </script>
        </body>
    </html>
