<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Danh sách vé</title>
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
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé</p>
                        <button class="btn btn-primary" id="show-add-ticket" data-bs-toggle="modal"
                                data-bs-target="#ticket" style="font-weight: 700;">Thêm mới </button>
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
                                <div class="text-md-end dataTables_filter" id="dataTable_filter">
                                    <label class="form-label">
                                        <input type="search" class="form-control form-control-sm"  placeholder="Search">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" style="max-height: 100vh;">
                            <table class="table my-0" id="ticket-table">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>Tên vé</th>
                                    <th>Loại vé</th>
                                    <th class="text-center">Giá vé</th>
                                    <th class="text-center">Hạn sử dụng</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Ngày tạo</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody style="display: contents;width: 100%;overflow: auto;">
                                <c:if test="${not empty tickets}"><c:forEach items="${tickets}" var="tickets">
                                    <tr>
                                        <td><count></count></td>
                                        <td class="ticket-id" hidden aria-readonly="true">${tickets.t_id}</td>
                                        <td>${tickets.t_name}</td>
                                        <c:choose>
                                            <c:when test="${tickets.tt_id == 1}">
                                                <td>Vé vào cửa</td>
                                                <td class="class-price text-center">${tickets.t_price}</td>
                                            </c:when>
                                            <c:when test="${tickets.tt_id == 2}">
                                                <td>Vé thuê huấn luyện viên</td>
                                                <c:if test="${tickets.trainer_price_min == 0 && tickets.trainer_price_max == 0}">
                                                    <td class="class-price text-center">Chưa được định giá</td>
                                                </c:if>
                                                <c:if test="${tickets.trainer_price_min ==  tickets.trainer_price_max && tickets.trainer_price_min != 0 && tickets.trainer_price_min != 0}">
                                                    <td class="class-price text-center">${tickets.trainer_price_max}</td>
                                                </c:if>
                                                <c:if test="${tickets.trainer_price_max - tickets.trainer_price_min > 0}">
                                                    <td class="text-center"><span class="class-price">${tickets.trainer_price_min}</span> - <span class="class-price">${tickets.trainer_price_max}</span></td>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <td>Vé tham gia lớp học</td>
                                                <c:if test="${tickets.class_price_min == 0 && tickets.class_price_min == 0}">
                                                    <td class="class-price text-center">Chưa được định giá</td>
                                                </c:if>
                                                <c:if test="${tickets.class_price_min != 0 && tickets.class_price_max != 0 && tickets.class_price_min == tickets.class_price_max}">
                                                    <td class="class-price text-center">${tickets.class_price_max}</td>
                                                </c:if>
                                                <c:if test="${tickets.class_price_min !=  tickets.class_price_max}">
                                                    <td class="text-center"><span class="class-price">${tickets.class_price_min}</span> - <span class="class-price">${tickets.class_price_max}</span></td>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <td class="text-center"><span>${tickets.t_total_days}</span> ngày</td>
                                        <td class="status text-center">
                                            <c:if test="${tickets.t_status == 1}"><span class="active">Đang bán</span></c:if>
                                            <c:if test="${tickets.t_status == -1}"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></c:if>
                                        </td>
                                        <td class="text-center">${tickets.create_date}</td>
                                        <td class="text-center">
                                            <a class="ticket-view">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Thôn tin chi tiết"></i></a>

                                            <a class="ticket-delete">
                                                <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach></c:if>
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
        <%@include file="/WEB-INF/views/admin/ticket/modal_ticket.jsp"%>
        <%@include file="/WEB-INF/views/admin/ticket/modal_ticket_trainer.jsp"%>
        <%@include file="/WEB-INF/views/admin/ticket/modal_ticket_class.jsp"%>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
<script src="<c:url value='/assets/js/admin-process-ticket.js'/>"></script>
</html>