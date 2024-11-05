<%-- 
    Document   : managePayment
    Created on : Nov 3, 2024, 1:12:27 PM
    Author     : Truong Van Khang _ CE181852
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Category" %>
<%@page import="java.util.List" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Dashboard - Management Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/styles.css" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
            .custom-width{
                width: 130px
            }
            .custom-width-btn{
                width: 100px
            }
            .custom-height-btn{
                height: 50px
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
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="./signInAdmin.jsp">Logout</a></li>
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

                            <a class="nav-link" href="homeAdmin.jsp"><div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>User Management</a>
                            <a class="nav-link" href="managementContact.jsp"><div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>Contact Management</a>
                            <a class="nav-link" href="productManagement"><div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>Product Management</a>
                            <a class="nav-link" href="categoryServlet?&action=showInfo">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Category Management
                            </a>
                            <a class="nav-link" href="managementOrder.jsp"><div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>Order Management</a>
                            <a class="nav-link" href="managementOrderDetail.jsp"><div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>Order Detail</a>
                            <a class="nav-link" href="managementAdmin.jsp"><div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>Admin account</a>
                            <a class="nav-link" href="ShippingMethodServlet?&action=showInfo">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Shipping Method
                            </a>
                            <a class="nav-link" href="PaymentMethodServlet?&action=showInfo">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Payment Method
                            </a>
                            <a class="nav-link" href="PaymentServlet?&action=show">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                                Payment Management
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer"><div class="small">Logged in as:</div>Management Admin</div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Payment Management</h1>
                        <ol>
                            <li class="breadcrumb-item active">View Payment</li>
                        </ol>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table me-1"></i>Payment List</div>
                        <form method="GET" action="./PaymentServlet" class="d-flex">
                            <input name="action" type="hidden" value="find" >
                            <input style="height: 70px" type="text" name="search" class="form-control" placeholder="Find Payment..." aria-label="Search">
                            <button class="btn btn-primary ms-2 taskFind" type="submit">Tìm kiếm</button>
                        </form>
                        <div style="font-size: 16.5px;" class="card-body">
                            <table class="table table-striped">
                                <thead >
                                    <tr>
                                        <th>Payment ID</th>                     
                                        <th>Customer Name</th>
                                        <th>Address</th>
                                        <th>Amount</th>                                
                                        <th>Ship Method</th>
                                        <th>Payment Method</th>
                                        <th>Payment Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${dataPayment != null}">
                                            <c:forEach var="item" items="${dataPayment}">
                                                <tr>
                                                    <td>${item.paymentID}</td>
                                                    <td>${item.nameUser}</td>
                                                    <td>${item.shipAddress}</td>
                                                    <td>${item.amount}</td>
                                                    <td>${item.shipMedthod}</td>  
                                                    <td>${item.paymentMethod}</td>
                                                    <td>${item.dateTime}</td>
                                                    <td>

                                                        <button type="button" class="custom-height-btn custom-width-btn btn btn-danger btn-sm" 
                                                                onclick="confirmDelete(${item.paymentID})">Delete</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal Cập Nhật -->

<!-- Modal Xác Nhận -->
<div id="confirmModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Submit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModal()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this record?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
            </div>
        </div>
    </div>
</div>

<script>
    let recordId;
    function confirmDelete(id) {
        recordId = id;
        console.log("Record ID set to:", recordId); // Hiển thị ID bản ghi khi click
        $('#confirmModal').modal('show');
    }

    document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
        if (recordId) {
            window.location.href = 'PaymentServlet?id=' + recordId + '&action=delete';
        } else {
            console.error('No record ID defined for deletion.');
        }
    });

    function closeModal() {
        $('#confirmModal').modal('hide');
    }

    document.querySelectorAll('.close').forEach(function (element) {
        element.addEventListener('click', closeModal);
    });

</script>
</body>
</html>
