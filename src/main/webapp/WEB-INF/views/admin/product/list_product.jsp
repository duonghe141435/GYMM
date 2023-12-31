<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sản phẩm</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 80%;text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách sản phẩm</p>
                        <a href="<c:url value='/admin/product/new-product'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới sản phẩm</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div>

                                    <label class="form-label">Trạng thái&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" id="product-status" style="width: auto">
                                            <c:if test="${status == 1}">
                                                <option value="1" selected>Đang bán</option>
                                                <option value="0">Ngừng bán/Hết Hàng</option>
                                            </c:if>

                                            <c:if test="${status == 0}">
                                                <option value="1" >Đang bán</option>
                                                <option value="0" selected>Ngừng bán/Hết Hàng</option>
                                            </c:if>
                                        </select>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6 text-nowrap">
                                <div class="text-md-end w-25 float-end">
                                    <label class="form-label d-flex">
                                        <input type="search" class="form-control form-control-sm" placeholder="Search" id="input-search">
                                        <button id="btn-search-product" type="button" style="background: none; border: none"><i class="fa fa-search"></i></button>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2">
                            <table class="table my-0" id="product_table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên</th>
                                    <th>Giá nhập</th>
                                    <th>Giá bán</th>
                                    <th>Ngày thêm</th>
                                    <th>Số lượng</th>
                                    <th>Mô tả</th>
                                    <th>Trạng thái</th>
                                    <th>Phân loại</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty productDtos}">
                                    <c:forEach items="${productDtos}" var="productDtos">
                                        <tr>
                                            <td>
                                                <count></count>
                                            </td>
                                            <td class="product_id" style="display: none" aria-readonly="true">${productDtos.p_id}</td>
                                            <td>${productDtos.p_name}</td>
                                            <td class="product_price">${productDtos.p_price}</td>
                                            <td class="product_Oprice">${productDtos.p_Oprice}</td>
                                            <td>${productDtos.p_create}</td>
                                            <td>${productDtos.p_quantity} ${productDtos.p_unit_name}</td>
                                            <td>${productDtos.p_description}</td>
                                            <td>
                                                <c:if test="${productDtos.p_status == true}">
                                                    Đang bán
                                                </c:if>
                                                <c:if test="${productDtos.p_status == false}">
                                                    Ngừng bán
                                                </c:if>
                                            </td>
                                            <td class="product_kind">${productDtos.p_kind_name}</td>
                                            <td>
                                                <a href="<c:url value='/admin/product/detail-product/${productDtos.p_id}'/> ">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>      <div class="row">
                        <div class="col-md-6 align-self-center">
                            <p>Tổng số bản ghi: <span id="count-record">${count}</span></p>
                        </div>
                        <div class="col-md-6">
                            <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                <ul class="pagination">
                                    <c:forEach var="pageIndex" begin="1" end="${totalPages}">
                                        <c:set var="isActive" value="${pageIndex == pagination}" />
                                        <!-- Kiểm tra xem chỉ mục có phải là chỉ mục được chọn hay không -->
                                        <c:choose>
                                            <c:when test="${isActive}">
                                                <li class="page-item active"><a class="page-link" href="<c:url value="/admin/product/page=${pageIndex}-status=${status}" />">${pageIndex}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="<c:url value="/admin/product/page=${pageIndex}-status=${status}" />">${pageIndex}</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div>
</div>
</body>
<script>
    $(document).ready(function() {

        var status = $("#product-status");
        var btn_search = $("#btn-search-product");
        var input_search = $("#input-search");

        $('.product_price').each(function () {
            var price = parseFloat($(this).text());
            if (!isNaN(price)) {
                $(this).text(price.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }));
            }
        });

        $('.product_Oprice').each(function () {
            var price = parseFloat($(this).text());
            if (!isNaN(price)) {
                $(this).text(price.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }));
            }
        });

        status.on("change", function () {
            var data = $(this).val();
            window.location.href = 'http://localhost:8080/admin/product/page=1-status='+data;
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
                window.location.href = "http://localhost:8080/admin/product/search/"+input;
            } else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Hãy nhập tối thiểu 3 ký tự vào ô input',
                    icon: 'error'
                })
            }
        });
    });
</script>
</html>
