<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách nhân viên</title>
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
                        <p class="text-primary m-0 fw-bold" style="width:80%">Danh sách nhân viên</p>
                        <a href="<c:url value='/admin/employee/new-employee'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới nhân viên</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div>
                                    <label class="form-label">Trạng thái&nbsp;
                                        <select id="employee-status" class="d-inline-block form-select form-select-sm">
                                            <c:if test="${status == 0}">
                                                <option value="-1">Bị xóa</option>
                                                <option value="1">Đang hoạt động</option>
                                            </c:if>
                                            <c:if test="${status == -1}">
                                                <option value="-1" selected>Bị xóa</option>
                                                <option value="1">Đang hoạt động</option>
                                            </c:if>
                                            <c:if test="${status == 1}">
                                                <option value="-1">Bị xóa</option>
                                                <option value="1" selected>Đang hoạt động</option>
                                            </c:if>
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                            <div class="col-md-6 text-nowrap">
                                <div class="text-md-end w-25 float-end">
                                    <label class="form-label d-flex">
                                        <input type="search" class="form-control form-control-sm" placeholder="Tìm kiếm" id="input-search">
                                        <button id="btn-search-user" type="button" style="background: none; border: none"><i class="fa fa-search"></i></button>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                            <table class="table my-0" id="list-employee">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Tên nhân viên</th>
                                    <th class="text-center">SĐT</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody style="display: contents;width: 100%;overflow: auto;">
                                <c:if test="${not empty users}">
                                    <c:forEach items="${users}" var="users">
                                        <tr>
                                            <td class="user_id" aria-readonly="true" readonly="true" hidden>${users.u_id}</td>
                                            <td class="d-flex align-items-center" style="border: none;">
                                                <div class="img" style="background-image: url('<c:url value="${users.u_img}"/> ');"></div>
                                                <div class="pl-3 email">
                                                    <span>${users.u_email}</span>
                                                    <span>Ngày tạo: ${users.u_create_date}</span>
                                                </div>
                                            </td>
                                            <td>${users.u_full_name}</td>
                                            <td class="text-center">${users.u_phone_number}</td>
                                            <c:if test="${users.u_enable == -1}">
                                                <td class="status text-center"><span class="danger">Bị xóa</span></td>
                                            </c:if>
                                            <c:if test="${users.u_enable == 1}">
                                                <td class="status text-center"><span class="active">Hoạt động</span></td>
                                            </c:if>
                                            <td class="text-center">
                                                <a class="employee_view">
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
                                <p>Tổng số bản ghi: <span id="count-record">${count}</span></p>
                            </div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <c:forEach var="pageIndex" begin="1" end="${totalPages}" varStatus="status">
                                            <c:set var="isActive" value="${pageIndex == pagination}" />
                                            <!-- Kiểm tra xem chỉ mục có phải là chỉ mục được chọn hay không -->
                                            <c:choose>
                                                <c:when test="${isActive}">
                                                    <li class="page-item active"><a class="page-link" href="#">${pageIndex}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="#">${pageIndex}</a></li>
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
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
<script>

    $(document).ready(function () {
        var list_user = $("#list-employee");

        var employee_status = $("#employee-status");
        employee_status.on("change", function () {
            var data = $(this).val();
            window.location.href = 'http://localhost:8080/admin/employee/page=1-status='+data;
        });

        list_user.on('click', '.employee_view', function () {
            var currentUrl = window.location.href;
            var ids = $(this).parent().siblings('.user_id').text();
            window.location.href = 'http://localhost:8080/admin/employee/detail/'+ids;
        });

        var btn_search = $("#btn-search-user");
        var input_search = $("#input-search");

        // Thực hiện hành động tìm kiếm tại Danh sách người dùng hệ thống
        btn_search.click(function (e) {
            var input = input_search.val();
            // Thực hiện hành động khi thẻ input thay đổi
            if(input === ''){
                Swal.fire({
                    title: 'Oops...',
                    text: 'Bạn cần nhập thông tin vào ô tìm kiếm',
                    icon: 'error'
                })
            }else if(input.length >= 5){
                window.location.href = "http://localhost:8080/admin/employee/search/"+input;
            } else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Hãy nhập tối thiểu 5 ký tự vào ô input',
                    icon: 'error'
                })
            }
        });
    });

</script>
</html>