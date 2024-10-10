<%-- 
    Document   : loaiTraChanh
    Created on : Oct 1, 2024, 12:00:10 AM
    Author     : Le Trong Luan _ CE181151
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<?php
session_start();
include("../components/header.php");

$link = mysqli_connect('localhost', 'root', '', 'hongtrangogia');
if ($link->connect_error) {
    die("Connection failed: " . $link->connect_error);
}

$category_id = isset($_GET['category_id']) ? intval($_GET['category_id']) : 9;
$products = [];
$categoryName = "Danh mục không xác định";

// Lấy tên danh mục dựa vào category_id
$category_sql = "SELECT category_name FROM category WHERE categoryId = ?";
$stmt = $link->prepare($category_sql);
$stmt->bind_param("i", $category_id);
$stmt->execute();
$category_result = $stmt->get_result();

if ($category_result->num_rows > 0) {
    $category_row = $category_result->fetch_assoc();
    $categoryName = $category_row['category_name'];
} else {
    $categoryName = "Danh mục không tồn tại. (Không có hàng nào với ID: $category_id)";
}

// Lấy danh sách sản phẩm dựa vào category_id
$sql = "SELECT * FROM product WHERE categoryId = ?";
$stmt = $link->prepare($sql);
$stmt->bind_param("i", $category_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
} else {
    $message = "Không có sản phẩm nào trong danh mục này.";
}

$link->close();
?>

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