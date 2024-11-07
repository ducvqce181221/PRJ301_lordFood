<%-- 
    Document   : aboutUs
    Created on : Sep 29, 2024, 12:02:22 PM
    Author     : Le Trong Luan _ CE181151
--%>
<%@include file="components/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/aboutUs.css"/>
    </head>

    <body>
        <div class="image-banner">
            <div class="image-banner">
                <div class="image-banner">
                    <img src="img/AboutUs-img/img.webp" alt="">
                </div>
            </div>
        </div> 
        <section>
            <div class="section-2">
                <div class="header-section2">
                    <img src="img/logoLorFood.png" alt="LorFood Logo" />
                    <h3>Lịch Sử </h3>
                    <h2>Quá Trình Hình Thành LorFood</h2>
                </div>

                <!-- Swiper Container -->
                <div class="swiper-container time-slide">
                    <div class="swiper-wrapper">

                        <!-- Slide 1: Establishment -->
                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="LorFood Establishment" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2015</h4>
                                    <p>LorFood được thành lập với sứ mệnh mang đến cho mọi người những bữa ăn chất lượng, lấy cảm hứng từ các món ăn truyền thống Việt Nam.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 2: Initial Mission and Vision -->
                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="LorFood Mission" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2016</h4>
                                    <p>Ban đầu, LorFood chú trọng vào việc giới thiệu các món ăn truyền thống như phở, bún bò Huế, và bánh xèo, giúp giữ gìn hương vị đặc trưng của ẩm thực Việt Nam.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 3: Expansion to Major Cities -->
                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="LorFood Expansion" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2020</h4>
                                    <p>Với sự phát triển mạnh mẽ, LorFood đã mở rộng đến nhiều thành phố lớn, mang đến hương vị truyền thống cho thực khách trên cả nước.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Slide 4: Commitment to Quality -->
                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="LorFood Quality Commitment" />
                                </div>
                                <div class="time-line-content">
                                    <h4>Hiện Tại</h4>
                                    <p>LorFood cam kết giữ gìn và phát triển các món ăn truyền thống Việt Nam, mang đến cho khách hàng trải nghiệm ẩm thực đậm đà bản sắc và chất lượng cao.</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="section-history">
            <div class="text-content">
                <h2>Lịch Sử Hình Thành Của Phở</h2>
                <div class="underline"></div>
                <p>
                    Phở, một biểu tượng của ẩm thực Việt Nam, bắt nguồn từ đầu thế kỷ 20 ở miền Bắc Việt Nam. 
                    Ban đầu, phở được làm từ sợi bánh phở mềm, thịt bò, và nước dùng trong, ninh từ xương bò 
                    và gia vị truyền thống như quế, hồi và gừng.
                </p>
                <p>
                    Theo thời gian, phở đã lan rộng vào miền Nam và được biến tấu với nhiều hương vị, điển hình là 
                    phở gà và phở với các loại rau thơm phong phú. Ngày nay, phở không chỉ là món ăn quen thuộc của người Việt, 
                    mà còn là món ăn được yêu thích trên khắp thế giới.
                </p>
            </div>
        </section>


        <section class="section1">s

            <div class="video-content" style="margin-left: 30px">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/ftsQYS1fkOs"
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
            </div>

            <div class="text-content">
                <h2>Hương Vị Đặc Trưng Của Phở</h2>
                <div class="underline"></div>
                <p>
                    Phở là món ăn nổi tiếng của Việt Nam, với nước dùng xương hầm đậm đà, mang đến vị ngọt tự nhiên. Bánh phở mềm mịn kết hợp hoàn hảo với thịt bò hoặc gà, tạo nên sự hòa quyện tuyệt vời.
                </p>
                <p>
                    Hương vị được nâng tầm bởi gia vị như quế, hồi, và hành, cùng với rau thơm tươi mát như húng quế và giá đỗ. Mỗi tô phở không chỉ là món ăn, mà còn là trải nghiệm văn hóa ẩm thực Việt Nam.
                </p>
            </div>


        </section>

        <!-- Lịch Sử Hình Thành Section -->
        <section class="section-history">
            <div class="text-content">
                <h2>Lịch Sử Hình Thành Của Bánh Mì</h2>
                <div class="underline"></div>
                <p>
                    Bánh mì có nguồn gốc từ bánh baguette của Pháp, du nhập vào Việt Nam vào thế kỷ 19 trong thời kỳ thuộc địa. Người Việt đã sáng tạo ra bánh mì bằng cách kết hợp bánh baguette giòn với các nguyên liệu phong phú như thịt, pate, rau sống và gia vị, tạo nên món ăn độc đáo.
                </p>
                <p>
                    Qua thời gian, bánh mì đã trở thành một phần không thể thiếu trong ẩm thực đường phố Việt Nam. Với sự sáng tạo đa dạng trong nhân bánh và cách chế biến, bánh mì không chỉ nổi tiếng trong nước mà còn lan tỏa ra thế giới, trở thành món ăn yêu thích của nhiều người.
                </p>
            </div>
        </section>

        <section class="section1">
            <div class="text-content">
                <h2>Hương Vị Tuyệt Hảo Của Bánh Mì</h2>
                <div class="underline"></div>
                <p>
                    Bánh mì tại LorFood được làm từ bánh baguette giòn tan, bên trong chứa đựng sự phong phú của các nguyên liệu như thịt nướng, pate, rau sống và nước sốt đặc biệt. Lớp bánh mì giòn rụm kết hợp với các thành phần tươi ngon tạo nên một trải nghiệm ẩm thực độc đáo.
                </p>
                <p>
                    Khi thưởng thức, bạn sẽ cảm nhận vị ngọt của thịt, vị béo ngậy của pate, cùng với sự tươi mát của rau củ. Tất cả hòa quyện lại với nhau trong mỗi miếng bánh, tạo nên một hương vị đậm đà và hấp dẫn, khiến bạn không thể cưỡng lại được.
                </p>
            </div>



            <div class="video-content" style="margin-left: 30px">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/v3yyiSGulok"  <!-- Đổi từ watch?v= thành embed/ -->
                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
            </div>

        </section>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper('.swiper-container', {
                slidesPerView: 1,
                spaceBetween: 1,
                loop: true,
                speed: 2000,
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                },
                watchSlidesVisibility: true,
                on: {
                    init: function () {
                        // Hiển thị slide đầu tiên khi khởi tạo
                        this.slides[this.activeIndex].style.opacity = 1;
                    },
                    slideChange: function () {
                        // Ẩn tất cả các slide trước đó
                        this.slides.forEach(slide => slide.style.opacity = 0);
                        // Hiển thị slide hiện tại
                        this.slides[this.activeIndex].style.opacity = 1;
                    }
                }
            });
        </script>

    </script>
    <%@include file="components/footer.jsp" %>
</body>

</html>