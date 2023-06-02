<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 5/26/2023
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
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
                                            <c:if test="${not empty logOrder}">
                                                <div class="table-responsive table mt-2" role="grid" style="max-height: 62vh;">
                                                    <table class="table my-0" id="list-order">
                                                        <thead>
                                                        <tr>
                                                            <th class="text-center">#</th>
                                                            <th class="text-center">Mã hóa đơn</th>
                                                            <th class="text-center">Ngày mua</th>
                                                            <th class="text-center">Tổng tiền hàng</th>
                                                            <th class="text-center">giảm giá</th> <!-- Đã thanh toán, chưa thanh toán -->
                                                            <th class="text-center">Khách cần trả:</th>
                                                            <th class="text-center">Khách trả:</th>
                                                            <th class="text-center">Nhân viên trả lại:</th>
                                                            <th class="text-center">Thao tác</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                                        <c:forEach items="${logOrder}" var="logOrder">
                                                            <tr>
                                                                <td class="text-center">
                                                                    <count></count>
                                                                </td>
                                                                <td class="order_id" style="display: none">${logOrder.order_id}</td>
                                                                <td class="text-center" >
                                                                        ${logOrder.code}
                                                                </td>
                                                                <td class="text-center">
                                                                        ${logOrder.order_date}
                                                                </td>
                                                                <td class="text-center class-price total-amount">
                                                                        ${logOrder.total_amount}
                                                                </td>
                                                                <td class="text-center">
                                                                        ${logOrder.discount} %
                                                                </td>
                                                                <td class="text-center class-price">
                                                                        ${logOrder.total_payment}
                                                                </td>
                                                                <td class="text-center class-price">
                                                                        ${logOrder.customer_paying}
                                                                </td>
                                                                <td class="text-center class-price">
                                                                        ${logOrder.change}
                                                                </td>
                                                                <td class="text-center">
                                                                    <a class="order_view">
                                                                        <i class="fas fa-eye fa-lg fa-fw me-2 text-info"></i></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty logOrder}">
                                                <p>Bạn chưa mua sản phẩm nào</p>
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
    $(document).ready(function () {
        var list_order = $("#list-order");
        list_order.on('click', '.order_view', function () {
            var ids = $(this).parent().siblings('.order_id').text();
            var totalAmount = $(this).parent().siblings('.total-amount').text();
            $.ajax({
                url: '/customer/detail-order/'+ids,
                method: 'GET',
                dataType : 'json',
                success: function(response) {
                    console.log(response);

                    // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    var tableData = '';
                    tableData += '<table class="table my-0">';
                    tableData += '<tr><th>Tên sản phẩm</th><th>Số lượng</th><th>Đơn giá</th><th>Tổng tiền</th></tr>';

                    response.forEach(function(element){
                        tableData += '<tr>';
                        tableData += '<td>' + element.product_name + '</td>';
                        tableData += '<td>' + element.quantity + '</td>';
                        tableData += '<td class="class-price">' + element.price_sale + '</td>';
                        tableData += '<td class="class-price">' + element.total_price + '</td>';
                        tableData += '</tr>';
                    });
                    tableData += '<tr><td colspan="3" class="text-right"><strong>Tổng số tiền hóa đơn:</strong></td><td class="class-price">' + totalAmount + '</td></tr>';
                    tableData += '</table>';
                    Swal.fire({
                        title: 'Chi tiết hóa đơn',
                        html: tableData
                    });
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        });
    });
</script>
</html>

