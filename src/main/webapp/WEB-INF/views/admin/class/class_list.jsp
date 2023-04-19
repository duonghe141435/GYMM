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
                        <p class="text-primary m-0 fw-bold" style="width: 90%;text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách lớp học</p>
                        <a href="<c:url value='/admin/dashboard/class/new-class'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới</a>
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
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2">
                            <table class="table my-0" id="product_table">
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
                                            <td class="product_id" style="display: none" aria-readonly="true">${class_list.class_id}</td>
                                            <td class="text-center">${class_list.c_name}</td>
                                            <td class="class-price">${class_list.c_price}</td>
                                            <td class="text-center">${class_list.total_attendees} / ${class_list.max_member}</td>

                                            <td class="text-center">${class_list.c_trainer_name}</td>
                                            <td class="text-center">${class_list.c_start_date} - ${class_list.c_end_date}</td>
                                            <td class="text-center">
                                                <c:if test="${class_list.c_status == 1}">
                                                    Chưa bắt đầu
                                                </c:if>
                                                <c:if test="${class_list.c_status == 0}">
                                                    Đang diễn ra
                                                </c:if>
                                                <c:if test="${class_list.c_status == -1}">
                                                    Kế thúc
                                                </c:if>
                                            </td>
                                            <td class="text-center"> ${class_list.c_create_date}</td>
                                            <td class="text-center">
                                                <a class="class_view"><i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>
                                                <a class="class_delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing
                                    1 to 10 of 27</p></div>
                            <div class="col-md-6">
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

</html>
