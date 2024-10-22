<%-- 
    Document   : checkOut.jsp
    Created on : Oct 22, 2024, 4:44:19 PM
    Author     : Truong Van Khang _ CE181852
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.Item"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            h2{
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

            /* Form section headings */
            .form-section h3 {
                margin-bottom: 10px;
                font-size: 18px;
                color: #333;
            }

            /* Form labels and inputs */
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"],
            textarea,
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            /* Textarea styling */
            textarea {
                height: 100px;
                resize: none;
            }

            /* Table styling */
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

            table th {
                background-color: #f0f0f0;
                font-weight: bold;
            }

            table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            /* Total price styling */
            .total {
                font-size: 18px;
                font-weight: bold;
                text-align: right;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            /* Submit button */
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

        </style>
    </head>
    <body>
        <div class="container">
            <h2 >Thanh Toán</h2>

            <!-- Customer Information -->
            <div class="form-section">
                <label for="address">Địa chỉ giao hàng</label>
                <textarea id="address" name="address" placeholder="Nhập địa chỉ" required></textarea>
            </div>

            <!-- Shipping Method -->
            <div class="form-section">
                <h3>Phương thức giao hàng</h3>
                <select name="shippingMethod" required>
                    <option value="express">Giao hàng nhanh</option>
                    <option value="standard">Giao hàng tiêu chuẩn</option>
                    <option value="free">Giao hàng miễn phí</option>
                </select>
            </div>

            <!-- Product Details -->
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
                    <option value="cod">Thanh toán khi nhận hàng (COD)</option>
                    <option value="credit">Thanh toán qua thẻ tín dụng</option>
                    <option value="e-wallet">Thanh toán qua ví điện tử</option>
                </select>
            </div>

            <!-- Total Amount -->
            <div class="total">
                <strong> <p>Tổng đơn hàng: <span class="total-amount"><fmt:formatNumber value="${sessionScope.totalMoney}" pattern="#,###" /> VND</span></p></strong>
            </div>
            <!-- Submit Button -->
            <form action="cartServlet" method="post">
                <input type="hidden" name="action" value="deleteAll" >
                <input type="hidden" name="productID" value="0">
                <input type="hidden" name="quantity" value="0">
                <button type="submit" class="btn-submit">Xác nhận đơn hàng</button>
            </form>
        </div>

    </body>
</html>
