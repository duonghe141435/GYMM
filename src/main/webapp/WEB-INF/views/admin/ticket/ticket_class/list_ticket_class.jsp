<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/30/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý vé tham gia lớp học</title>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="stylesheet" href="<c:url value='/assets/css/table-admin-style.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top" style="overflow-y: auto">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé tham gia lóp học</p>
                        <a class="btn btn-primary" a data-bs-toggle="modal" data-bs-target="#ticket-class" style="font-weight: 700;">Thêm mới </a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Show&nbsp;
                                        <select class="d-inline-block form-select form-select-sm">
                                            <option value="10" selected="">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label class="form-label"><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                            </div>
                        </div>
                        <c:if test="${not empty tickets}">
                            <div class="table-responsive table mt-2">
                                <table class="table my-0" id="ticket-class-table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên lớp</th>
                                        <th>Số lượng học viên</th>
                                        <th>Số lượng HLV</th>
                                        <th>Ngày bắt đâu</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${tickets}" var="tickets">

                                        <tr>
                                            <td>${tickets.t_id}</td>
                                            <td class="ticket_name">${tickets.t_name}</td>
                                            <td class="price">${tickets.t_price}</td>
                                            <td><span>${tickets.t_total_days}</span> ngày</td>
                                            <td>
                                                <c:if test="${tickets.t_status == 1}">
                                                    Đang bán
                                                </c:if>
                                                <c:if test="${tickets.t_status == -1}">
                                                    Chờ duyệt - thiếu HLV
                                                </c:if>
                                            </td>
                                            <td>${tickets.create_date}</td>

                                            <td>
                                                <a class="ticket_view" href="<c:url value='/admin/dashboard/tickets/ticket-trainer/${tickets.t_id}'/> ">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-primary" title="Thôn tin chi tiết"></i></a>

                                                <a class="ticket_delete">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>

                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty tickets}">
                            <p class="text-primary m-0 fw-bold text-center" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Hiện tại chưa có vé nào, xin hay thêm mới</p>
                        </c:if>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing
                                    1 to 10 of 27</p>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/admin/ticket/ticket_class/modal_ticket_class.jsp"%>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
<script src="<c:url value='/assets/js/admin-process-ticket.js'/>"></script>
</html>
