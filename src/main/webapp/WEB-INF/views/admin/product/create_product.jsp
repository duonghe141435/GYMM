<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    <%@include file="/WEB-INF/views/layouts/admin/menu.jsp" %>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 83%;text-align: left;margin-top: auto;margin-bottom: auto;">Thêm sản phẩm mới</p>
                        <a href="<c:url value='/admin/dashboard/products'/> " class="btn btn-primary" style="font-weight: 700;">Quay lại danh sách</a>
                    </div>
                    <div class="card-body"><c:url value="/admin/dashboard/products/new-product/save?${_csrf.parameterName}=${_csrf.token}" var="saveProductUrl"/>
                        <form:form method="POST" modelAttribute="product" action="${saveProductUrl}" enctype="multipart/form-data" >
                            <div class="container">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="card mb-3">
                                            <div class="card-body text-center shadow">
                                                <img src="https://via.placeholder.com/300x400" width="200" height="300">
                                                <div class="mt-2">
                                                    <label class="btn btn-primary">Change Photo<input id="product-image" type="file" name="file-up" hidden></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8 shadow">
                                        <div class="mb-3">
                                            <label class="form-label" for="full-name"><strong>Tên sản phẩm</strong></label>
                                            <form:input class="form-control" type="text" id="full-name" placeholder="Điền tên sản phẩm" name="full-name" path="p_name" required="required" />
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mb-3">
                                                    <label class="form-label" for="product_price"><strong>Giá nhập</strong></label>
                                                    <form:input class="form-control" type="number" id="product_price" placeholder="Nhập giá gốc của sản phẩm" path="p_price" name="email" required="required" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="mb-3">
                                                    <label class="form-label" for="Oprice"><strong>Giá bán</strong></label>
                                                    <form:input class="form-control" type="number" id="Oprice" placeholder="Nhập giá bán của sản phẩm" path="p_Oprice" name="email" required="required" />
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
                                            <button class="btn btn-primary" type="submit" id="add-product-btn" disabled>Tạo mới</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/modal_product2.jsp" %>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
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



</script>

