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
                        <p class="text-primary m-0 fw-bold" style="width: 82%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé</p>
                        <a class="btn btn-primary" href="<c:url value="/admin/ticket/page=1-type=${ticket.tt_id}"/>" style="font-weight: 700;">Trở lại danh sách vé</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card shadow mb-4">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h6 class="text-primary fw-bold m-0">Doanh thu của vé</h6>
                                        <div class="d-flex">
                                            <%--<div class="col-xs-3">--%>
                                                <%--<select class="form-select" aria-label="Select month">--%>
                                                    <%--<option selected>Select month</option>--%>
                                                    <%--<option value="1">Tháng 1</option>--%>
                                                <%--</select>--%>
                                            <%--</div>--%>
                                            <%--<div class="col-xs-3 px-2">--%>
                                                <%--<select class="form-select" aria-label="Select Year">--%>
                                                    <%--<option selected>Select Year</option>--%>
                                                    <%--<option value="1">One</option>--%>
                                                    <%--<option value="2">Two</option>--%>
                                                    <%--<option value="3">Three</option>--%>
                                                <%--</select>--%>
                                            <%--</div>--%>
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
                                    <table class="table my-0" id="ticket-info">
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
                                                <c:if test="${ticket.t_status == 0}"><span class="danger">Bị xóa</span></c:if>
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
                                            <c:if test="${ticket.t_status != 0}">
                                                <td><a class="btn btn-danger delete-ticket">Hủy vé</a></td>
                                            </c:if>
                                            <c:if test="${ticket.tt_id == 2}"> <td><a class="btn btn-info" data-bs-toggle="modal"
                                                                                      data-bs-target="#list-trainer-of-ticket">Xem danh sách huấn luyện viên</a></td></c:if>
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

        <div class="modal fade" id="list-trainer-of-ticket" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="min-width: 980px; min-height: 620px">
                    <div class="modal-header">
                        <p class="text-primary m-0 fw-bold text-start">Danh sách HLV thuộc vé thuê HLV</p>
                        <button id="close-list-trainer" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="py-4">
                        <div class="container">
                            <div class="row">
                                <table class="table my-0" id="trainer-table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên HLV</th>
                                        <th>Email</th>
                                        <th>SDT</th>
                                        <th>Giá</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                    <c:if test="${not empty dtoList}">
                                        <c:forEach items="${dtoList}" var="dtoList">
                                            <tr>
                                                <td><count></count></td>
                                                <td>${dtoList.name_trainer}</td>
                                                <td>${dtoList.email_trainer}</td>
                                                <td>${dtoList.phone}</td>
                                                <td class="class-price">${dtoList.price}</td>
                                                <td class="text-center">
                                                    <%--<a class="class-view">--%>
                                                        <%--<i class="fas fa-eye fa-lg fa-fw me-2 text-info"--%>
                                                           <%--title="Thông tin chi tiết"--%>
                                                           <%--onclick="viewDetailAnClass(${classDtos.class_id})"></i></a>--%>
                                                        <a class="trainer-undo" id="trainer-undo${dtoList.personal_trainer_id}" style="display: none">
                                                            <i class="fas fa-undo fa-lg fa-fw me-2 text-primary" title="Hoàn tác" onclick="undoAnTrainer(${dtoList.personal_trainer_id})"></i></a>
                                                        <a class="trainer-delete" id="trainer-delete${dtoList.personal_trainer_id}" style="display: none">
                                                            <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa HLV" onclick="deleteAnTrainer(${dtoList.personal_trainer_id})"></i></a>
                                                    <c:if test="${!(dtoList.status_trainer == 0)}">
                                                        <script>
                                                            document.getElementById("trainer-delete"+${dtoList.personal_trainer_id}).style.display = 'inline';
                                                        </script>
                                                    </c:if>
                                                    <c:if test="${(dtoList.status_trainer == 0)}">
                                                        <script>
                                                            document.getElementById("trainer-undo"+${dtoList.personal_trainer_id}).style.display = 'inline';
                                                        </script>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty dtoList}">
                                        <h3>Vé chưa có Huấn luyện viên</h3>
                                    </c:if>
                                    </tbody>
                                </table>
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
                                                <c:if test="${classDtos.c_status == 1}"><span class="active" id="status${classDtos.class_id}">Lớp đã bắt đầu</span></c:if>
                                                <c:if test="${classDtos.c_status == 0}"><span class="waiting" id="status${classDtos.class_id}">Đang bán</span></c:if>
                                                <c:if test="${classDtos.c_status == -1}"><span class="waiting" id="status${classDtos.class_id}">Đã hết hạn</span></c:if>
                                                <c:if test="${classDtos.c_status == -2}"><span class="waiting" id="status${classDtos.class_id}">Đã xóa</span></c:if>
                                            </td>
                                            <td>${classDtos.total_attendees} / ${classDtos.max_member}</td>
                                            <td class="">
                                                <a class="class-view" style="margin-left: 1px">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-info"
                                                       title="Thông tin chi tiết"
                                                       onclick="viewDetailAnClass(${classDtos.class_id})"></i></a>
                                                <c:if test="${!(classDtos.c_status == -2)}">
                                                    <a class="class-delete" id="class-delete${classDtos.class_id}">
                                                        <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa lớp" onclick="deleteAnClass(${classDtos.class_id})"></i></a>
                                                </c:if>
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

    function viewDetailAnClass(class_id) {
        console.log("class id: " + class_id);
        window.location.href = '<c:url value="/admin/detail-class/" />'+ class_id;
    }

    function deleteAnTrainer(personal_trainer_id) {
        console.log("personal_trainer_id: " + personal_trainer_id);
        var ids = personal_trainer_id;
        var token = $("meta[name='_csrf']").attr("content");
        var data = {'_id' : ids, _csrf: token};
        Swal.fire({
            title: 'Bạn muốn xóa huyến luyện viên này chứ?',
            showDenyButton: true,
            confirmButtonText: 'Xóa',
            denyButtonText: 'Hoạc tác',
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if(result.isConfirmed){
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/admin/class-management/delete1',
                    data: data,
                    success: function (result) {
                        document.getElementById("trainer-delete"+personal_trainer_id).style.display = 'none';
                        document.getElementById("trainer-undo"+personal_trainer_id).style.display = 'inline';
                        Toast.fire({icon: 'info', title: 'Lớp học xóa!'})
                    },
                    error: function (error) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Toast.fire({icon: 'info', title: 'Dừng xóa lớp học!'})
            }
        });
    }

    function undoAnTrainer(personal_trainer_id) {
        console.log("personal_trainer_id: " + personal_trainer_id);
        var ids = personal_trainer_id;
        var token = $("meta[name='_csrf']").attr("content");
        var data = {'_id' : ids, _csrf: token};
        Swal.fire({
            title: 'Bạn muốn mở huyến luyện viên này chứ?',
            showDenyButton: true,
            confirmButtonText: 'Mở',
            denyButtonText: 'Hoạc tác',
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if(result.isConfirmed){
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/admin/class-management/undo',
                    data: data,
                    success: function (result) {
                        document.getElementById("trainer-delete"+personal_trainer_id).style.display = 'inline';
                        document.getElementById("trainer-undo"+personal_trainer_id).style.display = 'none';
                        Toast.fire({icon: 'info', title: 'Lớp học xóa!'})
                    },
                    error: function (error) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Toast.fire({icon: 'info', title: 'Dừng xóa lớp học!'})
            }
        });
    }

    function deleteAnClass(class_id) {
        console.log("class id: " + class_id);
        var ids = class_id;
        var token = $("meta[name='_csrf']").attr("content");
        var data = {'_id' : ids, _csrf: token};
        Swal.fire({
            title: 'Bạn muốn xóa lớp học này này chứ?',
            showDenyButton: true,
            confirmButtonText: 'Xóa',
            denyButtonText: 'Hoạc tác',
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if(result.isConfirmed){
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/admin/class-management/delete',
                    data: data,
                    success: function (result) {
                        document.getElementById("class-delete"+class_id).style.display = 'none';
                        document.getElementById("status"+class_id).innerText = 'Đã xóa';
                        document.getElementById("status"+class_id).classList = 'waiting';
                        Toast.fire({icon: 'info', title: 'Lớp học xóa!'})
                    },
                    error: function (error) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Toast.fire({icon: 'info', title: 'Dừng xóa lớp học!'})
            }
        });
    }

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

        const Toast = Swal.mixin({
            toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
    })

        var ticket_info = $("#ticket-info");

        ticket_info.on('click', '.delete-ticket', function () {

            var token = $("meta[name='_csrf']").attr("content");
            var data = {'_id' : ${ticket.t_id}, _csrf: token};

            Swal.fire({
                title: 'Bạn chắc chắn hủy bán vé này này?',
                icon: 'question',
                confirmButtonText: 'Đúng vậy',
                showCancelButton: true,
                cancelButtonText: 'Không!'
            }).then((result) => {
                if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    data : data,
                    url: '/admin/ticket-management/delete',
                    success: function (respone) {
                        Toast.fire({icon: 'success', title: 'Vé đã được hủy bán'});
                        setTimeout(function() {
                            window.location.href = "http://localhost:8080/admin/ticket/page=1-type=${ticket.tt_id}";
                        }, 3000);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            }else{
                Toast.fire({icon: 'info', title: 'Dừng hủy vé này!'})
            }
        })
        });

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
    });
</script>

</html>