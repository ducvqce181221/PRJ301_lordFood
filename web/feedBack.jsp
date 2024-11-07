<%-- 
    Document   : feedBack
    Created on : Sep 29, 2024, 2:40:23 PM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liên Hệ</title>
        <link rel="stylesheet" href="CSS/feedBack.css">
    </head>

    <body>
        <section class="contact-form">
            <div class="container">
                <section class="business">
                    <div class="content-container">
                        <div class="text-content">
                            <h2>Liên Hệ</h2>
                            <div class="underline"></div>
                            <p>
                                LorFood luôn lắng nghe và trân trọng mọi ý kiến đóng góp từ khách hàng, giúp chúng tôi không ngừng cải tiến và hoàn thiện chất lượng sản phẩm và dịch vụ.
                            </p>
                            <p>
                                Những phản hồi của bạn là nguồn cảm hứng để chúng tôi tiếp tục sáng tạo và mang đến những bữa ăn nhanh ngon miệng, tiện lợi với chất lượng cao nhất. Hãy để LorFood luôn là lựa chọn đáng tin cậy cho những bữa ăn của bạn!
                            </p>
                        </div>
                        <div class="video-content" style="margin-left: 30px">
                            <iframe width="560" height="315"
                                    src="https://www.youtube.com/embed/V5w1OGknhlcz?autoplay=1&mute=1"
                                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                            </iframe>
                        </div>
                    </div>
                </section>

                <form method="POST" action="contactServlet" onsubmit="return validateForm()">
                    <div class="form-group">
                        <div class="input-container">
                            <input class="full-name input-style" type="text" name="fullName" placeholder="Họ và tên" required onchange="validateFullName()">
                            <span id="nameError" class="error-message"></span>
                        </div>
                        <div class="input-container">
                            <input class="email-address input-style" type="email" name="email" placeholder="Email" required>
                            <span id="emailError" class="error-message"></span>
                        </div>
                    </div>

                    <div class="form-group phone-group">
                        <input class="phone-number input-style" type="text" name="phoneNumber" placeholder="Số điện thoại" required onchange="validatePhoneNumber()">
                        <span id="phoneError" class="error-message"></span>
                    </div>

                    <textarea class="feedback-textarea textarea-style" name="feedbackMessage" placeholder="Vui lòng nhập phản hồi của bạn" rows="5" required></textarea>

                    <section class="privacy-agreement">
                        <h3>THỎA THUẬN BẢO MẬT THÔNG TIN</h3>
                        <p>...</p>
                        <label><input type="checkbox" name="privacy_agreement" required> Tôi xác nhận...</label>
                    </section>

                    <div class="submit-container">
                        <button class="submit-button button-style" type="submit" name="submitFeedback">Gửi phản hồi</button>
                    </div>
                </form>

            </div>
        </section>
        <%@include file="components/modal.jsp" %>
        <%@include file="components/footer.jsp" %>
    </body>

</html>
