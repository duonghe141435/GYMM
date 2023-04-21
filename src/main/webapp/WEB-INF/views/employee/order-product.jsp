<%--suppress ALL --%>
<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/30/2023
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Product</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .fa-trash {
            color: red;
        }
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            /* loại bỏ mũi tên lên xuống trên Chrome, Safari */
            -webkit-appearance: none;
            margin: 0;
        }

        input[type="number"] {
            /* loại bỏ mũi tên lên xuống trên Firefox */
            -moz-appearance: textfield;
            /* tùy chỉnh giao diện input */
            appearance: none;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/views/layouts/employee/header.jsp" %>
<div class="col-lg-12">
    <div class="row d-flex justify-content-center align-items-center h-100" style="--bs-gutter-x: 0">

        <div class="row">
            <div class="col-lg-8">
                <div class="table-responsive table mt-2" style="height: 50vh; overflow: auto;">
                    <table class="table my-0" id="sales_table">
                        <thead>
                        <tr style="background-color: aquamarine">
                            <th></th>
                            <th>Mã</th>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Giá bán</th>
                            <th>Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="list-product" style="background-color: #eee">
                    <div class="row">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="form-search-box form-group row">
                                <form class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                                    <div class="input-group"><input class="bg-light form-control border-0 small" id="search_product" type="text"
                                                                    placeholder="Tìm kiếm sản phẩm" name="pr_name">
                                        <button class="btn btn-primary py-0" id="btn-search-product" type="button"><i class="fas fa-search"></i></button>
                                    </div>
                                </form>
                            </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination py-2" id="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="d-flex flex-wrap list-product-in" style="height: 320px;" id="product-list">
                            <div class="row">
                                <c:if test="${not empty productDtos}">
                                    <c:forEach items="${productDtos}" var="productDtos">
                                        <div class="col-lg-2 col-md-12 mb-4 mx-3">
                                            <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                                                <img src="<c:url value="${productDtos.p_img}"/> "
                                                     class="w-100" />
                                                <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                                                    <div class="d-flex justify-content-start align-items-start h-30">
                                                        <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark pro_price">${productDtos.p_price}</span></h5>
                                                    </div>
                                                    <p class="text-light text-center fw-bold pro_name">${productDtos.p_name}</p>
                                                    <p class="d-none pro_id">${productDtos.p_id}</p>
                                                    <p class="d-none pro_quantity">${productDtos.p_quantity}</p>
                                                </div>
                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">

                <div class="card bg-primary text-white rounded-3">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <span id="empName">${display_name}</span>
                                <span class="d-none" id="empId">${display_id}</span>
                                <img src="<c:url value="${display_img}"/>"
                                     class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                            </div>
                            <input type="datetime-local" id="date-order" class="fa fa-calendar">
                        </div>

                        <form class="mt-4">
                            <div class="row form-outline form-white mb-4">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="form-label col-sm-5 mt-3" for="pt_name">Chọn khách hàng</label>
                                        <div class="col-sm-7">
                                            <select class="form-select"  id="pt_name" style="width: 82%;float:left;">
                                                <option disabled selected hidden>Chọn</option>
                                                <option id="1">Trainer</option>
                                                <option id="2">Customer</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-5 mt-3" for="checkas">Tên khách hàng</label>
                                            <div class="col-sm-7">
                                                <select class="form-select"  id="checkas" style="width: 82%;float:left;">

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                            <div class="row form-outline form-white mb-4">
                                <div class="col-6">
                                    <label class="form-label mt-3" for="orderPrice">Tổng tiền hàng:</label>
                                    <label class="mx-2 mt-3 bg-white text-dark text-center" id="totalOrder" style="display: inline-block;
                                                            border-radius: 2px;">0</label>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 float-end" id="orderPrice">0</label>
                                </div>

                            </div>

                            <div class="row form-outline form-white mb-4">
                                <div class="col-4">
                                    <label class="form-label mt-2" for="discount">Giảm giá:</label>
                                </div>
                                <div class="col-8">
                                    <div class="row">
                                        <input type="number" id="discount" class="form-control"
                                               style="width: 195px;"/>
                                        <label class="text-white text-center mx-1 py-2" style="background-color: #1fa750; height: 37px;
                                                                width: 60px;">%</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-outline form-white mb-4">
                                <div class="col-6">
                                    <label class="form-label mt-3" for="cus_paid">Khách cần trả:</label>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 float-end text-white" id="cus_paid">0</label>
                                </div>
                            </div>
                            <div class="row form-outline form-white mb-4">
                                <div class="col-4">
                                    <label class="form-label mt-2" for="spendPrice">Khách trả:</label>
                                </div>
                                <div class="col-8">
                                    <div class="row">
                                        <input type="number" id="spendPrice" class="form-control"
                                               style="width: 195px;"/>
                                        <label class="text-white mx-1 py-2" style="background-color: #1fa750; height: 37px;
                                                                width: 60px;">VNĐ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-outline form-white mb-4">
                                <div class="col-6">
                                    <label class="form-label mt-3" id="refunds-title" for="refunds">Trả lại</label>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 float-end" id="refunds">0</label>
                                </div>
                            </div>

                        </form>

                        <hr class="my-4">

                        <button type="button" class="btn btn-active btn-block btn-lg" id="btn-add-order" style="background-color: #85ffdb">
                            <div class="d-flex justify-content-between">
                                <span>Tạo hóa đơn <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                            </div>
                        </button>

                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
<script>

    $(document).ready(function () {
        var btn_search = $("#btn-search-product");
        var input_search = $("#search-product");
        // Thực hiện hành động tìm kiếm tại Danh sách người dùng hệ thống
        input_search.on("input", function (){
            var input = $(this).val();
            if(input.length >=3 ){
                $.ajax({
                    url: 'http://localhost:8080/order-product/search',
                    method: 'GET',
                    data: {query: input},
                    dataType : 'json',
                    success: function(response) {
                        $('#product-list').empty(); // remove all child elements, but keep the element
                        console.log(response);
                        var newContent = $('<div class="d-flex flex-wrap list-product-in" style="height: 320px;" id="product-list"></div>'); // create a new element to replace the old one
                        $('#product-list').after(newContent); // insert the new element after the old one
                        newContent.css({ // apply CSS styles to the new element
                            'display': 'flex',
                            'height': '320px',
                            'flex-wrap': 'wrap'
                        });
                        var productList = '';
                        $.each(response, function(index, productDtos) {
                            productList += '<div class="col-lg-2 col-md-12 mb-4 mx-3">';
                            productList += '<div class="bg-image hover-zoom ripple shadow-1-strong rounded">';
                            productList += '<img src="' + productDtos.p_img + '" class="w-100" />';
                            productList += '<div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">';
                            productList += '<div class="d-flex justify-content-start align-items-start h-30">';
                            productList += '<h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark pro_price">' + productDtos.p_price + '</span></h5>';
                            productList += '</div>';
                            productList += '<p class="text-light text-center fw-bold pro_name">' + productDtos.p_name + '</p>';
                            productList += '<p class="d-none pro_id">' + productDtos.p_id + '</p>';
                            productList += '<p class="d-none pro_quantity">' + productDtos.p_quantity + '</p>';
                            productList += '</div>';
                            productList += '<div class="hover-overlay">';
                            productList += '<div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>';
                            productList += '</div>';
                            productList += '</div>';
                            productList += '</div>';
                        });
                        var newRow = $('<div class="row"></div>');
                        newRow.append(productList);
                        newContent.append(newRow);
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                    }
                });
            }
        });
        btn_search.click(function (e) {
            var input = input_search.val();
            // Thực hiện hành động khi thẻ input thay đổi
            if(input === ''){
                Swal.fire({
                    title: 'Oops...',
                    text: 'Bạn cần nhập thông tin vào ô tìm kiếm',
                    icon: 'error'
                })
            }else if(input.length >= 3){
                $.ajax({
                    url: 'http://localhost:8080/order-product/search',
                    method: 'GET',
                    data: {query: input},
                    success: function(response) {
                        window.location.href = "http://localhost:8080/order-product/search/"+input;
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                    }
                });
            }else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Hãy nhập tối thiểu 5 ký tự vào ô input',
                    icon: 'error'
                })
            }
        });
    });

    document.getElementById("date-order").readOnly = true;

    var now = new Date();
    var year = now.getFullYear();
    var month = ('0' + (now.getMonth() + 1)).slice(-2);
    var day = ('0' + now.getDate()).slice(-2);
    var hour = ('0' + now.getHours()).slice(-2);
    var minute = ('0' + now.getMinutes()).slice(-2);
    var datetime = year + '-' + month + '-' + day + 'T' + hour + ':' + minute;
    document.getElementById('date-order').value = datetime;



    $(document).ready(function ({}) {
        var name = document.getElementById("pt_name");
        var checks = document.getElementById("checkas");
        name.addEventListener("change", function() {
            checks.innerHTML = "";
            var selectedOption = this.options[this.selectedIndex];
            if (selectedOption.id === "1") {

                var trainers = ${jsonTrainer};

                for (var k = 0; k < trainers.length; k++){
                    var optionTrainer = document.createElement("option");
                    optionTrainer.innerText = trainers[k].u_full_name;
                    optionTrainer.value = trainers[k].u_enable;
                    checks.appendChild(optionTrainer);
                }
            }
            if (selectedOption.id === "2") {

                var customer = ${jsonCustomer};

                for (var k = 0; k < customer.length; k++){
                    var optionCustomer = document.createElement("option");
                        optionCustomer.innerText = customer[k].u_full_name;
                        optionCustomer.value = customer[k].u_id;
                        checks.appendChild(optionCustomer);
                }
            }
        });
    })

    $(document).ready(function() {
        $('#btn-add-order').click(function() {
            // Thêm mã JavaScript để tạo hóa đơn ở đây
            var empId = document.getElementById("empId").innerText;
            var checks = document.getElementById("checkas");
            var selectedCusId = $('#checkas').val();
            var totalOrder = document.getElementById("totalOrder").innerText;
            var orderPrice = document.getElementById("orderPrice").innerHTML;
            var cus_paid = document.getElementById("cus_paid").innerText;
            var discountInput = document.getElementById('discount');
            discountPercent = parseInt(discountInput.value);
            var spendPriceInput = document.getElementById("spendPrice");
            spendPrice = parseInt(spendPriceInput.value);
            var refunds = document.getElementById("refunds").innerText;
        });
    });

</script>

<script src="<c:url value='/assets/js/order-product.js'/>"></script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>
</html>

