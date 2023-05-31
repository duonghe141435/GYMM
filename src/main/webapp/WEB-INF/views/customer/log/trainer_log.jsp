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
                                    <li><a href="<c:url value="/customer/activity-log/page=1"/>"> <p class="text-primary m-0 fw-bold">Lịch sử hoạt động</p></a></li>
                                    <li><a href="<c:url value="/customer/booking-ticket-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử đặt vé vào cửa</p></a></li>
                                    <li><a href="<c:url value="/customer/booking-trainer-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử thuê huấn luyện viên</p></a></li>
                                    <li><a href="<c:url value="/customer/booking-class-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử tham gia lớp học</p></a></li>
                                    <li><a href="<c:url value="/customer/product-order-log"/>"> <p class="text-primary m-0 fw-bold">Lịch sử mua hàng</p></a></li>
                                </ul>
                            </div>
                            <div class="right">
                                <div class="text-nowrap">
                                    <%--<div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">--%>
                                        <%--<label class="form-label">Show&nbsp;--%>
                                            <%--<select class="d-inline-block form-select form-select-sm">--%>
                                                <%--<option value="10" selected="">10</option>--%>
                                                <%--<option value="25">25</option>--%>
                                                <%--<option value="50">50</option>--%>
                                                <%--<option value="100">100</option>--%>
                                            <%--</select>&nbsp;</label>--%>
                                    <%--</div>--%>
                                    <div class="card-body" style="padding-top: 0;">
                                        <div class="card-body" style="padding-top: 0;">
                                            <c:if test="${not empty ticket}">
                                                <div class="table-responsive table mt-2" role="grid" style="max-height: 62vh;">
                                                    <table class="table my-0">
                                                        <thead>
                                                        <tr>
                                                            <th class="text-center">#</th>
                                                            <th class="text-center">Tên huấn luyện viên</th>
                                                            <th class="text-center">Loại hình</th> <!-- Cá nhân, theo lớp -->
                                                            <th class="text-center">Giá thuê</th>
                                                            <th class="text-center">Thời hạn</th>
                                                            <th class="text-center">Tình trạng thanh toán</th> <!-- Đã thanh toán, chưa thanh toán -->
                                                            <th class="text-center">Ngày thuê</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                                        <c:forEach items="${ticket}" var="ticket">
                                                            <tr>
                                                                <td class="text-center">
                                                                    <count></count>
                                                                </td>
                                                                <td class="text-center">
                                                                        ${ticket.t_name}
                                                                </td>
                                                                <td class="text-center class-price">
                                                                        ${ticket.t_price}
                                                                </td>
                                                                <td class="text-center">
                                                                        ${ticket.max_member}
                                                                </td>
                                                                <td class="status text-center">
                                                                    <c:if test="${ticket.tt_id == 1}"><span class="active">Đã thanh toán</span></c:if>
                                                                    <c:if test="${ticket.tt_id == 0}"><span class="waiting">Chưa thanh toán</span></c:if>
                                                                </td>
                                                                <td class="text-center">
                                                                        ${ticket.create_date}
                                                                </td>
                                                                <%--<td>Xem chi tiết</td>--%>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty ticket}">
                                                <p>Bạn chưa mua vé tập với PT nào</p>
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
</html>
