<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 5/27/2023
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Thông tin chi tiết sản phẩm</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <style>
    .modal-update {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }
    .container {
        display: flex;
    }

    .left {
        flex-basis: 40%;
    }

    .right {
        flex-basis: 60%;
    }
    .select-icon {
        display: flex;
        align-items: center;
    }

    .select-icon a{
        text-decoration: none;
    }

    .select-icon a i {
        margin-left: 10px;
        font-size: 1.5em;
        border-radius: 50%;
        border: 1px solid #ccc;
        width: 1.5em;
        height: 1.5em;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    </style>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:80%">Danh sách sản phẩm</p>
                        <a href="<c:url value='/admin/product'/> " class="btn btn-primary" style="font-weight: 700;">Quay trở lại danh sách</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 card">
                                <img src="${product.p_img}" style="width: 75%">
                                <table class="table" id="user">
                                    <tr>
                                        <td>Tên sản phẩm</td>
                                        <td>${product.p_name}</td>
                                    </tr>
                                    <tr>
                                        <td>Giá nhập</td>
                                        <td class="class-price" id="p_price_sale">${product.p_price}</td>
                                    </tr>
                                    <tr>
                                        <td>Giá bán</td>
                                        <td class="class-price" id="p_price_oprice">${product.p_Oprice}</td>
                                    </tr>
                                    <tr>
                                        <td>Ngày thêm</td>
                                        <td>${product.p_create}</td>
                                    </tr>
                                    <tr>
                                        <td>Số lượng</td>
                                        <td id="p_quantity">${product.p_quantity}</td>
                                    </tr>
                                    <tr>
                                        <td>Mô tả</td>
                                        <td>${product.p_description}</td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái</td>
                                        <c:if test="${product.p_status == true}">
                                            <td class="status">
                                                <span class="active">Đang bán</span></td>
                                        </c:if>
                                        <c:if test="${product.p_status == false}">
                                            <td class="status">
                                                <span class="danger">Ngừng bán</span></td>
                                        </c:if>

                                    </tr>
                                    <tr>
                                        <td>Phân loại</td>
                                        <td>${product.p_kind_name}</td>

                                    </tr>
                                    <tr>
                                        <td><a class="btn btn-danger delete-user">Xóa sản phẩm</a></td>
                                        <td><a class="btn btn-info update-product">Chỉnh sửa sản phẩm</a></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-8">
                                <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                                    <table class="table my-0" id="list-order">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Giá nhập</th>
                                            <th>Giá bán</th>
                                            <th class="text-center">Ngày bắt đầu</th>
                                            <th class="text-center">Ngày kết thúc</th>
                                            <th class="text-center">Trạng thái</th>
                                        </tr>
                                        </thead>
                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                        <c:if test="${not empty prices}">
                                            <c:forEach items="${prices}" var="prices">
                                                <tr>
                                                    <td class="text-center"><count></count></td>
                                                    <td class="class-price">${prices.pri_sale}</td>
                                                    <td class="class-price">${prices.pri_oprice}</td>
                                                    <td>${prices.pri_start_date}</td>
                                                    <td>${prices.pri_end_date}</td>
                                                    <c:if test="${prices.pri_status == true}">
                                                        <td class="status">
                                                            <span class="active">Đang mở</span></td>
                                                    </c:if>
                                                    <c:if test="${prices.pri_status == false}">
                                                        <td class="status">
                                                            <span class="active">Đã đóng</span></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
<div class="modal-update" id="myModalBook">
    <div class="modal-dialog" style="max-width: 98%;">
        <div class="modal-content" style="margin: 5% auto;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa ${product.p_name}</h5>
                <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="py-2" >
                <%--<p id="title_ticket_form" class="text-dark h2 text-center">Chỉnh sửa ${product.p_name}</p>--%>
                <div class="container-fluid">
                    <div class="card shadow">
                        <div class="card-body"><c:url value="/admin/product/update-product?${_csrf.parameterName}=${_csrf.token}" var="saveProductUrl"/>
                            <form:form method="POST" modelAttribute="product" action="${saveProductUrl}" enctype="multipart/form-data" >
                                <div class="container">
                                    <div class="row">
                                        <form:input class="form-control" cssStyle="width: 650px; display: none" type="number" id="product_id" name="product-id" path="p_id"/>
                                        <div class="col-4">
                                            <div class="card mb-3">
                                                <div class="card-body text-center shadow">
                                                    <img src="${product.p_img}" width="200" height="300">
                                                    <div class="mt-2">
                                                        <label class="btn btn-primary">Change Photo<input id="product-image" type="file" name="file-up" hidden></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-8 ">
                                            <div class="mb-3">
                                                <label class="form-label" for="full-name"><strong>Tên sản phẩm</strong></label>
                                                <form:input class="form-control" cssStyle="width: 650px" type="text" id="full-name" placeholder="Điền tên sản phẩm" name="full-name" path="p_name" required="required" />
                                            </div>
                                            <div class="row" style="width: 670px">
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="product_price"><strong>Giá nhập</strong></label>
                                                        <form:input class="form-control" cssStyle="width: 300px" type="number" id="product_price" placeholder="Nhập giá gốc của sản phẩm" path="p_price" name="email" required="required" />
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="Oprice"><strong>Giá bán</strong></label>
                                                        <form:input class="form-control" cssStyle="width: 320px" type="number" id="Oprice" placeholder="Nhập giá bán của sản phẩm" path="p_Oprice" name="email" required="required" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="width: 680px">
                                                <div class="col">
                                                    <div class="mb-3">
                                                        <label class="form-label"
                                                               for="email"><strong>Số lượng nhập vào</strong></label>
                                                        <form:input class="form-control" cssStyle="width: 300px" type="number" id="email" placeholder="Nhập số lượng mặt hàng" path="p_quantity" name="email" required="required" />
                                                    </div>
                                                </div>
                                                <div class="col" >
                                                    <div class="mb-3 row" style="width: 355px">
                                                        <label class="form-label" for="product_unit"><strong>Đơn vị</strong></label>
                                                        <div class="select-icon">
                                                            <form:select path="p_unit" class="form-select" id="product_unit" required="required">
                                                                <option value="" selected disabled>Chọn đơn vị</option>
                                                                <c:forEach items="${units}" var="units">
                                                                    <form:option value="${units.un_id}">${units.un_name}</form:option>
                                                                </c:forEach>
                                                            </form:select>
                                                            <a data-bs-toggle="modal" data-bs-target="#create_unit"><i class="fas fa-plus fa-lg fa-fw me-2 text-success"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3" style="width: 657px">
                                                <label class="form-label" for="product_kind"><strong>Phân loại</strong></label>
                                                <div class="select-icon">
                                                    <form:select path="p_kind"  class="form-select" id="product_kind" required="required">
                                                        <option value="" selected disabled>Chọn loại sản phẩm</option>
                                                        <c:forEach items="${productType}" var="productType">
                                                            <form:option value="${productType.kind_id}">${productType.name}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                    <a data-bs-toggle="modal" data-bs-target="#create_type_product">
                                                        <i class="fas fa-plus fa-lg fa-fw me-2 text-success"></i></a>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="p_description"><strong>Giới thiệu sản phẩm</strong></label>
                                                <form:textarea class="form-control" cssStyle="width: 650px" path="p_description" id="p_description" rows="4" placeholder="Hãy giới thiệu về sản phẩm" />
                                            </div>
                                            <div class="mb-3">
                                                <button class="btn btn-primary" type="submit" id="add-product-btn">Lưu</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/admin/product/modal_product.jsp" %>
</body>
<script>

    $(document).ready(function () {

        $('#product-image').change(function () {
            var fileExtension = ['png', 'jpg', 'jpeg'];
            if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                $('#add-product-btn').prop('disabled', true);
            } else {
                // Đọc tệp ảnh và chuyển đổi nó thành chuỗi base64
                var reader = new FileReader();
                reader.onload = function (e) {
                    // Cập nhật giá trị của thuộc tính src của thẻ img
                    $('img').attr('src', e.target.result);
                };
                reader.readAsDataURL(this.files[0]);
                $('#add-product-btn').prop('disabled', false);
            }
        });

    });

    $('.price-sale').each(function () {
        var price = parseFloat($(this).val());
        if (!isNaN(price)) {
            $(this).text(price.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }));
        }
    });

    var modalBookk = document.getElementById("myModalBook");
    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        modalBookk.style.display = "none";
    }

    $(document).ready(function () {
        var user = $("#user");


        user.on('click', '.delete-user', function () {
            Swal.fire({
                title: 'Bạn chắc chắn xóa nhân viên này?',
                icon: 'question',
                confirmButtonText: 'Đúng vậy',
                showCancelButton: true,
                cancelButtonText: 'Không!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "GET",
                        <%--url: '/admin/user-management/delete/'+${user.u_id},--%>
                        success: function (respone) {
                            Swal.fire(respone,'', 'error');
                            window.location.href = "http://localhost:8080/admin/employee";
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                        }
                    });
                }else{
                    Toast.fire({icon: 'info', title: 'Dừng xóa nhân viên này!'})
                }
            })
        });

        user.on('click', '.update-product', function () {
            modalBookk.style.display = "block";

        });

        $('#btnSaveProduct').click(function (e) {
            //data update
            var price_sale = document.getElementById("price_sale").value;
            var price_oprice = document.getElementById("price_oprice").value;
            var quantity = document.getElementById("quantity").value;

            // dữ liệu cũ
            var p_price_sale = document.getElementById("p_price_sale").value;
            var p_price_oprice = document.getElementById("p_price_oprice").value;
            var p_quantity = document.getElementById("p_quantity").value;

            var token = $("meta[name='_csrf']").attr("content");
            var data = {
                '_attendence': 1,
                _csrf: token
            };
            $.ajax({
                url: '/admin/product/update-product',
                type: "POST",
                data: data,
                success: function (respone) {
                    Swal.fire({
                        title: 'Bạn đã chỉnh sửa thành công',
                        icon: 'success',
                    });
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                }
            });
        });
    })
</script>
</html>

