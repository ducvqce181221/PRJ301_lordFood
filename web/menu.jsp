    <%-- 
    Document   : menu
    Created on : Sep 30, 2024, 11:31:22 PM
    Author     : Le Trong Luan _ CE181151
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<body>
    <h1>Danh sách sản phẩm</h1>
    <table border="1">
        <tr>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Hình ảnh</th>
            <th>Thao tác</th>
        </tr>
        <tr>
            <td>Sản phẩm A</td>
            <td>100.0 VND</td>
            <td><img src="http://example.com/imageA.jpg" width="50"/></td>
            <td>
                <form action="cartServlet" method="Get">
                      <input type="hidden" name="action" value="increase"/>
                    <input type="hidden" name="productID" value="8"/>
                    <input type="hidden" name="quantity" value="2"/>
                    <button type="submit">Thêm vào giỏ</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>Sản phẩm B</td>
            <td>150.0 VND</td>
            <td><img src="http://example.com/imageB.jpg" width="50"/></td>
            <td>
                <form action="cartServlet" method="Get">     
                    <input type="hidden" name="action" value="increase"/>
                    <input type="hidden" name="productID" value="9"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <button type="submit" >Thêm vào giỏ</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>Sản phẩm C</td>
            <td>200.0 VND</td>
            <td><img src="http://example.com/imageC.jpg" width="50"/></td>
            <td>
                <form action="cartServlet" method="Get">
                      <input type="hidden" name="action" value="increase"/>
                    <input type="hidden" name="productID" value="14"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <button type="submit" name="action" value="add">Thêm vào giỏ</button>
                </form>
            </td>
        </tr>
    </table>
    <a href="cart.jsp">Xem giỏ hàng</a>
</body>
</html>
