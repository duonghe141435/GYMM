<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
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
                        <p class="text-primary m-0 fw-bold" style="width:90%">Danh sách khách hàng</p>
                        <a href="<c:url value='/admin/users/new-user'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Trạng thái&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" id="user-status">
                                            <c:if test="${status == 0}">
                                                <option value="-1">Bị xoá</option>
                                                <option value="1">Đang hoạt động</option>
                                                <option value="0" selected>Chưa kích hoạt</option>
                                            </c:if>
                                            <c:if test="${status == -1}">
                                                <option value="-1" selected="">Bị xoá</option>
                                                <option value="1">Đang hoạt động</option>
                                                <option value="0">Chưa kích hoạt</option>
                                            </c:if>
                                            <c:if test="${status == 1}">
                                                <option value="-1">Bị khóa</option>
                                                <option value="1" selected>Đang hoạt động</option>
                                                <option value="0">Chưa kích hoạt</option>
                                            </c:if>
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                            <div class="col-md-6 text-nowrap">
                                <div class="text-md-end w-25 float-end">
                                    <label class="form-label d-flex">
                                        <input type="search" class="form-control form-control-sm" placeholder="Search" id="input-search">
                                        <button id="btn-search-user" type="button" style="background: none; border: none"><i class="fa fa-search"></i></button>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                            <table class="table my-0" id="list-user">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Tên khách hàng</th>
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
                                                    <span>Added: ${users.u_create_date}</span>
                                                </div>
                                            </td>
                                            <td>${users.u_full_name}</td>
                                            <td class="text-center">${users.u_phone_number}</td>
                                            <c:if test="${users.u_enable == 0}">
                                                <td class="status text-center"><span class="warning">Chưa kích hoạt</span></td>
                                            </c:if>
                                            <c:if test="${users.u_enable == -1}">
                                                <td class="status text-center"><span class="danger">Khóa</span></td>
                                            </c:if>
                                            <c:if test="${users.u_enable == 1}">
                                                <td class="status text-center"><span class="active">Hoạt động</span></td>
                                            </c:if>
                                            <td class="text-center">
                                                <a class="user_view">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xem lịch sử Khách hàng"></i></a>
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
        var list_user = $("#list-user");
        var btn_search = $("#btn-search-user");
        var input_search = $("#input-search");
        var user_status = $('#user-status');

        user_status.on("change", function () {
            var data = $(this).val();
            window.location.href = 'http://localhost:8080/admin/customer/page=1-status='+data;
        });

        // Thực hiện hành động tìm kiếm tại Danh sách người dùng hệ thống
        input_search.on("input", function (){
            var input = $(this).val();
            if(input.length >=5 ){
                $.ajax({
                    url: 'http://localhost:8080/admin/user-management/search',
                    method: 'GET',
                    data: {query: input},
                    dataType : 'json',
                    success: function(response) {
                        $('#dataTable tbody').remove();
                        console.log(response);
                        var tbody = $('<tbody>');
                        $('#dataTable').append(tbody);
                        $('#dataTable tbody').css({
                            'display': 'contents',
                            'width': '100%',
                            'overflow': 'auto'
                        });
                        $.each(response, function(index, users) {
                            var newrow = $("<tr>");
                            var row = '<td class="text-center"><count></count></td><td class="d-flex align-items-center" style="border: none;">\n' +
                                '<div class="img" style="background-image: url(http://localhost:8080'+users.u_img+')"></div>\n' +
                                '<div class="pl-3 email"><span>'+users.u_email+'</span><span>Added:'+users.u_create_date+'</span>\n' +
                                '</div></td><td>'+users.u_full_name+'</td><td class="text-center">'+users.u_phone_number+'</td>';

                            if(users.u_enable === -1){
                                row += ' <td class="status text-center"><span class="waiting">Chưa kích hoạt</span></td>';
                            }
                            if(users.u_enable === 0){
                                row += '<td class="status text-center"><span class="danger">Khóa</span></td>';
                            }
                            if(users.u_enable === 1){
                                row += '<td class="status text-center"><span class="active">Hoạt động</span></td>';
                            }
                            row += '<td class="text-center"><a class="user_view" data-bs-toggle="modal" data-bs-target="#vew_user_modal">\n' +
                                '<i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>\n' +
                                '<a class="ticket_update"><i class="fas fa-edit fa-lg fa-fw me-2 text-primary" title="Cập nhập vé"></i></a>\n'+
                                '</td>';
                            newrow.append(row);
                            $('#dataTable tbody').append(newrow);
                        });

                        // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                    }
                });
            }
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
            }else if(input.length >= 5){
                $.ajax({
                    url: 'http://localhost:8080/admin/user-management/search',
                    method: 'GET',
                    data: {query: input},
                    success: function(response) {
                        window.location.href = "http://localhost:8080/admin/dashboard/users/search/"+input;
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                    }
                });
            }else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Hãy nhập tối thiểu 5 ký tự vào ô input',
                    icon: 'error'
                })
            }
        });

        list_user.on('click', '.user_view', function () {
            var currentUrl = window.location.href;
            var ids = $(this).parent().siblings('.user_id').text();
            window.location.href = 'http://localhost:8080/admin/customer/detail/'+ids;
        });
    });

</script>
</html>