<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Danh sách lớp học</title>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 82%;text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách lớp học</p>
                        <a href="<c:url value='/admin/class/new-class'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới lớp học</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div>
                                    <label class="form-label">Trạng thái&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" id="status-class">
                                            <c:if test="${status == 0}">
                                                <option value="0" selected="">Chưa bắt đầu</option>
                                                <option value="1">Đang diễn ra</option>
                                                <option value="-1">Kết thúc</option>
                                                <option value="-2">Bị xóa</option>
                                            </c:if>
                                            <c:if test="${status == 1}">
                                                <option value="0">Chưa bắt đầu</option>
                                                <option value="1" selected>Đang diễn ra</option>
                                                <option value="-1">Kết thúc</option>
                                                <option value="-2">Bị xóa</option>
                                            </c:if>
                                            <c:if test="${status == -1}">
                                                <option value="0">Chưa bắt đầu</option>
                                                <option value="1">Đang diễn ra</option>
                                                <option value="-1" selected>Kết thúc</option>
                                                <option value="-2">Bị xóa</option>
                                            </c:if>
                                            <c:if test="${status == -2}">
                                                <option value="0">Chưa bắt đầu</option>
                                                <option value="1">Đang diễn ra</option>
                                                <option value="-1">Kết thúc</option>
                                                <option value="-2" selected>Bị xóa</option>
                                            </c:if>
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2">
                            <table class="table my-0" id="list-class-table">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Tên lớp</th>
                                    <th class="text-center">Giá</th>
                                    <th class="text-center">Số hội viên</th>
                                    <th class="text-center">Huấn luyện viên hỗ trợ</th>
                                    <th class="text-center">Thời gian</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Ngày tạo</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty class_list}">
                                    <c:forEach items="${class_list}" var="class_list">
                                        <tr>
                                            <td class="text-center">
                                                <count></count>
                                            </td>
                                            <td class="class-id" style="display: none" aria-readonly="true">${class_list.class_id}</td>
                                            <td class="text-center">${class_list.c_name}</td>
                                            <td class="class-price">${class_list.c_price}</td>
                                            <td class="text-center">${class_list.total_attendees} / ${class_list.max_member}</td>

                                            <td class="text-center">${class_list.c_trainer_name}</td>
                                            <td class="text-center">${class_list.c_start_date} - ${class_list.c_end_date}</td>
                                            <td class="text-center">
                                                <c:if test="${class_list.c_status == 0}">
                                                    Chưa bắt đầu
                                                </c:if>
                                                <c:if test="${class_list.c_status == 1}">
                                                    Đang diễn ra
                                                </c:if>
                                                <c:if test="${class_list.c_status == -1}">
                                                    Kế thúc
                                                </c:if>
                                                <c:if test="${class_list.c_status == -2}">
                                                    Bị xóa
                                                </c:if>
                                            </td>
                                            <td class="text-center"> ${class_list.c_create_date}</td>
                                            <td class="text-center">
                                                <a class="class_view" style="cursor: pointer"><i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>
                                                <c:if test="${class_list.c_status != -2}">
                                                    <a class="class_delete" style="cursor: pointer">
                                                        <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                                </c:if>

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
                                        <c:forEach var="pageIndex" begin="1" end="${totalPages}">
                                            <c:set var="isActive" value="${pageIndex == pagination}" />
                                            <!-- Kiểm tra xem chỉ mục có phải là chỉ mục được chọn hay không -->
                                            <c:choose>
                                                <c:when test="${isActive}">
                                                    <li class="page-item active"><a class="page-link" href="<c:url value="/admin/employee/page=${pageIndex}-status=${status}" />">${pageIndex}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/employee/page=${pageIndex}-status=${status}" />">${pageIndex}</a></li>
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
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>
    $(document).ready(function () {

        const Toast = Swal.mixin({
            toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
        }})

        var status_class = $("#status-class");

        status_class.on("change", function () {
            var data = $(this).val();
            window.location.href = 'http://localhost:8080/admin/class/page=1-status='+data;
        });

        var class_table = $("#list-class-table");
        class_table.on('click', '.class_view', function () {
            var class_id = $(this).parent().siblings('.class-id').text();
            window.location.href = '<c:url value="/admin/detail-class/" />'+ class_id;
        });

        class_table.on('click', '.class_delete', function () {
            var ids = $(this).parent().siblings('.class-id').text();
            var row = $(this).closest('tr');
            var token = $("meta[name='_csrf']").attr("content");
            var data = {'_id' : ids, _csrf: token};

            Swal.fire({
                title: 'Bạn muốn lớp học này này chứ?',
                showDenyButton: true,
                confirmButtonText: 'Xóa',
                denyButtonText: 'Hoạc tác',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if(result.isConfirmed){
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/admin/class-management/delete',
                    data: data,
                    success: function (result) {
                        row.remove();
                        Toast.fire({icon: 'info', title: 'Lớp học xóa!'})
                    },
                    error: function (error) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Toast.fire({icon: 'info', title: 'Dừng xóa lớp học!'})
            }
        })
        });
    });
</script>
</html>
