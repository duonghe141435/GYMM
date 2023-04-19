<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
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
                <div class="card shadow" style="height: 100vh">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé</p>
                        <a class="btn btn-primary" href="<c:url value="/admin/dashboard/ticket"/>" style="font-weight: 700;">Trở lại danh sách vé</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card shadow mb-4">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h6 class="text-primary fw-bold m-0">Doanh thu của vé</h6>
                                        <div class="d-flex">
                                            <div class="col-xs-3">
                                                <select class="form-select" aria-label="Select month">
                                                    <option selected>Select month</option>
                                                    <option value="1">Tháng 1</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-3 px-2">
                                                <select class="form-select" aria-label="Select Year">
                                                    <option selected>Select Year</option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body"  style="height: 500px">
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
                                                    <td class="class-price">${ticket.t_price}</td>
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
                                                        Loại vé: <c:out value="${data}"></c:out>
                                                    </td>
                                                    <td>
                                                        Vé tham gia lớp học
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
                                            <td><a class="btn btn-info" id="delete-ticket">Hủy vé</a></td>
                                            <c:if test="${ticket.tt_id == 2}"> <td><a class="btn btn-info">Xem danh sách huấn luyện viên</a></td></c:if>
                                            <c:if test="${ticket.tt_id == 3}"> <td><a class="btn btn-info" data-bs-toggle="modal"
                                                                                      data-bs-target="#list-class">Xem danh sách lớp học</a></td></c:if>

                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="list-class" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="min-width: 980px; min-height: 620px">
                    <div class="modal-header">
                        <p class="text-primary m-0 fw-bold text-start">Danh sách lớp học</p>
                        <button id="close-add-class" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="py-4">
                        <div class="container">
                            <div class="row">
                                <table class="table my-0" id="class-table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên lớp</th>
                                        <th>Giá</th>
                                        <th>Ngày bắt đầu</th>
                                        <th>Trạng thái</th>
                                        <th>Số thành viên</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                    <c:if test="${not empty classDtos}">
                                        <c:forEach items="${classDtos}" var="classDtos">
                                        <tr>
                                            <td><count></count></td>
                                            <td class="ticket-id" hidden aria-readonly="true">${classDtos.class_id}</td>
                                            <td>${classDtos.c_name}</td>
                                            <td class="class-price">${classDtos.c_price}</td>
                                            <td>${classDtos.c_start_date} - ${classDtos.c_end_date}</td>
                                            <td class="status text-center">
                                                <c:if test="${classDtos.c_status == 1}"><span class="active">Đang bán</span></c:if>
                                                <c:if test="${classDtos.c_status == -1}"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></c:if>
                                            </td>
                                            <td>${classDtos.total_attendees} / ${classDtos.max_member}</td>
                                            <td class="text-center">
                                                <a class="class-view">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Thôn tin chi tiết"></i></a>

                                                <a class="class-delete">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
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


    function getDataForMonth(dayInMonth) {
        // Lấy dữ liệu cho tháng cụ thể từ backend// Ví dụ:
        var chartData = JSON.parse('${chartData}'); // Dữ liệu cho tháng 4
        console.log(chartData);
        // lấy ngày sừ back-end
        let result = chartData.map(obj => parseInt(Object.keys(obj)[0]));
        // lấy số vé sừ back-end
        let result2 = chartData.map(obj => parseInt(Object.values(obj)[0]));


        // Tạo mảng dữ liệu cho biểu đồ
        var chartDataArray = [];
        var count = 0;
        //kiểm tra xem ngày có phải là ngày có vé được bán hay không?
        for (let i = 1; i <= dayInMonth; i++) {
            if (result.includes(i)) {
                chartDataArray.push(result2[count]);
                count++;
            }else {
                chartDataArray.push(0);
            }
        }
        console.log(chartDataArray);
        return chartDataArray;
    }


    $(document).ready(function(){

        var startOfMonth = moment().startOf('month');
        var daysFromStart = moment().diff(startOfMonth, 'days') + 1;
        console.log(daysFromStart);

        var chart_data = getDataForMonth(daysFromStart);
        const days = [];

        //lay lable theo ngày
        for (let i = 1; i <= daysFromStart; i++) {
            days.push(moment('2022-04-'+i+'', 'YYYY-MM-DD').format('DD-MM'));
        }
        console.log(days);

        const data = {
            labels: days,
            datasets: [{
                label: 'Số vé bán được trong ngày',
                data: chart_data,
                fill: false,
                borderColor: 'rgb(75, 192, 192)',
                tension: 0.1
            }],
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        };

        const config = {
            type: 'line',
            data: data
        };

        var ctx = $('#myChart');
        var myChart = new Chart(ctx, config);




        <%--let month = 3; // tháng 4 ở đây tương ứng với index 3 (vì đếm từ 0)--%>
        <%--let year = 2023; // năm tùy chọn--%>
        <%--let daysInMonthCount = moment("2023-4", "YYYY-MM").daysInMonth();--%>



        <%--var labels = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30'];--%>
        <%--var datas = [2, 6, 0, 0, 7, 0, 20, 0, 0, 1, 0, 0, 0];--%>

        <%--let daysInMonth = [];--%>


        <%--const MONTHS = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7','Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];--%>

        <%--&lt;%&ndash;var chartData = ; // Lấy dữ liệu từ biến model của JSP&ndash;%&gt;--%>


    });
</script>

</html>