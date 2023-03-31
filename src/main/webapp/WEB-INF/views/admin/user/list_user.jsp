<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Danh sách nhân viên</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
    <style>
        body {
            /* Set "my-sec-counter" to 0 */
            counter-reset: my-sec-counter;
        }

        count::before {
            /* Increment "my-sec-counter" by 1 */
            counter-increment: my-sec-counter;
            content: counter(my-sec-counter) ;
        }
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <%--<%@include file="/WEB-INF/views/layouts/admin/menu.jsp" %>--%>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Thông tin nhân viên</p>
                        <a href="<c:url value='/admin/dashboard/users/new-user'/> " class="btn btn-primary text-end" style="font-weight: 700;">Thêm mới</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label class="form-label">Show&nbsp;<select class="d-inline-block form-select form-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label class="form-label"><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Email</th>
                                    <th>SĐT</th>
                                    <th>Trạng thái khóa</th>
                                    <th>Trạng thái kích hoạt</th>
                                    <th>Chức vụ</th>
                                    <th>Ngày tạo</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty users}">
                                    <c:forEach items="${users}" var="users">

                                        <tr>
                                            <td><count></count></td>
                                            <td>${users.u_email}</td>
                                            <td>${users.u_phone_number}</td>
                                            <td class="text-center"><c:if test="${users.u_status == true}"><i class="fas fa-lock-open fa-lg fa-fw me-2 text-success"></i></c:if><c:if test="${users.u_enable == false}"><i class="fas fa-lock fa-lg fa-fw me-2 text-danger"></i></c:if></td>
                                            <td class="text-center"><c:if test="${users.u_enable == true}"><i class="fas fa-user-check fa-lg fa-fw me-2 text-success"></i></c:if><c:if test="${users.u_enable == false}"><i class="fas fa-user-lock fa-lg fa-fw me-2 text-danger"></i></c:if></td>
                                            <td><c:if test="${users.r_id == 1}">Admin</c:if><c:if test="${users.r_id == 2}">Nhân viên</c:if><c:if test="${users.r_id == 3}">Huấn luyện viên</c:if></td>
                                            <td>${users.u_create_date}</td>
                                            <td><a class="user_view" data-bs-toggle="modal" data-bs-target="#vew_user_modal">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>

                                                <a class="ticket_update" href="<c:url value='/admin/dashboard/users/${users.u_id}'/> ">
                                                    <i class="fas fa-edit fa-lg fa-fw me-2 text-primary" title="Cập nhập vé"></i></a>

                                                <a class="ticket_delete">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>

                                </tbody>
                            </table>
                        </div>
                        <%--<div class="row">--%>
                        <%--<div class="col-md-6 align-self-center">--%>
                        <%--<p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6">--%>
                        <%--<nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">--%>
                        <%--<ul class="pagination">--%>
                        <%--<li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>--%>
                        <%--<li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
                        <%--<li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                        <%--<li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                        <%--<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>--%>
                        <%--</ul>--%>
                        <%--</nav>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</html>