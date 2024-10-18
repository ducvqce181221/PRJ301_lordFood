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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="CSS/cart.css">
        <script src="js/cartJs.js"></script>
    </head>

    <body>

        <div class="cart-container">
            <div class="cart-content">
                <div class="cart-items">
                    <div class="cart-header">
                        <span>Sản phẩm trong giỏ hàng:</span> <span>3</span>
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
                            <!-- Example row -->
                            <tr>
                                <c:forEach var="item" items="${cart.items}">
                                    <td>${item.id}</td>  
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
                                            <button class="quantity-btn" onclick="updateCart('decrease', ${item.product.productId}, ${item.quantity})">-</button>
                                            <input type="number" class="quantity-input" value="${item.quantity}" readonly> 
                                            <button class="quantity-btn" onclick="updateCart('increase', ${item.product.productId}, ${item.quantity})">+</button>
                                        </div>
                                    </td>
                                    <td class="total-price">  
                                        <fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,###" />
                                        VND
                                    </td>
                                    <td> 
                                        <button class="remove-btn" onclick="removeItem(this)">Delete</button>
                                    </td>
                                </c:forEach>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="section3">
                    <div class="continue-shopping">
                        <a href="menu.jsp">← Tiếp tục mua hàng</a>
                    </div>
                    <div class="delete-all">
                        <form method="POST" action="">
                            <input type="hidden" name="delete_all" value="1">
                            <button type="submit">Xóa tất cả sản phẩm</button>
                        </form>
                    </div>
                </div>

            </div>

            <div class="order-summary">
                <h3>THÔNG TIN CHUNG</h3>
                <div class="summary-details">
                    <p>Tổng sản phẩm: <span><?php echo count($cartItems); ?></span></p>
                    <!--                    - <1%= echo number_format($totalAmount, 3, ',', '.'); %>--->
                    <p>Tổng tạm tính: <span class="total-amount"> 0 VND</span></p>
                </div>
                <div class="total">
                    <p>Tổng đơn hàng: <span class="total-amount">0 VND</span></p>
                </div>
                <form action="checkout.php" method="POST" class="pay">
                    <input type="hidden" name="pay" value="1">
                    <button type="submit">Thanh Toán</button>
                </form>

            </div>
        </div>
    </body>
    <%@include file="components/footer.jsp" %>

</html>
