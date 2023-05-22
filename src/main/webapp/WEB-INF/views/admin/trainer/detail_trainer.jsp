<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin chi tiết huấn luyện viên</title>
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
                        <p class="text-primary m-0 fw-bold" style="width:80%">Thông tin của ${title}</p>
                        <a href="<c:url value='/admin/trainer/page=1-status=1'/> " class="btn btn-primary" style="font-weight: 700;">Quay trở lại danh sách</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 card">
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
                                        <td><a class="btn btn-danger delete-user">Xóa nhân viên</a></td>
                                        <td><a class="btn btn-info update-user">Chỉnh sửa thông tin</a></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-8">
                                <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                                    <table class="table my-0" id="list-class">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Tên lớp</th>
                                            <th>Số học viên</th>
                                            <th class="text-center">Hạn dùng</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                        <c:if test="${not empty classDtos}">
                                            <c:forEach items="${classDtos}" var="classDtos">
                                                <tr>
                                                    <td class="text-center"><count></count></td>
                                                    <td class="class_id" aria-readonly="true" readonly="true" hidden>${classDtos.class_id}</td>
                                                    <td>${classDtos.c_name}</td>
                                                    <td>${classDtos.total_attendees} / ${classDtos.max_member}</td>
                                                    <td>${classDtos.c_start_date} - ${classDtos.c_end_date} </td>
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
        var list_class = $("#list-class");

        list_class.on('click', '.class_view', function () {
            var ids = $(this).parent().siblings('.class_id').text();

            $.ajax({
                url: 'http://localhost:8080/admin/class-management/' + ids,
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    Swal.fire({
                        text: 'Hãy nhập tối thiểu /n5 ký tự vào ô input',
                        icon: 'error'
                    })
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });

        var user = $("#user");
        user.on('click', '.delete-user', function () {
            Swal.fire({
                title: 'Bạn chắc chắn xóa huấn luyện viên này?',
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
            window.location.href = "http://localhost:8080/admin/profile-trainer/"+${user.u_id};
        });
    })
</script>
</html>
