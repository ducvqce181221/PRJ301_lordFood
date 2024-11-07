<%-- 
    Document   : succesPayment
    Created on : Nov 3, 2024, 11:07:35 AM
    Author     : Truong Van Khang _ CE181852
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Thanh Toán Thành Công</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 50px;
            }
            .message-box {
                border: 2px solid #4CAF50;
                padding: 20px;
                display: inline-block;
                border-radius: 8px;
                background-color: #f0fff0;
            }
            .message-box h1 {
                color: #4CAF50;
            }
            .message-box p {
                font-size: 18px;
                color: #555;
            }
            .btn-home {
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
        if (session.getAttribute("username") == null) {
            response.sendRedirect("signIn.jsp");
            return; 
        }
        %>
        <div class="message-box">
            <h1>Thanh Toán Thành Công!</h1>
            <p>Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đã được thanh toán thành công.</p>
            <form action="cartServlet" method="POST" >
                <input type="hidden" name="productID" value="0">
                <input type="hidden" name="quantity" value="0">
                <input type="hidden" name="action" value="deleteAll">
                <button type="submit" class="btn-home">Quay về giỏ hàng</button>
            </form>
        </div>
    </body>
</html>
