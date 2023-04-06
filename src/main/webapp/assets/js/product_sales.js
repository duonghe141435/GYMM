var productList = document.querySelectorAll('.list-product-in .col-lg-2');
var orderPriceLabel = document.getElementById('orderPrice');
var itemQuantityLabel = document.querySelector('.mx-2.mt-3.bg-white.text-dark.text-center');

var itemCount = 0;
var totalOrderPrice = 0;

productList.forEach(function(product) {
    product.addEventListener('click', function() {
        var productId = product.querySelector('.pro_id').innerHTML;
        var productName = product.querySelector('.pro_name').innerHTML;
        var productPrice = parseFloat(product.querySelector('.pro_price').innerHTML.replace(/\D/g, '') + "00") / 1000;


        itemCount++;
        var existingItem = document.querySelector('#sales_table td[data-id="' + productId + '"]');

        if (!existingItem) {
            var newRow = document.createElement('tr');
            newRow.innerHTML = `
        <td><i class="fas fa-trash delete-row"></i></td>
        <td>${productId}</td>
        <td>${productName}</td>
        <td class="item-quantity">1</td>
        <td>${productPrice}</td>
        <td>0</td>
        <td class="item-price">${productPrice}</td>
        <td class="item-total">${productPrice}</td>
      `;
            newRow.querySelector('td:nth-child(2)').setAttribute('data-id', productId);

            var salesTable = document.getElementById('sales_table');
            salesTable.querySelector('tbody').appendChild(newRow);

            totalOrderPrice += productPrice;
            orderPriceLabel.innerHTML = totalOrderPrice;
            itemQuantityLabel.innerHTML = itemCount;
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

        // Kiểm tra nếu bảng trống thì reset giá trị của itemCount
        var rows = document.querySelectorAll('#sales_table tbody tr');
        if (rows.length === 0) {
            itemCount = 0;
            itemQuantityLabel.innerHTML = itemCount;
        }
    }
});

var cancelBtn = document.getElementById('cancelBtn');
cancelBtn.addEventListener('click', function() {
    var rows = document.querySelectorAll('#sales_table tbody tr');
    rows.forEach(function(row) {
        row.remove();
    });

    itemCount = 0;
    totalOrderPrice = 0;
    orderPriceLabel.innerHTML = totalOrderPrice;
    itemQuantityLabel.innerHTML = itemCount;
});
