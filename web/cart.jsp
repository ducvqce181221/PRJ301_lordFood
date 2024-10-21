<%-- 
    Document   : cart
    Created on : Sep 29, 2024, 2:50:10 PM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
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
                                <td>1</td>  
                                <td><img src="path_to_image.jpg" alt="Product Image" class="product-img"></td>
                                <td>Sản phẩm A</td>
                                <td class="unit-price" name="unit-price"> <%= 200000%> </td> <!-- Lấy dữ liệu từ giá product -->
                                <td>
                                    <div class="quantity-controls">
                                        <button class="quantity-btn" onclick="decreaseQuantity(this)">-</button>
                                        <input type="number" value="1" min="1" class="quantity-input"> <!-- Đã thêm class cho input số lượng -->                                      
                                        <button class="quantity-btn" onclick="increaseQuantity(this)">+</button>
                                    </div>
                                </td>
                                <td class="total-price">200,000 VND</td> <!-- Đã thêm class cho tổng tiền -->
                                <td> <button class="remove-btn" onclick="removeItem(this)">Xóa</button></td>>
                            </tr>
                            <tr>
                                <td>1</td>  
                                <td><img src="path_to_image.jpg" alt="Product Image" class="product-img"></td>
                                <td>Sản phẩm A</td>
                                <td class="unit-price" name="unit-price"> <%= 100000%> </td> <!-- Lấy dữ liệu từ giá product -->
                                <td>
                                    <div class="quantity-controls">
                                        <button class="quantity-btn" onclick="decreaseQuantity(this)">-</button>
                                        <input type="number" value="1" min="1" class="quantity-input"> <!-- Đã thêm class cho input số lượng -->                                      
                                        <button class="quantity-btn" onclick="increaseQuantity(this)">+</button>
                                    </div>
                                </td>
                                <td class="total-price">200,000 VND</td> <!-- Đã thêm class cho tổng tiền -->
                                <td> <button class="remove-btn" onclick="removeItem(this)">Xóa</button></td>>
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
