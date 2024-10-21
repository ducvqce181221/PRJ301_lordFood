<%-- 
    Document   : managementOrder
    Created on : Oct 7, 2024, 12:01:14 PM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - Management Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/styles.css" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
        <style>
            body {
                background-color: #f8f9fa;
            }

            .card {
                margin-top: 50px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                background-color: #007bff;
                color: white;
                font-weight: bold;
                text-align: center;
            }

            .form-label {
                font-weight: bold;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .form-text a {
                color: #007bff;
            }

            .form-text a:hover {
                color: #0056b3;
                text-decoration: underline;
            }

            thead th {
                text-align: center;
                vertical-align: middle;
            }

            tbody td {
                text-align: center;
                vertical-align: middle;
                word-wrap: break-word; /* Đảm bảo các từ dài sẽ xuống dòng */
                white-space: normal;   /* Cho phép văn bản xuống dòng */
            }
        </style>
    </head>

    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3" href="index.html">Management Admin</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="./signInAdmin.php">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Management</div>
                            <a class="nav-link" href="homeAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                User Management
                            </a>
                            <a class="nav-link" href="managementContact.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Contact Management
                            </a>
                            <a class="nav-link" href="productManagement">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Product Management
                            </a>
                            <a class="nav-link" href="managementCategory.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Category Management
                            </a>
                            <a class="nav-link" href="managementOrder.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Order Management
                            </a>
                            <a class="nav-link" href="managementOrderDetail.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Order Detail
                            </a>
                            <a class="nav-link" href="managementAdmin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Admin account
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Management Admin
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Product Management</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">View Products</li>
                        </ol>

                        <a style="text-decoration: none;" class="mb-4" href="#" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Product</a>

                        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="updateProductModalLabel">Add Product</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form action="addProduct" method="post" enctype="multipart/form-data">
                                        <div class="modal-body">                                         
                                            <div class="mb-3 row">
                                                <label for="productName" class="col-sm-2 col-form-label">Product name</label>
                                                <div class="col-sm-9">
                                                    <input type="text" name="productName" class="form-control" id="productName" required placeholder="Enter name">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="productDescription" class="col-sm-2 col-form-label">Description</label>
                                                <div class="col-sm-9">
                                                    <input type="text" name="productDescription" class="form-control" id="productDescription" required placeholder="Enter description">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="productPrice" class="col-sm-2 col-form-label">Price</label>
                                                <div class="col-sm-9">
                                                    <input type="number" name="productPrice" class="form-control" id="productPrice" min="1000" required placeholder="Enter price">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="productQuantity" class="col-sm-2 col-form-label">Quantity</label>
                                                <div class="col-sm-9">
                                                    <input type="number" name="productQuantity" class="form-control" id="productQuantity" min="1" required placeholder="Enter quantity">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="productImage" class="col-sm-2 col-form-label">URL Image</label>
                                                <div class="col-sm-9">
                                                    <input type="file" name="productURL" class="form-control" id="productImage" required placeholder="Enter URL image">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="cateID" class="col-sm-2 col-form-label">Caterogy ID</label>
                                                <div class="col-sm-3">
                                                    <select name="cateID" class="form-select" aria-label="Default select example" required>
                                                        <c:forEach items="${listC}" var="c">
                                                            <option value="${c.categoryId}">${c.category_name}</option>
                                                        </c:forEach>                    
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Add</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Product List
                            </div>
                            <form method="post" action="searchProduct" class="d-flex">
                                <input type="text" name="search" class="form-control" placeholder="Tìm kiếm đơn hàng..." aria-label="Search">
                                <button class="btn btn-primary ms-2" type="submit">Tìm kiếm</button>
                            </form>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Product ID</th>
                                            <th>Product Name</th>
                                            <th>Description</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Image</th>
                                            <th>Create at</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${listP}">
                                            <tr>
                                                <td>${product.product_id}</td>
                                                <td>${product.productName}</td>
                                                <td style="max-width: 250px; text-align: left">${product.description}</td>
                                                <td><fmt:formatNumber value="${product.price}" pattern="#,###"/> VND</td>
                                                <td>${product.quantityOfStock}</td>
                                                <td><img style="height: 60px; width: 65px" src=".${product.imageURL}" alt="Product Image"/></td>
                                                <td>${product.created_at}</td>
                                                <td>
                                                    <!-- Thêm `data-*` để lưu thông tin sản phẩm vào nút -->
                                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#updateProductModal_${product.product_id}">
                                                        Update
                                                    </button>

                                                    <!-- Modal, với ID động cho mỗi sản phẩm -->
                                                    <div class="modal fade" id="updateProductModal_${product.product_id}" tabindex="-1" aria-labelledby="updateProductModalLabel_${product.product_id}" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="updateProductModalLabel_${product.product_id}">Update Product ${product.product_id}</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <form action="updateProduct?img=${product.imageURL}"         
                                                                      method="post" enctype="multipart/form-data">
                                                                    <div class="modal-body">                                      
                                                                        <div class="mb-3 row">
                                                                            <label for="productID" class="col-sm-2 col-form-label">Product ID</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" name="productID" class="form-control" id="productID" value="${product.product_id}" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3 row">
                                                                            <label for="productName" class="col-sm-2 col-form-label">Product name</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" name="productName" class="form-control" id="productName" value="${product.productName}" placeholder="Enter name">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3 row">
                                                                            <label for="productDescription" class="col-sm-2 col-form-label">Description</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="text" name="productDescription" class="form-control" id="productDescription" value="${product.description}" placeholder="Enter description">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3 row">
                                                                            <label for="productPrice" class="col-sm-2 col-form-label">Price</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" name="productPrice" class="form-control" id="productPrice" min="1000" value="${product.price}" placeholder="Enter price">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3 row">
                                                                            <label for="productQuantity" class="col-sm-2 col-form-label">Quantity</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="number" name="productQuantity" class="form-control" id="productQuantity" min="1" value="${product.quantityOfStock}" placeholder="Enter quantity">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3 row">
                                                                            <label for="productImage" class="col-sm-2 col-form-label">URL Image</label>
                                                                            <div class="col-sm-9">
                                                                                <input type="file" name="productURL" class="form-control" id="productImage" placeholder="Enter URL image">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mb-3 row">
                                                                            <label for="cateID" class="col-sm-2 col-form-label">Caterogy ID</label>
                                                                            <div class="col-sm-3">
                                                                                <select class="form-select" aria-label="Default select example" required>
                                                                                    <c:forEach items="${listC}" var="c">
                                                                                        <option value="${c.categoryId}"
                                                                                                <c:if test="${c.categoryId == product.categoryID}">
                                                                                                    selected
                                                                                                </c:if>
                                                                                                >${c.category_name}
                                                                                        </option>
                                                                                    </c:forEach>                    
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="deleteProduct?id=${product.product_id}" class="btn btn-danger" role="button" onclick="return confirmDelete('${product.productName}');">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>         
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>


        <!-- MODAL NOTIFICATION 'PRODUCT NOT FOUND' OR 'DUPLICATE PRODUCT NAME' --> 
        <div class="modal fade" id="noProductModal" tabindex="-1" aria-labelledby="noProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <c:if test="${noProduct}">
                            <h5 class="modal-title" id="noProductModalLabel">No Products Found!</h5>
                        </c:if>

                        <c:if test="${productExist}">
                            <h5 class="modal-title" id="noProductModalLabel">Product Name Already Exists!</h5>
                        </c:if>

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <c:if test="${noProduct}">
                            <span>
                                No products match your search criteria. Please try again with different product name
                            </span>
                            <i class="bi bi-emoji-frown"></i>
                        </c:if>

                        <c:if test="${productExist}">
                            <span>
                                The product name you entered already exists in the database. Please try another name
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


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script>
                                                        const modalElements = document.querySelectorAll('.modal');
                                                        modalElements.forEach(function (modal) {
                                                            modal.addEventListener('hidden.bs.modal', function () {
                                                                const form = modal.querySelector('form');
                                                                if (form) {
                                                                    form.reset(); // Đặt lại form
                                                                }
                                                            });
                                                        });

                                                        function confirmDelete(productName) {
                                                            return confirm("Are you sure you want to delete " + productName + "?");
                                                        }

            <c:if test="${noProduct || productExist}">
                                                        var myModal = new bootstrap.Modal(document.getElementById('noProductModal'));
                                                        myModal.show();
            </c:if>
        </script>
    </body>

</html>