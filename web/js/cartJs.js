//// Hàm để cập nhật số lượng sản phẩm
//function decreaseQuantity(button) {
//    let quantityInput = button.nextElementSibling;
//    let currentQuantity = parseInt(quantityInput.value);
//    if (currentQuantity > 1) {
//        quantityInput.value = currentQuantity - 1;
//        updateTotal(button);
//    }
//}
//
//// Tăng số lượng sản phẩm
//function increaseQuantity(button) {
//    let quantityInput = button.previousElementSibling;
//    let currentQuantity = parseInt(quantityInput.value);
//    quantityInput.value = currentQuantity + 1;
//    updateTotal(button);
//}

// Cập nhật tổng tiền cho sản phẩm
function updateTotal(button) {
    let row = button.closest('tr'); // Lấy hàng chứa sản phẩm
    let priceElement = row.querySelector('.unit-price'); // Lấy giá của sản phẩm
    let quantityInput = row.querySelector('.quantity-input'); // Lấy số lượng
    let totalElement = row.querySelector('.total-price'); // Lấy phần tử hiển thị tổng tiền

    let price = parseFloat(priceElement.textContent.replace(/[^0-9.-]+/g, "")); // Chuyển đổi giá thành số
    let quantity = parseInt(quantityInput.value); // Lấy số lượng

    let total = price * quantity;
    totalElement.textContent = total.toLocaleString('vi-VN') + " VND"; // Hiển thị tổng tiền mới
    updateOrderSummary();
}

// Cập nhật tổng tiền cho toàn bộ giỏ hàng
function updateOrderSummary() {
    let totalAmount = 0;

    // Lặp qua tất cả các dòng sản phẩm
    let totalPriceElements = document.querySelectorAll('.total-price');
    totalPriceElements.forEach(function (totalElement) {
        let total = parseFloat(totalElement.textContent.replace(/[^0-9.-]+/g, ""));
        totalAmount += total;
    });
    // Hiển thị tổng tiền mới
    let totalAmountElements = document.querySelectorAll('.total-amount');
    totalAmountElements.forEach(function (element) {
        element.textContent = totalAmount.toLocaleString('vi-VN') + " VND";
    });
}
