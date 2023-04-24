<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/20/2023
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Cập nhật phẩm mới</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <style>
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
            <div class="container-fluid">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 83%;text-align: left;margin-top: auto;margin-bottom: auto;">Chỉnh sửa thông tin sản phẩm</p>
                        <a href="<c:url value='/admin/product'/> " class="btn btn-primary" style="font-weight: 700;">Quay lại danh sách</a>
                    </div>
                    <div class="card-body"><c:url value="/admin/product/update-product?${_csrf.parameterName}=${_csrf.token}" var="saveProductUrl"/>
                        <form:form id="update_prodct_form" method="POST" modelAttribute="product" action="${saveProductUrl}" enctype="multipart/form-data" >
                            <div class="container">
                                <div class="row">
                                    <div class="col-5">
                                        <div class="card mb-3">
                                            <div class="card-body text-center shadow">
                                                <img id="p_img" src="https://via.placeholder.com/300x400" width="200" height="300">
                                                <div class="mt-2">
                                                    <label class="btn btn-primary">Change Photo<input id="product-image" type="file" name="file-up" hidden></label>
                                                </div>
                                            </div>
                                        </div>
                                        <form:input id="p_img_old" readonly="true" path="p_img" cssStyle="display: none" />
                                        <div class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="text-primary fw-bold m-0">Bảng thay đổi giá</h6>
                                            </div>
                                            <div class="card-body">
                                                <table class="table my-0" id="product_table">
                                                    <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Giá bán</th>
                                                        <th>Ngày thêm</th>
                                                        <th>Trạng thái</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    <c:if test="${not empty prices}">
                                                        <c:forEach items="${prices}" var="prices">
                                                            <tr>
                                                                <td>
                                                                    <count></count>
                                                                </td>
                                                                <td class="product_price">${prices.pri_value}</td>
                                                                <td>${prices.pri_start_date}</td>
                                                                <td> <c:if test="${prices.pri_end_date != null}">
                                                                    Dừng sử dụng
                                                                </c:if><c:if test="${prices.pri_end_date == null}">
                                                                    Đang dùng
                                                                </c:if></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <form:input readonly="true" path="p_price_id" cssStyle="display: none" />
                                        <form:input readonly="true" path="p_id" cssStyle="display: none" />
                                        <div class="mb-3">
                                            <label class="form-label" for="full-name"><strong>Tên sản phẩm</strong></label>
                                            <form:input readonly="true" class="form-control" type="text" id="full-name" placeholder="Điền tên sản phẩm" name="full-name" path="p_name" required="required" />
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mb-3">
                                                    <label class="form-label" for="product_price"><strong>Giá nhập</strong></label>
                                                    <form:input readonly="true" class="form-control" type="number" id="product_price" placeholder="Nhập giá gốc của sản phẩm" path="p_Oprice" name="email" required="required" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="mb-3">
                                                    <label class="form-label" for="Oprice"><strong>Giá bán</strong></label>
                                                    <form:input class="form-control" type="number" id="Oprice" placeholder="Nhập giá bán của sản phẩm" path="p_price" name="email" required="required" />
                                                    <input type="number" name="old_price" readonly id="old_price" hidden aria-readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mb-3">
                                                    <label class="form-label"
                                                           for="email"><strong>Số lượng nhập vào</strong></label>
                                                    <form:input class="form-control" type="number" id="email" placeholder="Nhập số lượng mặt hàng" path="p_quantity" name="email" required="required" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="mb-3 row">
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
                                        <div class="mb-3">
                                            <label class="form-label" for="product_kind"><strong>Phân loại</strong></label>
                                            <div class="select-icon">
                                                <form:select path="p_kind" class="form-select" id="product_kind" required="required">
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
                                            <form:textarea class="form-control" path="p_description" id="p_description" rows="4" placeholder="Hãy giới thiệu về sản phẩm" />
                                        </div>
                                        <div class="mb-3">
                                            <button class="btn btn-primary" type="submit" id="update-product-btn">Lưu</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/admin/product/modal_product.jsp" %>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>

    $(document).ready(function () {

        $('#p_img').attr('src', $('#p_img_old').val());
        $('#old_price').val($('#Oprice').val());

        $('.product_price').each(function () {
            var price = parseFloat($(this).text());
            if (!isNaN(price)) {
                $(this).text(price.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }));
            }
        });


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

</script>

