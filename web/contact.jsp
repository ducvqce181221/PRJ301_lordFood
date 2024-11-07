<%-- 
    Document   : contact
    Created on : Sep 29, 2024, 2:12:19 PM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="CSS/contact.css">
    </head>

    <body>

        <section class="contact">
            <div>
                <div class="breadcrumb">
                    <a href="homePage.jsp">Trang chủ</a> <i class="fa fa-caret-right"></i> <a href="feedBack.jsp">Nếu có phản hồi liên hệ chúng tôi</a>
                </div>

                <div class="contact-info2">
                    <h2>LIÊN HỆ VỚI CHÚNG TÔI</h2>
                    <div class="underline"></div>

                    <h3 class="highlight">LORFOOD</h3>
                    <p>
                        Địa chỉ: 123 Đường ABC, Quận 1, TP. Hồ Chí Minh
                    </p>
                    <p>Điện thoại: <span class="highlight">02-123-456-789</span></p>
                    <p>Nhượng quyền: <span class="highlight">0909-123-456</span> (Thứ 2 - Thứ 7 / 8:00 AM - 17:00 PM)</p>
                    <p>Phản ánh: <span class="highlight">0123-456-789</span></p>
                    <p>Website: <a href="#">lorfood.com</a></p>
                </div>
            </div>
            <div class="right-img">
                <img src="img/logoLorFood.png" alt="alt"/>
            </div>
        </section>
        <%@include file="components/footer.jsp" %>
    </body>

</html>
