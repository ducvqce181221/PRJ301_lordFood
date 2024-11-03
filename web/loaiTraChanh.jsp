<%-- 
    Document   : loaiTraChanh
    Created on : Oct 1, 2024, 12:00:10 AM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loại Trà Chanh</title>
    <link rel="stylesheet" href="../css/loaiTraSua.css">
</head>

<body>

    <div class="menu-drink">
        <ul class="menu-container">
            <li class="menu-item"><a href="../src/loaiTraiCay.php">LOẠI TRÀ TRÁI CÂY</a></li>
            <li class="menu-item"><a href="../src/loaiTraLatte.php">LOẠI TRÀ LATTE</a></li>
            <li class="menu-item"><a href="../src/loaiTraChanh.php">LOẠI TRÀ CHANH</a></li>
            <li class="menu-item"><a href="../src/thucUongHot.php">THỨC UỐNG "HOT"</a></li>
            <li class="menu-item"><a href="../src/loaiTraSua.php">LOẠI TRÀ SỮA</a></li>
            <li class="menu-item"><a href="../src/loaiThuanTra.php">LOẠI THUẦN TRÀ</a></li>
        </ul>
    </div>

    <div class="header-menu">
        <h1 style="text-align: center; color: #aaa;">
            <?php echo $categoryName; ?>
        </h1>
    </div>

    <div class="menu-grid">
        <?php
        if (!empty($products)) {
            echo '<div class="row">';
            foreach ($products as $product) {


                echo '<div class="menu-card">';
                echo '<img src="' . $product['imageURL'] . '" alt="Image not found">';

                echo '<div class="menu-details">';
                echo '<h3>' . $product['productName'] . '</h3>';
                echo '<span class="price">' . number_format($product['price'], 3, ',', '.') . ' VND</span>';
                echo '<p>' . $product['description'] . '</p>';
                echo '<form class="form" method="post" action="cart.php">';
                echo '<div class="footer-card" onclick="this.closest(\'form\').submit()">';
                echo '<input type="hidden" name="product_id" value="' . $product['product_id'] . '">';
                echo '<button type="submit" class="add-to-cart"><i class="fas fa-shopping-cart"></i> Mua ngay</button>';
                echo '</div>';
                echo '</form>';
                echo '</div>';
                echo '</div>';
            }
            echo '</div>'; // Đóng hàng cuối cùng
        } else {
            echo isset($message) ? $message : "Không tìm thấy sản phẩm nào.";
        }
        ?>
    </div>

    <?php include("../components/footer.php"); ?>
</body>

</html>