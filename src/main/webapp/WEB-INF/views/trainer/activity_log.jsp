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
            border-radius: 15px;
        }
    </style>
</head>
<body id="page-top">
<div id="wrapper" >
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 10px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Lịch sử hoạt động</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="left card" style="margin-left: 21px;border-radius: 35px; text-align: center; height: 295px">
                                <ul id="myMenu">
                                    <li><a href="<c:url value="/trainer/activity-log/page=1"/>"> <p class="text-primary m-0 fw-bold">Lịch sử hoạt động</p></a></li>
                                    <li><a href="<c:url value="/trainer/product-order-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử mua hàng</p></a></li>
                                </ul>
                            </div>
                            <div class="right">
                                <div class="text-nowrap">
                                    <div class="card-body" style="padding-top: 0;">
                                        <div class="card-body" style="padding-top: 0;">
                                            <c:if test="${not empty logUser}">
                                                <div class="table-responsive table mt-2" role="grid" style="max-height: 55vh;">
                                                    <table class="table my-0" id="dataTable">
                                                        <thead>
                                                        <tr>
                                                            <th class="text-center">Thời gian thực hiện</th>
                                                            <th>Mảng tác động</th>
                                                            <th>Nội dung</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                                        <c:forEach items="${logUser}" var="logUser">
                                                            <tr>
                                                                <td class="text-center">
                                                                    <script>
                                                                        document.write(moment.unix(${logUser.date_time_create}).format('YYYY-MM-DD HH:mm:ss'));
                                                                    </script>
                                                                </td>
                                                                <c:if test="${logUser.type_log == 1}">
                                                                    <td>Tài khoản</td>
                                                                </c:if>
                                                                <c:if test="${logUser.type_log == 2}">
                                                                    <td>Quản trị người dùng</td>
                                                                </c:if>
                                                                <c:if test="${logUser.type_log == 3}">
                                                                    <td>Quản lý phòng tập</td>
                                                                </c:if>
                                                                <c:if test="${logUser.type_log == 3}">
                                                                    <td>Quản lý sản phẩm</td>
                                                                </c:if>
                                                                <c:if test="${logUser.type_log == 3}">
                                                                    <td>Quản lý thiết bị</td>
                                                                </c:if>
                                                                <td>${logUser.content}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 align-self-center">
                                                        <p>Tổng số bản ghi: <span>${count}</span></p>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                                            <ul class="pagination">
                                                                <c:forEach var="pageIndex" begin="1" end="${totalPages}">
                                                                    <c:set var="isActive" value="${pageIndex == pagination}" />
                                                                    <!-- Kiểm tra xem chỉ mục có phải là chỉ mục được chọn hay không -->
                                                                    <c:choose>
                                                                        <c:when test="${isActive}">
                                                                            <li class="page-item active"><a class="page-link" href="<c:url value="/trainer/activity-log/page=${pageIndex}" />">${pageIndex}</a></li>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <li class="page-item"><a class="page-link" href="<c:url value="/trainer/activity-log/page=${pageIndex}" />">${pageIndex}</a></li>
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                                </c:forEach>
                                                            </ul>
                                                        </nav>
                                                    </div>
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
        </div>
        <%@include file="/WEB-INF/views/layouts/trainer/footer.jsp"%>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>

</html>
