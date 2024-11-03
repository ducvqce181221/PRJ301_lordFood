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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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
                        <img src="img/homePage/IMG1.pgn.jpeg" alt="Lịch sử hình thành" />
                        <div class="overlay">
                            <a
                                style="
                                font-size: 20px;
                                font-weight: bold;
                                color: white;
                                text-decoration: none;
                                "
                                href="aboutUs.jsp"
                                >LỊCH SỬ HÌNH THÀNH</a
                            >
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="section-item section-item2">
                        <img src="img/homePage/img3.jpeg" alt="Thực đơn" />
                        <div class="overlay">
                            <a
                                style="
                                font-size: 20px;
                                font-weight: bold;
                                color: white;
                                text-decoration: none;
                                "
                                href="product"
                                >Thực Đơn</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- section 3 -->

        <div class="section2-item">
            <img src="img/homePage/img2.webp" alt="Background Image" />
            <div class="section2-overlay">
                <div>
                    <h2>Trải Nghiệm Ẩm Thực Truyền Thống Việt Nam</h2>
                    <div class="section2-underline"></div>
                    <p>
                        Tại LorFood, chúng tôi tự hào mang đến những món ăn đậm đà bản sắc Việt Nam. 
                        Từ phở bò thơm nồng nước dùng hầm xương, bún bò Huế cay nồng đến bánh xèo giòn rụm, 
                        mỗi món ăn đều được chế biến tỉ mỉ từ nguyên liệu tươi ngon nhất. Hãy trải nghiệm hương vị tinh túy 
                        của các món ăn truyền thống, hòa quyện cùng những giá trị văn hóa lâu đời.
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
            <h2>Món Ăn Truyền Thống Việt Nam</h2>

            <!-- Swiper -->
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <!-- Card 1 -->
                    <div class="swiper-slide swiper-slide-visible">
                        <div class="card">
                            <img
                                src="img/homePage/bun-bo-1.webp"
                                class="card-img-top"
                                alt="Image of Bún Bò Huế"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">15-04-23</small>
                                </p>
                                <h5 class="card-title">
                                    Lịch Sử Bún Bò Huế
                                </h5>
                                <p class="card-text">
                                    Bún bò Huế, xuất phát từ cố đô Huế, nổi tiếng với hương vị đậm đà và cay nồng. 
                                    Món ăn này gắn liền với văn hóa ẩm thực Việt Nam và được yêu thích rộng rãi trong và ngoài nước.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="swiper-slide swiper-slide-visible">
                        <div class="card">
                            <img
                                src="img/homePage/goi-cuon.jpg"
                                class="card-img-top"
                                alt="Gỏi Cuốn"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">Lịch sử Gỏi Cuốn</small>
                                </p>
                                <h5 class="card-title">
                                    Gỏi Cuốn: Món Ăn Truyền Thống Việt Nam
                                </h5>
                                <p class="card-text">
                                    Gỏi cuốn, hay "nem cuốn," là món ăn nổi tiếng từ miền Nam Việt Nam, được làm từ bánh tráng và nhồi tôm, thịt, rau sống. Xuất hiện từ thế kỷ 19, món ăn này không chỉ ngon mà còn mang đậm văn hóa ẩm thực Việt Nam.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="swiper-slide swiper-slide-visible">
                        <div class="card">
                            <img
                                src="img/homePage/mi-quang-thit-ech.jpg"
                                class="card-img-top"
                                alt="Mì Quảng"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">05-06-23</small>
                                </p>
                                <h5 class="card-title">
                                    Mì Quảng: Hương Vị Đặc Trưng Miền Trung
                                </h5>
                                <p class="card-text">
                                    Mì Quảng là món ăn đặc sản của miền Trung Việt Nam, thường được làm từ mì gạo, tôm, thịt, và rau sống. Nước dùng của mì Quảng có vị đậm đà, thường được chế biến từ xương và gia vị. Món ăn này không chỉ ngon mà còn mang đậm bản sắc văn hóa ẩm thực của vùng đất Quảng Nam.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/banh-xeo.jpg"
                                class="card-img-top"
                                alt="Bánh Xèo"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">31-08-23</small>
                                </p>
                                <h5 class="card-title">
                                    Bánh Xèo: Hương Vị Đặc Trưng Miền Nam
                                </h5>
                                <p class="card-text">
                                    Bánh xèo là món ăn truyền thống của miền Nam Việt Nam, được làm từ bột gạo, nước cốt dừa và gia vị. Bánh có hình dạng giống như cái chảo, bên trong được nhồi thịt, tôm và giá đỗ. Sau khi chiên giòn, bánh thường được cuốn với rau sống và chấm với nước mắm pha, mang đến hương vị thơm ngon và hấp dẫn.
                                </p>
                            </div>
                        </div>

                    </div>

                    <!-- Card 5 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/bunCha.png"
                                class="card-img-top"
                                alt="Bún Chả"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07-23</small>
                                </p>
                                <h5 class="card-title">
                                    Bún Chả: Món Ăn Đặc Sản Hà Nội
                                </h5>
                                <p class="card-text">
                                    Bún chả là một trong những món ăn đặc sản nổi tiếng của Hà Nội, bao gồm bún (mì gạo) ăn kèm với thịt nướng (thường là thịt heo) và nước chấm. Thịt được tẩm ướp gia vị, nướng trên than hồng, tạo ra hương vị thơm ngon. Món ăn thường được phục vụ với rau sống và nước mắm chua ngọt, mang lại trải nghiệm ẩm thực phong phú và hấp dẫn.
                                </p>
                            </div>
                        </div>

                    </div>

                    <!-- Card 6 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/bunRieut.jpg"
                                class="card-img-top"
                                alt="Bún Riêu"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07-23</small>
                                </p>
                                <h5 class="card-title">
                                    Bún Riêu: Món Ngon Đặc Trưng Miền Bắc
                                </h5>
                                <p class="card-text">
                                    Bún riêu là món ăn nổi tiếng ở miền Bắc Việt Nam, được làm từ bún gạo và nước dùng có vị chua đặc trưng từ cà chua và riêu cua. Món ăn thường được nấu với các nguyên liệu như tôm, thịt, và rau sống, tạo nên hương vị phong phú và hấp dẫn. Bún riêu thường được thưởng thức cùng với rau thơm và nước chấm, mang đến trải nghiệm ẩm thực thú vị.
                                </p>
                            </div>
                        </div>

                    </div>

                    <!-- Card 7 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/banhMi2.jfif"
                                class="card-img-top"
                                alt="Bánh Mì"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07-23</small>
                                </p>
                                <h5 class="card-title">
                                    Bánh Mì: Biểu Tượng Ẩm Thực Việt Nam
                                </h5>
                                <p class="card-text">
                                    Bánh mì là món ăn vặt nổi tiếng của Việt Nam, được làm từ bánh baguette giòn và nhồi với nhiều nguyên liệu như thịt, pate, dưa leo, rau sống và nước sốt. Với hương vị đa dạng và phong phú, bánh mì không chỉ mang lại cảm giác ngon miệng mà còn thể hiện sự sáng tạo trong ẩm thực Việt Nam. 
                                </p>
                            </div>
                        </div>

                    </div>

                    <!-- Card 8 -->
                    <div class="swiper-slide">

                        <div class="card">
                            <img
                                src="img/homePage/224132-bun-nuoc-leo-soc-trang-ngon.jpg"
                                class="card-img-top"
                                alt="Bún Nước Lèo"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">12-9.23</small>
                                </p>
                                <h5 class="card-title">
                                    Bún Nước Lèo: Đặc Sản Sóc Trăng
                                </h5>
                                <p class="card-text">
                                    Bún nước lèo là món ăn nổi tiếng của Sóc Trăng, được làm từ bún tươi và nước dùng ngọt từ xương và cá lóc. Món ăn thường đi kèm với rau sống, mang đến hương vị thơm ngon và hấp dẫn, phản ánh bản sắc ẩm thực miền Tây Nam Bộ.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 9 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <img
                                src="img/homePage/bun-bo-1.webp"
                                class="card-img-top"
                                alt="Bò Kho"
                                />
                            <div class="card-body-sec3">
                                <p class="card-text">
                                    <small class="text-muted">17-07.23</small>
                                </p>
                                <h5 class="card-title">
                                    Bò Kho: Món Ăn Ngon Đậm Đà
                                </h5>
                                <p class="card-text">
                                    Bò kho là món ăn truyền thống của Việt Nam, được chế biến từ thịt bò hầm với gia vị như hành, tỏi, và cà rốt. Món ăn có hương vị đậm đà, thường được ăn kèm với bánh mì hoặc bún, mang đến trải nghiệm ẩm thực thơm ngon và ấm áp.
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
        <%@ include file="components/footer.jsp"%>
    </body>
</html>

