<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Chi tiết vé tập</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <script src="<c:url value='/assets/js/chart.min.js'/>"></script>
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
                                data-bs-target="#ticket" style="font-weight: 700;">Trở lại</button>
                    </div>
                    <div class="card-body">
                        <div class="row">

                            <div class="col-lg-8">
                                <div class="card shadow mb-4">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h6 class="text-primary fw-bold m-0">Earnings Overview</h6>
                                        <div class="dropdown no-arrow"><button class="btn btn-link btn-sm dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button">
                                            <i class="fas fa-ellipsis-v text-gray-400"></i></button>
                                            <div class="dropdown-menu shadow dropdown-menu-end animated--fade-in">
                                                <p class="text-center dropdown-header">dropdown header:</p>
                                                <a class="dropdown-item" href="#">&nbsp;Theo tháng</a>
                                                <a class="dropdown-item" href="#">&nbsp;Theo năm</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">&nbsp;Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="myChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary fw-bold m-0">Thông tin vé</h6>
                                </div>
                                <div class="card-body shadow">
                                    <table class="table my-0">
                                        <tr>
                                            <td>
                                                Tên vé:
                                            </td>
                                            <td>
                                                ${ticket.t_name}
                                            </td>
                                        </tr>
                                        <c:choose>
                                            <c:when test="${ticket.tt_id == 1}">
                                                <tr>
                                                    <td>Loại vé:</td>
                                                    <td>Vé vào cửa</td>
                                                </tr>
                                                <tr>
                                                    <td>Giá vé</td>
                                                    <td class="class-price">${tickets.t_price}</td>
                                                </tr>
                                            </c:when>
                                            <c:when test="${ticket.tt_id == 2}">
                                                <tr>
                                                    <td>
                                                        Loại vé:
                                                    </td>
                                                    <td>
                                                        Vé thuê huấn luyện viên
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Huấn luyện viên:</td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-lg-9">
                                                                <div class="row">Trainer B</div>
                                                                <div class="row">Trainer B</div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <i class="fa fa-plus-circle text-info"></i>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Giá vé:
                                                    </td>
                                                    <c:if test="${ticket.trainer_price_min == 0 && ticket.trainer_price_max == 0}">
                                                    <td class="class-price">Chưa được định giá</td>
                                                    </c:if>
                                                    <c:if test="${ticket.trainer_price_min ==  ticket.trainer_price_max && ticket.trainer_price_min != 0 && ticket.trainer_price_min != 0}">
                                                        <td class="class-price">${ticket.trainer_price_max}</td>
                                                    </c:if>
                                                    <c:if test="${ticket.trainer_price_max - ticket.trainer_price_min > 0}">
                                                        <td><span class="class-price">${ticket.trainer_price_min}</span> - <span class="class-price">${ticket.trainer_price_max}</span></td>
                                                    </c:if>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td>
                                                        Loại vé:
                                                    </td>
                                                    <td>
                                                        Vé tham gia lớp học
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Danh sách lớp học:</td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-lg-9">
                                                                <div class="row">Class B</div>
                                                                <div class="row">Class B</div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <i class="fa fa-plus-circle text-info"></i>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Giá vé:
                                                    </td>
                                                    <c:if test="${ticket.class_price_min == 0 && ticket.class_price_min == 0}">
                                                        <td class="class-price">Chưa được định giá</td>
                                                    </c:if>
                                                    <c:if test="${ticket.class_price_min != 0 && ticket.class_price_max != 0 && ticket.class_price_min == ticket.class_price_max}">
                                                        <td class="class-price">${ticket.class_price_max}</td>
                                                    </c:if>
                                                    <c:if test="${ticket.class_price_min !=  ticket.class_price_max}">
                                                        <td><span class="class-price">${ticket.class_price_min}</span> - <span class="class-price">${ticket.class_price_max}</span></td>
                                                    </c:if>
                                                </tr>

                                            </c:otherwise>
                                        </c:choose>
                                        <tr>
                                            <td>Hạn dùng</td>
                                            <td><span>${ticket.t_total_days}</span> ngày</td>
                                        </tr>
                                        <tr>
                                            <td>Trạng thái</td>
                                            <td class="status">
                                                <c:if test="${ticket.t_status == 1}"><span class="active">Đang bán</span></c:if>
                                                <c:if test="${ticket.t_status == -1}"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Ngày tạo:
                                            </td>
                                            <td>
                                                ${ticket.create_date}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Số người đặt hôm nay:</td>
                                            <td><span>${number_order_today}</span> người</td>
                                        </tr>
                                        <tr>
                                            <td>Tổng số người đặt:</td>
                                            <td><span>${number_order}</span> người</td>
                                        </tr>
                                        <tr>
                                            <td><a class="btn btn-info">Hủy vé</a></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
<script>

    $(document).ready(function(){

        const MONTHS = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7','Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
        const label_day = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];

        const data = {
            labels: MONTHS,
            datasets: [{
                label: 'Tổng số vế trong tháng',
                data: [65, 59, 80, 81, 55, 55, 40],
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
            }]
        };

        const config = {
            type: 'line',
            data: data
        };

        var ctx = $('#myChart');
        var myChart = new Chart(ctx, config);
    });

</script>
</html>