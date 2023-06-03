$(document).ready(function() {
var productList = document.querySelectorAll('.list-product-in .col-lg-2');
var orderPriceLabel = document.getElementById('orderPrice');
var itemQuantityLabel = document.querySelector('.mx-2.mt-3.bg-white.text-dark.text-center');
var itemCount = 0;
var totalOrderPrice = 0;
var discountInput = document.getElementById('discount');
var cusPaidLabel = document.getElementById('cus_paid');
var hasDiscount = false;
var discountPercent = 0;
// Lấy thẻ input và các thẻ label cần sử dụng
var spendPriceInput = document.getElementById("spendPrice");
var refundsLabel = document.getElementById("refunds");



function updateDiscount() {
    discountPercent = parseInt(discountInput.value);
    if (isNaN(discountPercent) || discountPercent < 0) {
        discountPercent = 0;
        discountInput.value = "";
    }
    var discountedAmount = (discountPercent / 100) * totalOrderPrice;
    var cusPaid = totalOrderPrice - discountedAmount;

    cusPaidLabel.innerHTML = cusPaid;
}



discountInput.addEventListener('input', function() {
    if (discountInput.value !== '' && discountInput.value !== null) { // kiểm tra nếu trường nhập discount có giá trị
        hasDiscount = true;
        updateDiscount();
    } else {
        hasDiscount = false;
        discountPercent = 0;
        cusPaidLabel.innerHTML = totalOrderPrice;
    }
});


// Thêm sự kiện "change" vào thẻ input
spendPriceInput.addEventListener("input", function() {
    // Lấy giá trị của spendPriceInput và cusPaidLabel
    var spendPrice = parseFloat(spendPriceInput.value);
    var cusPaid = parseFloat(cusPaidLabel.innerHTML);

    // Kiểm tra xem spendPrice và cusPaid có hợp lệ không
    if (isNaN(spendPrice) || isNaN(cusPaid)) {
        // Nếu không hợp lệ thì đặt giá trị của refunds bằng 0
        var refunds = 0;
    } else if(spendPrice < cusPaid){
        var errorLabel = document.getElementById('errorLabel');
        errorLabel.innerHTML = 'Không thể nhập giá nhỏ hơn giá khách phải trả';
        errorLabel.style.color = 'red';
    }
    else {

        var errorLabel = document.getElementById('errorLabel');
        errorLabel.innerHTML = '';
        // Tính toán refunds
        var refunds = spendPrice - cusPaid;

    }

    // Hiển thị giá trị của refunds trong thẻ label
    refundsLabel.innerHTML = Math.abs(refunds);


});





productList.forEach(function(product) {
    product.addEventListener('click', function() {
        var productId = product.querySelector('.pro_id').innerHTML;
        var productName = product.querySelector('.pro_name').innerHTML;
        var productPrice = parseFloat(product.querySelector('.pro_price').innerHTML.replace(/\D/g, '') + "00") / 1000;
        var productQuantity = parseInt(product.querySelector('.pro_quantity').innerHTML);

        itemCount++;
        var existingItem = document.querySelector('#sales_table td[data-id="' + productId + '"]');
        if(productQuantity === 0){
            Swal.fire({
                icon: 'info',
                title: 'Hết hàng',
                text: 'Vui lòng chọn sản phẩm khác',
                footer: 'Hàng đang được nhập'
            })
        }

        else if (!existingItem) {
            var newRow = document.createElement('tr');
            newRow.classList.add('detail_product');
            newRow.innerHTML = `
        <td><i class="fas fa-trash delete-row"></i></td>
        <td><count></count></td>
        <td class="d-none proId">${productId}</td>
        <td class="proName">${productName}</td>
        <td class="item-quantity">1</td>
        <td>${productPrice}</td>
        <td class="item-price">${productPrice}</td>
        <td class="item-total">${productPrice}</td>
      `;
            newRow.querySelector('td:nth-child(2)').setAttribute('data-id', productId);

            var salesTable = document.getElementById('sales_table');
            salesTable.querySelector('tbody').appendChild(newRow);

            totalOrderPrice += productPrice;
            orderPriceLabel.innerHTML = totalOrderPrice;
            itemQuantityLabel.innerHTML = itemCount;

            if (hasDiscount) {
                updateDiscount();
            } else {
                cusPaidLabel.innerHTML = totalOrderPrice;
            }

        } else {
            var quantityCell = existingItem.parentElement.querySelector('.item-quantity');
            var priceCell = existingItem.parentElement.querySelector('.item-price');
            var totalCell = existingItem.parentElement.querySelector('.item-total');
            var quantity = parseInt(quantityCell.innerHTML);
            quantityCell.innerHTML = quantity + 1;
            totalCell.innerHTML = (quantity + 1) * parseFloat(priceCell.innerHTML);

            totalOrderPrice += productPrice;
            orderPriceLabel.innerHTML = totalOrderPrice;

            // Cập nhật số lượng sản phẩm
            itemQuantityLabel.innerHTML = itemCount;

            if (hasDiscount) {
                updateDiscount();
            } else {
                cusPaidLabel.innerHTML = totalOrderPrice;
            }

        }
    });
});

var salesTable = document.getElementById('sales_table');
salesTable.addEventListener('click', function(event) {
    if (event.target.classList.contains('delete-row')) {
        var row = event.target.parentElement.parentElement;
        var price = parseFloat(row.querySelector('.item-price').innerHTML);
        var quantity = parseInt(row.querySelector('.item-quantity').innerHTML);

        itemCount -= quantity;
        totalOrderPrice -= price * quantity;

        orderPriceLabel.innerHTML = totalOrderPrice;
        itemQuantityLabel.innerHTML = itemCount;

        row.remove();

        // Tính lại giá trị giảm giá và giá trị khách hàng phải trả
        updateDiscount();

        // Kiểm tra nếu bảng trống thì reset giá trị của itemCount
        var rows = document.querySelectorAll('#sales_table tbody tr');
        if (rows.length === 0) {
            itemCount = 0;
            itemQuantityLabel.innerHTML = itemCount;
            cusPaidLabel.innerHTML = totalOrderPrice;
            discountInput.value = "";
        }

    }
});

// var cancelBtn = document.getElementById('cancelBtn');
// cancelBtn.addEventListener('click', function() {
//     var rows = document.querySelectorAll('#sales_table tbody tr');
//     rows.forEach(function(row) {
//         row.remove();
//     });
//
//     itemCount = 0;
//     totalOrderPrice = 0;
//     orderPriceLabel.innerHTML = totalOrderPrice;
//     itemQuantityLabel.innerHTML = itemCount;
//     cusPaidLabel.innerHTML = totalOrderPrice;
//     discountInput.value = "";
//
//
// });

})






