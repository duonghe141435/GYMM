<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/19/2023
  Time: 6:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
            <div class="container-fluid min-vh-100">
                <div class="card shadow">

                    <div class="card-body">
                        <div class="row">

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
                                        <div class="card-body" style="padding-top: 0;">
                                            <c:if test="${not empty classDtos}">
                                                <div class="table-responsive table mt-2" role="grid" style="max-height: 62vh;">
                                                    <table class="table my-0">
                                                        <thead>
                                                        <tr>
                                                            <th class="text-center">#</th>
                                                            <th class="text-center">Tên lớp học</th>
                                                            <th class="text-center">Tên PT</th>
                                                            <th class="text-center">Giá thuê</th>
                                                            <th class="text-center">Thời hạn</th>
                                                            <th class="text-center">Tình trạng thanh toán</th> <!-- Đã thanh toán, chưa thanh toán -->
                                                            <th class="text-center">Ngày thuê</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                                        <c:forEach items="${classDtos}" var="classDtos">
                                                            <tr>
                                                                <td class="text-center">
                                                                    <count></count>
                                                                </td>
                                                                <td class="text-center">
                                                                        ${classDtos.c_name}
                                                                </td>
                                                                <td class="text-center">
                                                                        ${classDtos.c_trainer_name}
                                                                </td>
                                                                <td class="text-center class-price">
                                                                        ${classDtos.c_price}
                                                                </td>
                                                                <td class="text-center">
                                                                        ${classDtos.c_start_date} - ${classDtos.c_end_date}
                                                                </td>
                                                                <td class="status text-center">
                                                                    <c:if test="${classDtos.c_status == 1}"><span class="active">Đang bán / còn hạn</span></c:if>
                                                                    <c:if test="${classDtos.c_status == -1}"><span class="waiting">Hết hạn</span></c:if>
                                                                    <c:if test="${classDtos.c_status == 0}"><span class="waiting">Bị hủy - booking class không thành công</span></c:if>
                                                                </td>
                                                                <td class="text-center">
                                                                        ${classDtos.c_create_date}
                                                                </td>
                                                                <td onclick="viewDetailClass(${classDtos.class_id})">Xem chi tiết</td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty classDtos}">
                                                <p>Bạn chưa tham gia vào lớp học nào</p>
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
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <%@include file="/WEB-INF/views/layouts/customer/footer.jsp" %>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>
    function viewDetailClass(class_id) {
        console.log("class_id: " + class_id);
        window.location.href = '<c:url value="/CustomerUser/viewDetailAnClass?" />' + "class_id=" + class_id;

    }
</script>
</html>
