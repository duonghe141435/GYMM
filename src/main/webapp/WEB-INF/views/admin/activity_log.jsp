<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Lịch sử hoạt động</title>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Lịch sử hoạt động</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Loại hoạt động&nbsp;
                                        <select class="d-inline-block form-select form-select-sm">
                                            <option value="10" selected="">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <c:if test="${not empty logUser}">
                            <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th>Mảng tác động</th>
                                        <th>Nội dung</th>
                                        <th class="text-center">Ngày thực hiện</th>
                                    </tr>
                                    </thead>
                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                    <c:forEach items="${logUser}" var="logUser">
                                        <tr>
                                            <td class="text-center">
                                                <count></count>
                                            </td>
                                            <c:if test="${logUser.type_log == 1}">
                                                <td>Người dùng</td>
                                            </c:if>
                                            <c:if test="${logUser.type_log == 2}">
                                                <td>Quản trị</td>
                                            </c:if>
                                            <c:if test="${logUser.type_log == 3}">
                                                <td>Quản lý sản phẩm</td>
                                            </c:if>
                                            <c:if test="${logUser.type_log == 4}">
                                                <td>Tài khoản</td>
                                            </c:if>
                                            <c:if test="${logUser.type_log == 5}">
                                                <td>Dịch vụ</td>
                                            </c:if>
                                            <td>${logUser.content}</td>
                                            <td class="text-center">
                                                <script>
                                                    document.write(moment.unix(${logUser.date_time_create}).format('YYYY-MM-DD HH:mm:ss'));
                                                </script>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>

</html>
