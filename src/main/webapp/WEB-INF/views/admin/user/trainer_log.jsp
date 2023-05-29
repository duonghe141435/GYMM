<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 5/27/2023
  Time: 12:01 AM
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
                        <p class="text-primary m-0 fw-bold" style="width:80%">Thông tin của khách hàng</p>
                        <a href="<c:url value='/admin/customer/page=1-status=${user.u_enable}'/> " class="btn btn-primary" style="font-weight: 700;">Quay trở lại danh sách</a>                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 card" style="width: 28%">
                                <div class="left card" style="margin-left: 6px;border-radius: 15px; text-align: center; margin-top: 3px; margin-bottom: 5px">
                                    <ul id="myMenu">
                                        <li>
                                            <a href="<c:url value="/admin/customer/detail/${user.u_id}/ticket/page=1"/>">
                                                <p class="text-primary m-0 fw-bold">Lịch sử đặt vé vào cửa</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/admin/customer/detail/${user.u_id}/trainer-log/page=1"/>">
                                                <p class="text-primary m-0 fw-bold">Lịch sử thuê huấn luyện viên</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/admin/customer/detail/${user.u_id}/class-log/page=1"/>">
                                                <p class="text-primary m-0 fw-bold">Lịch sử tham gia lớp học</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/admin/customer/detail/${user.u_id}/order-log/page=1"/>">
                                                <p class="text-primary m-0 fw-bold">Lịch sử mua hàng</p>
                                            </a>
                                        </li>
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
                                    <c:if test="${user.u_enable == -1}">
                                        <tr>
                                            <td><a class="btn btn-info restore-user">Khôi phục tài khoản</a></td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${user.u_enable == 1}">
                                        <tr>
                                            <td><a class="btn btn-danger delete-user">Xóa khách hàng</a></td>
                                            <td><a class="btn btn-info update-user">Chỉnh sửa thông tin</a></td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                            <div class="col-lg-8" style="width: 72%">
                                    <div class="card-body" style="padding-top: 0;">
                                        <c:if test="${not empty ticket}">
                                            <div class="table-responsive table mt-2" role="grid" style="min-height: 62vh;">
                                                <table class="table my-0">
                                                    <thead>
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Tên huấn luyện viên</th>
                                                        <th class="text-center">Giá thuê</th>
                                                        <th class="text-center">Thời hạn</th>
                                                        <th class="text-center">Tình trạng thanh toán</th> <!-- Đã thanh toán, chưa thanh toán -->
                                                        <th class="text-center">Ngày thuê</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                                    <c:forEach items="${ticket}" var="ticket">
                                                        <tr>
                                                            <td class="text-center">
                                                                <count></count>
                                                            </td>
                                                            <td class="text-center">
                                                                    ${ticket.t_name}
                                                            </td>
                                                            <td class="text-center class-price">
                                                                    ${ticket.t_price}
                                                            </td>
                                                            <td class="text-center">
                                                                    ${ticket.max_member}
                                                            </td>
                                                            <td class="status text-center">
                                                                <c:if test="${ticket.tt_id == 1}"><span class="active">Đã thanh toán</span></c:if>
                                                                <c:if test="${ticket.tt_id == 0}"><span class="waiting">Chưa thanh toán</span></c:if>
                                                            </td>
                                                            <td class="text-center">
                                                                    ${ticket.create_date}
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 align-self-center">
                                                    <p>Tổng số bản ghi: <span>${count}</span></p>
                                                </div>
                                                <div class="col-md-6">
                                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                                        <ul class="pagination">
                                                            <c:forEach var="pageIndex" begin="1" end="${totalPages}" varStatus="status">
                                                                <c:set var="isActive" value="${pageIndex == pagination}" /> <!-- Kiểm tra xem chỉ mục có phải là chỉ mục được chọn hay không -->
                                                                <c:choose> <c:when test="${isActive}">
                                                                    <li class="page-item active"><a class="page-link" href="<c:url value='/admin/customer/detail/${user.u_id}/trainer-log/page=${pageIndex}'/>">${pageIndex}</a></li> </c:when> <c:otherwise>
                                                                    <li class="page-item"><a class="page-link" href="<c:url value='/admin/customer/detail/${user.u_id}/trainer-log/page=${pageIndex}'/>">${pageIndex}</a></li> </c:otherwise> </c:choose> </c:forEach> </ul> </nav>

                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty ticket}">
                                            <h3 style="text-align: center; margin-top: 20px">Bạn chưa thuê huấn luyện viên nào</h3>
                                        </c:if>
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

        const Toast = Swal.mixin({
            toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
    })

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
                    url: '/admin/employee-management/delete/'+${user.u_id},
                    success: function (respone) {
                        Toast.fire({icon: 'success', title: 'Tài khoản đã được xóa'});
                        setTimeout(function() {
                            window.location.href = "http://localhost:8080/admin/customer/page=1-status=1";
                        }, 3000);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            }else{
                Toast.fire({icon: 'info', title: 'Dừng xóa khách hàng này!'})
            }
        })
        });

        user.on('click', '.update-user', function () {
            window.location.href = "http://localhost:8080/admin/profile-customer/"+${user.u_id};
        });

        user.on('click', '.restore-user', function () {
            Swal.fire({
                title: 'Bạn muốn khôi phục tài khoản này?',
                icon: 'question',
                confirmButtonText: 'Đúng vậy',
                showCancelButton: true,
                cancelButtonText: 'Không!'
            }).then((result) => {
                if (result.isConfirmed) {
                $.ajax({
                    type: "GET",
                    url: 'http://localhost:8080/admin/employee-management/restore/'+${user.u_id},
                    success: function (respone) {
                        Toast.fire({icon: 'success', title: 'Tài khoản đã được khôi phục'});
                        setTimeout(function() {
                            window.location.href = "http://localhost:8080/admin/customer/page=1-status=1";
                        }, 3000);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            }else{
                Toast.fire({icon: 'info', title: 'Dừng khôi phục tài khoản khách hàng này này!'})
            }
        })
        });
    })
</script>
</html>

