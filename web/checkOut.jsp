<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Item" %>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Checkout Page</title>
        <style>
            /* General Styling */
            h2 {
                text-align: center;
            }
            .container {
                width: 50%;
                margin: 0 auto;
                padding: 20px;
                background-color: #f7f7f7;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"], textarea, select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table th, table td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            .total {
                font-size: 18px;
                font-weight: bold;
                text-align: right;
                margin-top: 20px;
            }
            .btn-submit {
                width: 100%;
                padding: 12px;
                background-color: #28a745;
                color: white;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .btn-submit:hover {
                background-color: #218838;
            }
            nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
            }
            .btn-back {
                padding: 8px 16px;
                font-size: 16px;
                color: white;
                background-color: #357a38;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .time {
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("signIn.jsp");
        return; // Ensure no further processing occurs after the redirect
    }
        %>
        <div class="container">
            <form action="checkOutServlet" method="get">
                <nav>
                    <button type="button" class="btn-back" onclick="location.href = 'homePage.jsp';">Back</button>
                    <div class="time" id="time">${timeCurrent}</div>
                    <input type="hidden" name="time" value="${timeCurrent}" />
                </nav>
                <h2>Thanh Toán</h2>
                <!-- Shipping Address -->
                <div class="form-section" style="margin-right: 20px; margin-top: 30px">
                    <label for="address">Địa chỉ giao hàng</label>
                    <textarea id="address" name="address" placeholder="Nhập địa chỉ" required style="resize: none;"></textarea>
                </div>
                <div class="form-section">
                    <h3>Phương thức giao hàng</h3>
                    <select name="shippingMethod" required>
                        <option value="1">Giao hàng nhanh</option>
                        <option value="2">Giao hàng tiêu chuẩn</option>
                        <option value="3">Giao hàng miễn phí</option>
                    </select>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <h3>Chi tiết sản phẩm</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Tổng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${sessionScope.cart.items}">
                                <tr>
                                    <td>${item.product.productName}</td>
                                    <td>${item.quantity}</td>
                                    <td><fmt:formatNumber value="${item.product.price}" pattern="#,###" /> VND</td>
                                    <td><fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,###" /> VND</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Payment Method -->
                <div class="form-section">
                    <h3>Phương thức thanh toán</h3>
                    <select name="paymentMethod" required>
                        <option value="1">Thanh toán khi nhận hàng (COD)</option>
                        <option value="2">Thanh toán qua thẻ tín dụng</option>
                        <option value="3">Thanh toán qua ví điện tử</option>
                    </select>
                </div>
                <!-- Total Amount -->
                <div class="total">
                    <strong>
                        <p>
                            Tổng đơn hàng: 
                            <span id="totalAmount" class="total-amount">
                                <fmt:formatNumber value="${sessionScope.totalMoney}" pattern="#,###" /> VND
                            </span>
                        </p>
                    </strong>
                </div>

                <!-- Total Amount (Hidden Field) -->
                <input type="hidden" name="amount" value="${sessionScope.totalMoney}" />

                <!-- Submit Button -->
                <button type="submit" class="btn-submit">Xác nhận đơn hàng</button>
            </form>
        </div>
    </body>
</html>
