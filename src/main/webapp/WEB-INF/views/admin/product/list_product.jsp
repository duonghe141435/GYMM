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
                        <p class="text-primary m-0 fw-bold" style="width: 90%;text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách sản phẩm</p>
                        <a href="<c:url value='/admin/product/new-product'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div>
                                    <label class="form-label">Show&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" style="width: auto;">
                                            <option value="10" selected="">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;
                                    </label>

                                    <label class="form-label">Trạng thái&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" style="width: auto">
                                            <option value="10" selected="">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label
                                        class="form-label"><input type="search" class="form-control form-control-sm"
                                                                  aria-controls="dataTable"
                                                                  placeholder="Search"></label></div>
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
                                                <a href="<c:url value='/admin/product/${productDtos.p_id}'/> ">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i>
                                                </a>
                                                <a class="product_delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing
                                    1 to 10 of 27</p></div>
                            <div class="col-md-6">
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

        $("#product_table").on('click', '.product_delete', function (){
            var ids = $(this).parent().siblings('.product_id').text();
            const row = $(this).closest('tr');
            Swal.fire({
                title: 'Bạn muốn xóa sản phẩm này?',
                showDenyButton: true,
                confirmButtonText: 'Xóa',
                denyButtonText: 'Hoạc tác',
                icon: 'warning',
                text: 'Sau khi xóa sản phẩm này sẽ ngừng bán và không hoàn tác lại được',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if(result.isConfirmed){
                $.ajax({
                    type: 'DELETE',
                    url: '<c:url value="/admin/product-management/" />' + ids +"?${_csrf.parameterName}=${_csrf.token}" ,
                    success: function (result) {
                        row.remove();
                        Swal.fire('Vé đã được xóa!', '', 'success')
                    },
                    error: function (error) {
                        Swal.fire('Lỗi hệ thống', '', 'warning')
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Swal.fire('Hành động của bạn đã được thu hồi', '', 'info')
            }
        })
        });

    });



</script>
</html>
