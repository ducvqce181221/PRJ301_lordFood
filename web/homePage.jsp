<%-- 
    Document   : homePage
    Created on : Sep 28, 2024, 10:16:16 PM
    Author     : Le Trong Luan _ CE181151
--%>
<%@ include file="components/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title></title>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link
            rel="stylesheet"
            href="https://unpkg.com/swiper/swiper-bundle.min.css"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="CSS/homePage.css" />
    </head>

    <body>



        <!-- section 2 -->

        <div class="container mt-4 section1">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="section-item">
                        <img src="img/homePage/img1.jpg" alt="Lịch sử hình thành" />
                        <div class="overlay">
                            <a
                                style="
                                font-size: 20px;
                                font-weight: bold;
                                color: white;
                                text-decoration: none;
                                "
                                href="./aboutUs.php"
                                >LỊCH SỬ HÌNH THÀNH</a
                            >
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="section-item section-item2">
                        <img src="img/homePage/img2.png" alt="Thực đơn" />
                        <div class="overlay">
                            <a
                                style="
                                font-size: 20px;
                                font-weight: bold;
                                color: white;
                                text-decoration: none;
                                "
                                href="./menu.php"
                                >Thực Đơn</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- section 3 -->

        <div class="section2-item">
            <img src="img/homePage/img5.png" alt="Background Image" />
            <div class="section2-overlay">
                <div>
                    <h2>Trải Nghiệm Hương Vị Tuyệt Vời</h2>
                    <div class="section2-underline"></div>
                    <p>
                        Tại LorFood, chúng tôi cam kết mang đến những bữa ăn nhanh tiện lợi, đầy đủ dinh dưỡng và hương vị hấp dẫn.
                        Từ những chiếc hamburger thơm ngon với nhân thịt bò nướng, rau tươi, sốt đặc biệt và bánh mì giòn, cho đến pizza với phô mai tan chảy,
                        phủ lên xúc xích, nấm và ớt chuông tươi ngon.
                        Mỗi món ăn đều giữ trọn hương vị truyền thống và đảm bảo chất lượng cao nhất.
                    </p>
                </div>
            </div>
        </div>

        <!-- section 4 -->
        <div class="container mt-5 text-center">
            <img
                src="img/logoLorFood.png"
                alt="Logo"
                class="header-logo"
                />
            <h2>TIN KHUYẾN MÃI</h2>

            <!-- Swiper -->
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <!-- Card 1 -->
                    <div class="swiper-slide swiper-slide-visible">
                        <div class="card">
                            <img
                                src="img/homePage/img6.jpg"
                                class="card-img-top"
                                alt="Event Image 3"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">15-04-23</small>
                                </p>
                                <h5 class="card-title">
                                    Trung Thu Cho Em 2023 Cùng Hồng Trà Ngô Gia
                                </h5>
                                <p class="card-text">
                                    Trung thu là một trong những ngày lễ truyền thống quan trọng
                                    của Việt Nam, Trung thu còn là đêm trăng rước đèn của các em,
                                    đồ chơi và phá cỗ nhộn nhịp tùng dinh tùng phách.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="swiper-slide swiper-slide-visible">
                        <div class="card">
                            <img
                                src="img/homePage/img7.jpg"
                                class="card-img-top"
                                alt="Event Image 1"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">31-08-23</small>
                                </p>
                                <h5 class="card-title">
                                    Hồng Trà Ngô Gia | Thông báo Sự kiện Livestream Công bố Khách
                                    hàng Trúng thưởng Chương trình Vòng Quay May Mắn
                                </h5>
                                <p class="card-text">
                                    Hồng Trà Ngô Gia xin trân trọng thông báo rằng chúng tôi sẽ tổ
                                    chức một buổi livestream trên fanpage và tiktok “Hồng Trà Ngô
                                    Gia” vào lúc 11:00 sáng ngày 1 tháng 9.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="swiper-slide swiper-slide-visible">
                        <div class="card">
                            <img
                                src="img/homePage/img8.jpg"
                                class="card-img-top"
                                alt="Event Image 2"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">05-06-23</small>
                                </p>
                                <h5 class="card-title">
                                    CÔNG BỐ KẾT QUẢ KHÁCH HÀNG TRÚNG THƯỞNG | VÒNG QUAY MAY MẮN s
                                </h5>
                                <p class="card-text">
                                    Hồng Trà Ngô Gia công bố danh sách khách hàng trúng thưởng và
                                    tiến hành trao thưởng cho những khách hàng may mắn trong
                                    chương trình "Vòng Quay May Mắn" vừa qua.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/img9.png"
                                class="card-img-top"
                                alt="Event Image 4"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">31-08.23</small>
                                </p>
                                <h5 class="card-title">
                                    CHƯƠNG TRÌNH THIỆN NGUYỆN SẺ CHIA YÊU THƯƠNG - HỒNG TRÀ NGÔ
                                    GIA
                                </h5>
                                <p class="card-text">
                                    Ngày 03/08/2024, đại diện Hồng Trà Ngô Gia đã đến thăm hỏi và
                                    trao quà cho 16 cụ già neo đơn tại Mái Ấm Đức Ái (Đức Hòa,
                                    Long An). Hồng Trà Ngô Gia hy vọng những giá trị vật chất...
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/img9.jpg"
                                class="card-img-top"
                                alt="Event Image 5"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07.23</small>
                                </p>
                                <h5 class="card-title">
                                    THỬ HƯƠNG VỊ MỚI - RINH IPHONE 14 PROMAX VỀ NHÀ
                                </h5>
                                <p class="card-text">
                                    Cơn bão thay mới “dế yêu” đang được diễn ra từ ngày 15/7/2023
                                    đến hết 15/8/2023. Ngoài quà tặng là những chiếc Iphone 14
                                    Promax 256GB, Hồng Trà Ngô Gia còn...
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/img11.jpg"
                                class="card-img-top"
                                alt="Event Image 5"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07.23</small>
                                </p>
                                <h5 class="card-title">
                                    Hồng Trà Ngô Gia đạt danh hiệu giải thưởng hương vị xuất sắc
                                    iTQi
                                </h5>
                                <p class="card-text">
                                    Hồng Trà Ngô Gia đã đạt được danh hiệu giải thưởng hương vị
                                    xuất sắc iTQi do Viện Thẩm định Hương vị Quốc Tế
                                    (International Taste & Quality Institute) tại Brussels, Bỉ.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 7 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/img10.jpg"
                                class="card-img-top"
                                alt="Event Image 5"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07.23</small>
                                </p>
                                <h5 class="card-title">
                                    KHẮC HẠNH PHÚC - TRAO YÊU THƯƠNG: MÁI ẤM ĐỨC ÁI
                                </h5>
                                <p class="card-text">
                                    Ngày 03/08/2024, đại diện Hồng Trà Ngô Gia đã đến thăm hỏi và
                                    trao quà cho 16 cụ già neo đơn tại Mái Ấm Đức Ái (Đức Hòa,
                                    Long An). Hồng Trà Ngô Gia hy vọng những giá trị vật chất cũng
                                    như tinh thần mà mình mang lại dù nhỏ bé nhưng sẽ tiếp thêm
                                    sức mạnh cho những cụ già đang an dưỡng tại đây.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 8 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/img12.jpg"
                                class="card-img-top"
                                alt="Event Image 5"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">12-9.23</small>
                                </p>
                                <h5 class="card-title">
                                    CHƯƠNG TRÌNH "KHOE THẺ DẤU XỊN - NHẬN ÁO MƯA XINH"
                                </h5>
                                <p class="card-text">
                                    Bắt đầu từ 22/07 đến 25/08/2024, khi tích đủ 8 dấu trên thẻ
                                    tích điểm, thay vì chọn đổi 1 thức uống 16.000 như trước, các
                                    bạn có thể chọn đổi 1 Áo mưa Wujia cực xinh cực xịn
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 9 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/img13.jpg"
                                class="card-img-top"
                                alt="Event Image 5"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07.23</small>
                                </p>
                                <h5 class="card-title">
                                    HỒNG TRÀ NGÔ GIA ĐỒNG HÀNH CÙNG BTEC FFT TRONG CHƯƠNG TRÌNH
                                    NGÀN LY TRÀ - NGÀN LỜI CHÚC GỬI CHO 2K6
                                </h5>
                                <p class="card-text">
                                    Hồng Trà Ngô Gia sẽ đồng hành cùng BTEC FPT mang 10.000 ly trà
                                    sữa tới tay các bạn học sinh trong chương trình “Ngàn ly trà -
                                    Ngàn lời chúc gửi cho 2K6...
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Swiper JS -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

        <!-- Khởi tạo Swiper -->
        <script>
            var swiper = new Swiper(".swiper-container", {
                slidesPerView: 3,
                spaceBetween: 20,
                loop: true,
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                },
                speed: 2000,
                watchSlidesVisibility: true,
                slideVisibleClass: "swiper-slide-visible",
                on: {
                    init: function () {
                        for (let i = 0; i < 3; i++) {
                            this.slides[i].classList.add("swiper-slide-visible");
                        }
                    },
                    slideChange: function () {
                        let activeIndex = this.activeIndex;
                        for (let i = activeIndex; i < activeIndex + 3; i++) {
                            if (this.slides[i]) {
                                this.slides[i].classList.add("swiper-slide-visible");
                            }
                        }
                    },
                },
            });
        </script>
        <%@ include file="components/footer.jsp"%>>
    </body>
</html>

