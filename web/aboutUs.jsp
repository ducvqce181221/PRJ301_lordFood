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
                    <img src="img/AboutUs-img/banners.jpg" alt="">
                </div>
            </div>
        </div> <section>
            <div class="section-2">
                <div class="header-section2">
                    <img src="img/logoLorFood.png" alt="" />
                    <h3>Lịch Sử </h3>
                    <h2>Quá Trình Hình Thành</h2>

                </div>

                <!-- Swiper Container -->
                <div class="swiper-container  time-slide">
                    <div class="swiper-wrapper">

                        <!-- slide 1 -->
                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2015</h4>
                                    <p>LorFood được thành lập với sứ mệnh mang đến bữa ăn nhanh chất lượng, tiện lợi nhưng vẫn đầy đủ dinh dưỡng.</p>
                                </div>
                            </div>
                        </div>

                        <!-- slide 2 -->

                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2015</h4>
                                    <p>Ban đầu, LorFood chỉ là một cửa hàng nhỏ, phục vụ các món ăn nhanh như hamburger, pizza, và gà rán.</p>
                                </div>
                            </div>
                        </div>

                        <!-- slide 3 -->

                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2020</h4>
                                    <p>Với sự phát triển mạnh mẽ, LorFood đã có mặt tại nhiều thành phố lớn, trở thành thương hiệu thức ăn nhanh được yêu thích.</p>
                                </div>
                            </div>
                        </div>

                        <!-- slide 4 -->

                        <div class="swiper-slide">
                            <div class="time-line-item">
                                <div class="time-line-img">
                                    <img src="img/logoLorFood.png" alt="" />
                                </div>
                                <div class="time-line-content">
                                    <h4>2020</h4>
                                    <p>LorFood nổi bật với phong cách phục vụ hiện đại, chuyên nghiệp, thu hút nhiều khách hàng.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>



        <section class="section-history">
            <div class="text-content">
                <h2>Lịch Sử Hình Thành Của Pizza</h2>
                <div class="underline"></div>
                <p>
                    Pizza có nguồn gốc từ Ý, và khởi đầu là một món ăn của người nghèo tại Napoli vào thế kỷ 18. Ban đầu, pizza chỉ đơn giản là một loại bánh mì dẹt được nướng trong lò và phủ lên trên bằng các nguyên liệu như dầu ô liu, thảo mộc, và phô mai. Sự kết hợp này dần trở nên phổ biến vì tính tiện lợi và giá thành rẻ.
                </p>
                <p>
                    Vào năm 1889, đầu bếp Raffaele Esposito đã tạo ra món pizza "Margherita" nổi tiếng, với sự kết hợp của cà chua, phô mai mozzarella và húng quế để đại diện cho ba màu của quốc kỳ Ý. Đây được coi là dấu mốc quan trọng trong sự phát triển của pizza hiện đại. Kể từ đó, pizza trở thành một món ăn yêu thích trên toàn thế giới, với hàng loạt biến thể khác nhau, từ kiểu cổ điển của Ý đến các phiên bản hiện đại tại Mỹ và nhiều quốc gia khác.
                </p>
            </div>
        </section>

        <section class="section1">s

            <div class="video-content" style="margin-left: 30px">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/VZU-EyQfUXQ?autoplay=1&mute=1"
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                </iframe>
            </div>

            <div class="text-content">
                <h2>Hương Vị Tuyệt Hảo Của Pizza</h2>
                <div class="underline"></div>
                <p>
                    Pizza tại LorFood được chế biến tỉ mỉ, từ bột tươi nhào nặn kỹ lưỡng, nướng giòn rụm bên ngoài nhưng mềm bên trong. Lớp phô mai béo ngậy hòa quyện cùng sốt cà chua tươi tạo nên hương vị đặc trưng.
                </p>
                <p>
                    Các nguyên liệu tươi ngon như xúc xích, nấm, ớt chuông và thịt xông khói được sắp xếp hài hòa, sau đó nướng chín vàng cùng phô mai tan chảy. Hãy thưởng thức để cảm nhận sự khác biệt!
                </p>

            </div>


        </section>

        <!-- Lịch Sử Hình Thành Section -->
        <section class="section-history">
            <div class="text-content">
                <h2>Lịch Sử Hình Thành Của Hamburger</h2>
                <div class="underline"></div>
                <p>
                    Hamburger có nguồn gốc từ thế kỷ 19 ở châu Âu, đặc biệt là từ thành phố Hamburg, Đức, nơi món thịt bò băm được chế biến và phục vụ trong các bữa ăn phổ biến. Khi người dân Đức di cư đến Mỹ, họ mang theo công thức thịt bò xay nổi tiếng này. Tại Mỹ, thịt bò xay được kết hợp với bánh mì mềm và các loại rau, tạo nên món ăn nhanh hoàn hảo mà chúng ta biết đến ngày nay với tên gọi “hamburger”.
                </p>
                <p>
                    Qua thời gian, hamburger đã trở thành biểu tượng của văn hóa ẩm thực nhanh trên toàn thế giới. Với sự kết hợp đơn giản nhưng đầy hương vị, hamburger đã chiếm được trái tim của thực khách từ Âu sang Á, và tiếp tục phát triển mạnh mẽ trong các chuỗi nhà hàng và cửa hàng ăn nhanh.
                </p>
            </div>
        </section>
        <section class="section1">
            <div class="text-content">
                <h2>Hương Vị Tuyệt Hảo Của Hamburger</h2>
                <div class="underline"></div>
                <p>
                    Hamburger tại LorFood được làm từ bánh mì nướng giòn và thịt bò tươi ướp gia vị, nướng vừa chín để giữ độ mọng nước. Rau xà lách, cà chua, dưa leo và phô mai tan chảy được kết hợp hoàn hảo trong chiếc bánh.
                </p>
                <p>
                    Khi thưởng thức, bạn sẽ cảm nhận vị ngọt của thịt bò hòa quyện với sự tươi mát của rau củ, vị béo của phô mai, và lớp bánh mì giòn rụm. Một hương vị đầy đặn và hấp dẫn.
                </p>



            </div>

            <div class="video-content" style="margin-left: 30px">
                <iframe width="560" height="315"
                        src="https://www.youtube.com/embed/T8_c6QEsNEE?autoplay=1&mute=1"
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