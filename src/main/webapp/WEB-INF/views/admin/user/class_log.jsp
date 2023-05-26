<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 5/27/2023
  Time: 12:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin chi tiết khách hàng</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <style>
        #myMenu {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        #myMenu li a {
            padding: 12px;
            text-decoration: none;
            color: black;
            display: block
        }

        #myMenu li a:hover {
            background-color: #eee;
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
                        <p class="text-primary m-0 fw-bold" style="width:80%">Thông tin của ${title}</p>
                        <a href="<c:url value='/admin/customer'/> " class="btn btn-primary" style="font-weight: 700;">Quay trở lại danh sách</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 card" style="width: 28%">
                                <div class="left card" style="margin-left: 6px;border-radius: 15px; text-align: center; margin-top: 3px; margin-bottom: 5px">
                                    <ul id="myMenu">
                                        <li><a href="<c:url value="/admin/customer/${user.u_id}"/>"> <p class="text-primary m-0 fw-bold">Lịch sử hoạt động</p></a></li>
                                        <li><a href="<c:url value="/admin/booking-ticket-log/${user.u_id}"/>"> <p class="text-primary m-0 fw-bold">Lịch sử đặt vé vào cửa</p></a></li>
                                        <li><a href="<c:url value="/admin/booking-trainer-log/${user.u_id}"/>"> <p class="text-primary m-0 fw-bold">Lịch sử thuê huấn luyện viên</p></a></li>
                                        <li><a href="<c:url value="/admin/booking-class-log/${user.u_id}"/>"> <p class="text-primary m-0 fw-bold">Lịch sử tham gia lớp học</p></a></li>
                                        <li><a href="<c:url value="/admin/product-order-log/${user.u_id}"/>"> <p class="text-primary m-0 fw-bold">Lịch sử mua hàng</p></a></li>
                                    </ul>
                                </div>
                                <table class="table my-0" id="user">
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
                                        <td>Ngày tạo</td>
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
                                        <td><a class="btn btn-danger delete-user">Xóa nhân viên</a></td>
                                        <td><a class="btn btn-info update-user">Chỉnh sửa thông tin</a></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-8" style="width: 72%">
                                <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                                    <div class="card-body" style="padding-top: 0;">
                                        <c:if test="${not empty classDtos}">
                                            <div class="table-responsive table mt-2" role="grid" style="max-height: 62vh;">
                                                <table class="table my-0">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Tên lớp học</th>
                                                        <th class="text-center">Giá thuê</th>
                                                        <th class="text-center">Thời hạn</th>
                                                        <th class="text-center">Tình trạng thanh toán</th> <!-- Đã thanh toán, chưa thanh toán -->
                                                        <th class="text-center">Ngày thuê</th>

                                                    </tr>
                                                    </thead>
                                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                                    <c:forEach items="${classDtos}" var="classDtos">
                                                        <tr>
                                                            <td class="text-center">
                                                                <count></count>
                                                            </td>
                                                            <td class="text-center">
                                                                    ${classDtos.c_name}
                                                            </td>
                                                            <td class="text-center class-price">
                                                                    ${classDtos.c_price}
                                                            </td>
                                                            <td class="text-center">
                                                                    ${classDtos.c_start_date} - ${classDtos.c_end_date}
                                                            </td>
                                                            <td class="status text-center">
                                                                <c:if test="${classDtos.c_status == 1}"><span class="active">Đang bán / còn hạn</span></c:if>
                                                                <c:if test="${classDtos.c_status == -1}"><span class="waiting">Hết hạn</span></c:if>
                                                                <c:if test="${classDtos.c_status == 0}"><span class="waiting">Bị hủy - booking class không thành công</span></c:if>
                                                            </td>
                                                            <td class="text-center">
                                                                    ${classDtos.c_create_date}
                                                            </td>
                                                            <td>Xem chi tiết</td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty classDtos}">
                                            <h3 style="text-align: center; margin-top: 20px">Hội viên chưa tham gia vào lớp học nào</h3>
                                        </c:if>
                                    </div>
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
        var user = $("#user");
        user.on('click', '.delete-user', function () {
            Swal.fire({
                title: 'Bạn chắc chắn xóa khách hàng này?',
                icon: 'question',
                confirmButtonText: 'Đúng vậy',
                showCancelButton: true,
                cancelButtonText: 'Không!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "GET",
                        url: '/admin/user-management/delete/'+${user.u_id},
                        success: function (respone) {
                            Swal.fire(respone,'', 'error');
                            window.location.href = "http://localhost:8080/admin/trainer";
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

        user.on('click', '.update-user', function () {
            window.location.href = "http://localhost:8080/admin/profile-customer/"+${user.u_id};
        });
        // list_order.on('click', '.user_view', function () {
        //     var ids = $(this).parent().siblings('.user_id').text();
        //
        //     $.ajax({
        //         url: 'http://localhost:8080/admin/order-management/'+ids,
        //         method: 'GET',
        //         dataType : 'json',
        //         success: function(response) {
        //             // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
        //             Swal.fire({
        //                 text: 'Hãy nhập tối thiểu /n5 ký tự vào ô input',
        //                 icon: 'error'
        //             })
        //         },
        //         error: function(xhr, status, error) {
        //             console.log(error);
        //         }
        //     });
        // });
    })
</script>
</html>

