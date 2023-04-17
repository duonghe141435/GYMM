<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Lịch sử hoạt động</title>
    <style>
        .left {
            flex: 10%;
            padding: 15px 0;
        }

        .left h2 {
            padding-left: 8px;
        }

        /* Right column (page content) */
        .right {
            flex: 70%;
            padding: 15px;
        }

        /* Style the navigation menu inside the left column */
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
            <%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
            <div class="container-fluid min-vh-100">
                <div class="card shadow">

                    <div class="card-body">
                        <div class="row">
                            <div class="left card" style="margin-left: 21px;border-radius: 35px; text-align: center;">
                                <ul id="myMenu">
                                    <li><a href="<c:url value="/customer/activity-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử hoạt động</p></a></li>
                                    <li><a href="<c:url value="/customer/booking-ticket-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử đặt vé vào cửa</p></a></li>
                                    <li><a href="<c:url value="/customer/booking-trainer-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử thuê huấn luyện viên</p></a></li>
                                    <li><a href="<c:url value="/customer/booking-class-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử tham gia lớp học</p></a></li>
                                    <li><a href="<c:url value="/customer/product-order-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử mua hàng</p></a></li>
                                </ul>
                            </div>
                            <div class="right">
                                <div class="text-nowrap">
                                    <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                        <label class="form-label">Show&nbsp;
                                            <select class="d-inline-block form-select form-select-sm">
                                                <option value="10" selected="">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>&nbsp;</label>
                                    </div>
                                    <div class="card-body" style="padding-top: 0;">
                                        <c:if test="${not empty logUser}">
                                            <div class="table-responsive table mt-2" role="grid" style="max-height: 62vh;">
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
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <%@include file="/WEB-INF/views/layouts/customer/footer.jsp" %>
            </div>
        </footer>
    </div>
</div>
</body>
</html>
