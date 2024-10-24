<%-- 
    Document   : cart
    Created on : Sep 29, 2024, 2:50:10 PM
    Author     : Truong Van Khang _ CE181852
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.Item"%>
<%@page import="model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="CSS/cart.css">
        <script src="js/cartJs.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </head>

    <body>

        <div class="cart-container">
            <div class="cart-content">
                <div class="cart-items">
                    <div class="cart-header">
                        <span>Sản phẩm trong giỏ hàng:</span> <span>${sessionScope.size}</span>
                    </div>
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng cộng</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                            <hr>
                            <tr>
                                <c:forEach var="item" items="${sessionScope.cart.items}">
                                    <c:set var="t" value="${t +1 }"></c:set>
                                <tr>
                                    <td>${t}</td>  
                                    <td>
                                        <img src="${item.product.imageURL}" alt="Product Image" class="product-img">
                                    </td>
                                    <td>${item.product.productName}</td>
                                    <td class="unit-price" name="unit-price">
                                        <fmt:formatNumber value="${item.product.price}" pattern="#,###" />
                                        VND
                                    </td>
                                    <td>
                                        <div class="quantity-controls">

                                            <form action="cartServlet" method="POST" >
                                                <input type="hidden" name="productID" value="${item.product.product_id}">
                                                <input type="hidden" name="quantity" value="1">
                                                <input type="hidden" name="action" value="decrease">
                                                <button class="quantity-btn" type="submit">-</button>
                                            </form>  
                                            <input type="number" class="quantity-input" value="${item.quantity}" readonly>
                                            <form action="cartServlet" method="POST" >
                                                <input type="hidden" name="productID" value="${item.product.product_id}">
                                                <input type="hidden" name="quantity" value="1">
                                                <input type="hidden" name="action" value="increase">
                                                <button class="quantity-btn" type="submit">+</button>
                                            </form>  
                                        </div>
                                    </td>
                                    <td class="total-price">
                                        <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,###" />
                                        VND
                                    </td>
                                    <td> 
                                        <form action="cartServlet" method="POST" >
                                            <input type="hidden" name="productID" value="${item.product.product_id}">
                                            <input type="hidden" name="quantity" value="0">
                                            <input type="hidden" name="action" value="delete">
                                            <button class="quantity-btn" type="submit">Delete</button>
                                        </form>  
                                    </td>
                                </tr>
                            </c:forEach>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="section3">
                    <div class="continue-shopping">
                        <a href="${pageContext.request.contextPath}/product">← Tiếp tục mua hàng</a>
                    </div>
                    <div class="delete-all">
                        <form action="cartServlet" method="POST" >
                            <input type="hidden" name="productID" value="0">
                            <input type="hidden" name="quantity" value="0">
                            <input type="hidden" name="action" value="deleteAll">
                            <button type="submit">Xóa tất cả sản phẩm</button>
                        </form>
                    </div>
                </div>

            </div>

            <div class="order-summary">
                <h3>THÔNG TIN CHUNG</h3>
                <div class="summary-details">
                    <p>Tổng sản phẩm: <span>${sessionScope.size}</span></p>
                    <p>Tổng tạm tính: <span class="total-amount"><fmt:formatNumber value="${sessionScope.totalMoney}" pattern="#,###" /> VND</span></p>
                </div>
                <div class="total">

                    <p>Tổng đơn hàng: <span class="total-amount"><fmt:formatNumber value="${sessionScope.totalMoney}" pattern="#,###" /> VND</span></p>
                </div>
                <form action="checkOutServlet" method="POST" class="pay">
                    <input type="hidden" name="pay" value="1">
                    <button type="submit">Thanh Toán</button>
                </form>

            </div>
        </div>
    </body>
    <%@include file="components/footer.jsp" %>

</html>
