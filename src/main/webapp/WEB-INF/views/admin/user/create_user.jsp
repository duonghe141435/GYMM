<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin chi tiết nhân viên</title>
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
                        <p class="text-primary m-0 fw-bold" style="width:90%">Danh sách ${title}</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 card">
                                <table>
                                    <tr>
                                        <td>Họ và tên</td>
                                        <td>${user.u_full_name}</td>
                                    </tr>
                                    <tr>
                                        <td>Ngày sinh</td>
                                        <td>${user.u_dob}</td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại</td>
                                        <td>${user.u_phone_number}</td>
                                    </tr>
                                    <tr>
                                        <td>Ngày bắt đầu làm việc</td>
                                        <td>${user.u_create_date}</td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái tài khoản</td>
                                        <c:if test="${user.u_enable == 0}">
                                            <td class="status text-center"><span class="warning">Chưa kích hoạt</span></td>
                                        </c:if>
                                        <c:if test="${user.u_enable == -1}">
                                            <td class="status text-center"><span class="danger">Khóa</span></td>
                                        </c:if>
                                        <c:if test="${user.u_enable == 1}">
                                            <td class="status text-center"><span class="active">Hoạt động</span></td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <td>Xóa nhân viên</td>
                                        <td>Chỉnh sửa thông tin</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-8">
                                <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                                    <table class="table my-0" id="list-order">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Mã hóa đơn</th>
                                            <th>Tên khách hàng</th>
                                            <th class="text-center">Ngày thanh toán</th>
                                            <th class="text-center">Tổng số tiền</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                        <c:if test="${not empty orderDtos}">
                                            <c:forEach items="${orderDtos}" var="orderDtos">
                                                <tr>
                                                    <td class="text-center"><count></count></td>
                                                    <td class="user_id" aria-readonly="true" readonly="true" hidden>${orderDtos.order_id}</td>
                                                    <td>${orderDtos.order_code}</td>
                                                    <td>${orderDtos.customer_name}</td>
                                                    <td>${orderDtos.order_date}</td>
                                                    <td class="class-price">${orderDtos.total_price}</td>
                                                    <td class="text-center">
                                                        <a class="order_view">
                                                            <i class="fas fa-eye fa-lg fa-fw me-2 text-info"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 align-self-center">
                                        <p>Tổng số bản ghi: <span>${count}</span></p>
                                    </div>
                                    <div class="col-md-6">

                                    </div>
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
</body>
<script>
    $(document).ready(function () {
        var list_order = $("#list-order");

        list_user.on('click', '.user_view', function () {
            var ids = $(this).parent().siblings('.user_id').text();

            $.ajax({
                url: 'http://localhost:8080/admin/order-management/'+ids,
                method: 'GET',
                dataType : 'json',
                success: function(response) {
                    // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    Swal.fire({
                        text: 'Hãy nhập tối thiểu /n5 ký tự vào ô input',
                        icon: 'error'
                    })
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        });
</script>
</html>
