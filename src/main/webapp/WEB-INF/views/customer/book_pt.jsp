<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>

    <style>

        tbody tr{
            height: 100px !important;
        }
        .today {
            background-color: lightblue;
        }

        .past {
            background-color: lightgray;
        }

        .future {
            background-color: white;
        }
        /* thead tr{
        } */
        .clicked {
            background-color: red;
            color: white;
        }
        th,td{
            width: 80px !important;
        }
        th{
            background-color:#f0fcfc !important;
        }
        select{
            box-shadow: 1px 3px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        #myBook:hover {
            background-color: yellow;
            border-color: black;
        }

    </style>
</head>

<body>
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
        </div>
<div style="margin-left: 13%;">
    <div style="margin-left: 40%">
        <label style=" font-weight: bold; font-size: 35px; color: blue;">Lịch Tập</label>
    </div>
    <div class="card-body">
        <button class="btn-hover" id="myBook" style="box-shadow: 1px 3px;" type="button" title="Xem lịch tập với HLV của bản thân">Lịch tập</button>

        <%--<select name="typePt" id="ptType">--%>
            <%--<option value="">HLV cá nhân</option>--%>
            <%--<option value="">HLV nhóm</option>--%>
        <%--</select>--%>

        <%--<select name="pt" id="pt">--%>
            <%--<option value="" hidden>Chọn HLV</option>--%>
            <%--<option value="">Nguyen Van A</option>--%>
            <%--<option value="">Nguyen Van B</option>--%>
        <%--</select>--%>

        <select id="week-select"></select>

        <select id="year-select"></select>

    </div>
</div>
<table class="table-bordered border-collapse table-responsive " id="time_book_table"  style=" margin-left: 8%; text-align: center; width: 86%;margin-bottom: 100px;">
    <thead>
    <tr>
        <th>Thời gian</th>
        <th >
            <p id="0.0" style="margin-top: 10px"></p>
            <p id="0" style="margin-top: 1px"></p>
        </th>
        <th >
            <p id="1.0" style="margin-top: 10px"></p>
            <p id="1" style="margin-top: 1px"></p>
        </th>
        <th >
            <p id="2.0" style="margin-top: 10px"></p>
            <p id="2" style="margin-top: 1px"></p>
        </th>
        <th >
            <p id="3.0" style="margin-top: 10px"></p>
            <p id="3" style="margin-top: 1px"></p>
        </th>
        <th >
            <p id="4.0" style="margin-top: 10px"></p>
            <p id="4" style="margin-top: 1px"></p>
        </th>
        <th >
            <p id="5.0" style="margin-top: 10px"></p>
            <p id="5" style="margin-top: 1px"></p>
        </th>
        <th >
            <p id="6.0" style="margin-top: 10px"></p>
            <p id="6" style="margin-top: 1px"></p>
        </th>
        <%--<th id="1"></th>--%>
        <%--<th id="2"></th>--%>
        <%--<th id="3"></th>--%>
        <%--<th id="4"></th>--%>
        <%--<th id="5"></th>--%>
        <%--<th id="6"></th>--%>
    </tr>
    </thead>
    <tbody>
        <c:if test="${not empty times}">
            <c:forEach varStatus="index" items="${times}" var="times">
                <tr>
                    <th>${times.start_time} - ${times.end_time}</th>
                    <td id="1${times.id_time}">1.${times.id_time}</td>
                    <td id="2${times.id_time}">2.${times.id_time}</td>
                    <td id="3${times.id_time}">3.${times.id_time}</td>
                    <td id="4${times.id_time}">4.${times.id_time}</td>
                    <td id="5${times.id_time}">5.${times.id_time}</td>
                    <td id="6${times.id_time}">6.${times.id_time}</td>
                    <td id="7${times.id_time}">7.${times.id_time}</td>
                </tr>
            </c:forEach>
        </c:if>
    </tbody>
</table>
        <%--<div class="tiva-timetable" data-source="json" data-view="week"></div>--%>


<div class="modal" id="myModalBook">
    <div class="modal-dialog" style="max-width: 98%;">
        <div class="modal-content" style="margin: 5% auto;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Đặt lịch</h5>
                <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-5">
                <div class="container">
                    <p id="title_ticket_form" class="text-dark h2 text-center">Đặt lịch tập với HLV</p>

                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                            <label class="form-label col-sm-2 mt-3" for="ticket_type">Loại vé HLV:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" readonly id="ticket_type" value="HLV cá nhân"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                        <label class="form-label col-sm-2 mt-3" for="book_date">Ngày đặt:</label>
                        <div class="col-sm-6">
                            <input id="book_date" type="date" class="form-control" readonly>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row d-flex justify-content-center">
                        <label class="form-label col-sm-2 mt-3" for="timePractice">Giờ tập:</label>
                        <div class="col-sm-6">
                            <input id="timePractice" type="text" class="form-control" readonly>
                            <p style="display: none;" id="time_id"></p>
                        </div>
                    </div>
                </div>

                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                            <label class="form-label col-sm-2 mt-3" for="ticket_day">Hạn sử dụng:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" readonly id="ticket_day_book" value="5 ngày"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                            <label class="form-label col-sm-2 mt-3" for="ticket_day">Thời gian còn lại:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" readonly id="ticket_day" value="4 ngày"/>
                            </div>
                        </div>
                    </div>
                    <p style="display: none;" id="personal_trainer_id"></p>
                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                            <label class="form-label col-sm-2 mt-3" for="ticket_turn">Lặp lại:</label>
                            <div class="col-sm-6">
                                <select id="ticket_turn" class="form-select" required>
                                    <option value="" id="repeat1">Không lặp lại</option>
                                    <option value="" id="repeat2">Hàng ngày</option>
                                    <option value="" id="repeat3">Cách 1 ngày</option>
                                    <option value="" id="repeat4">Cách 2 ngày</option>
                                    <option value="" id="repeat5">Cách 1 tuần</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" id="form-number-of-repetitions" style="display: none">
                        <div class="row d-flex justify-content-center">
                            <label class="form-label col-sm-2 mt-3" for="ticket_day">Số lần lặp lại:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="number_of_repetitions" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                            <button style="width: 200px;" id="btnTickets" value="create"
                                    class="btn btn-primary btn-block mt-5">Đặt lịch
                            </button>
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/assets/js/bookPT.js'/>"></script>
<%--<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>--%>
<%--<script src="<c:url value='/assets/js/bs-init.js'/>"></script>--%>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>

<script>

    $(document).ready(function () {
        var selectYear = document.getElementById("year-select");
        selectYear.addEventListener("change", function() {
            for (var i = 0; i <= 6; i++) {
                var getDate = document.getElementById(i).innerText.trim();
                var datePartssss = getDate.split('-');
                var dayy = datePartssss[0];
                var monthh = datePartssss[1];
                var yearr = datePartssss[2];
                var dateObject = new Date(yearr, monthh - 1, dayy);
                dateObject.setDate(dateObject.getDate() + 1);
                var formattedDate = dateObject.toISOString().slice(0,10);
                for (var j = 0; j <= 7; j++) {
                    document.getElementById((i+1) + "" + (j+1)).innerHTML  = "";
                    //pt cá nhân
                    var jsonPersonalDetail = ${jsonPersonalDetail};
                    var jsonSchedulePersonal = ${jsonSchedulePersonal};
                    for (var k = 0; k < jsonPersonalDetail.length; k++) {
                        if (jsonPersonalDetail[k].current_date === formattedDate && jsonPersonalDetail[k].time_id - 1 === j){
                            for (var h = 0; h < jsonSchedulePersonal.length; h++) {
                                if (formattedDate >= jsonSchedulePersonal[h].start_date && formattedDate <= jsonSchedulePersonal[h].end_date) {
                                    document.getElementById((i+1) + "" + (j+1)).innerHTML  = jsonSchedulePersonal[h].name;
                                }
                            }
                        }
                    }
                    //class
                    var shedule = ${jsonData};
                    for (var k = 0; k < shedule.length; k++) {
                        if (formattedDate >= shedule[k].c_start_date && formattedDate <= shedule[k].c_end_date) {
                            if (shedule[k].monday === 1 && i === 0) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].tuesday === 1 && i === 1) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].wednesday === 1 && i === 2) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].thursday === 1 && i === 3) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].friday === 1 && i === 4) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].saturday === 1 && i === 5) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].sunday === 1 && i === 6) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                        }
                    }
                    document.getElementById((i+1) + "" + (j+1)).style.color = "# CDB38B"; //#363636 , # CDB38B, # 473C8B, #33CC33
                    document.getElementById((i+1) + "" + (j+1)).style.fontWeight = "bold";
                }
            }
        });
    });

    $(document).ready(function () {
        var select = document.getElementById("week-select");
        select.addEventListener("change", function() {
            for (var i = 0; i <= 6; i++) {
                var getDate = document.getElementById(i).innerText.trim();
                var datePartsss = getDate.split('-');
                var dayy = datePartsss[0];
                var monthh = datePartsss[1];
                var yearr = datePartsss[2];
                var dateObject = new Date(yearr, monthh - 1, dayy);
                dateObject.setDate(dateObject.getDate() + 1);
                var formattedDate = dateObject.toISOString().slice(0,10);
                for (var j = 0; j <= 7; j++) {
                    document.getElementById((i+1) + "" + (j+1)).innerHTML  = "";
                    //pt cá nhân
                    var jsonPersonalDetail = ${jsonPersonalDetail};
                    var jsonSchedulePersonal = ${jsonSchedulePersonal};
                    for (var k = 0; k < jsonPersonalDetail.length; k++) {
                        if (jsonPersonalDetail[k].current_date === formattedDate && jsonPersonalDetail[k].time_id - 1 === j){
                            for (var h = 0; h < jsonSchedulePersonal.length; h++) {
                                if (formattedDate >= jsonSchedulePersonal[h].start_date && formattedDate <= jsonSchedulePersonal[h].end_date) {
                                    document.getElementById((i+1) + "" + (j+1)).innerHTML  = jsonSchedulePersonal[h].name;
                                }
                            }
                        }
                    }
                    //class
                    var shedule = ${jsonData};
                    for (var k = 0; k < shedule.length; k++) {
                        if (formattedDate >= shedule[k].c_start_date && formattedDate <= shedule[k].c_end_date) {
                            if (shedule[k].monday === 1 && i === 0) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].tuesday === 1 && i === 1) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].wednesday === 1 && i === 2) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].thursday === 1 && i === 3) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].friday === 1 && i === 4) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].saturday === 1 && i === 5) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                            if (shedule[k].sunday === 1 && i === 6) {
                                if (shedule[k].c_time_id - 1 === j){
                                    if (shedule[k].c_status === 0) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
                                    }
                                    if (shedule[k].c_status === 1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
                                    }
                                    if (shedule[k].c_status === -1) {
                                        document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
                                    }
                                }
                            }
                        }
                    }
                    document.getElementById((i+1) + "" + (j+1)).style.color = "# CDB38B"; //#363636 , # CDB38B, # 473C8B, #33CC33
                    document.getElementById((i+1) + "" + (j+1)).style.fontWeight = "bold";
                }
            }
        });
    });

    for (var i = 0; i <= 6; i++) {
        var getDate = document.getElementById(i).innerText.trim();
        var datePartss = getDate.split('-');
        var dayy = datePartss[0];
        var monthh = datePartss[1];
        var yearr = datePartss[2];

        var dateObject = new Date(yearr, monthh - 1, dayy);
        dateObject.setDate(dateObject.getDate() + 1);
        var formattedDate = dateObject.toISOString().slice(0,10);
        // console.log("date: " + formattedDate);
        // console.log(formattedDate);
        for (var j = 0; j <= 7; j++) {
            document.getElementById((i+1) + "" + (j+1)).innerHTML  = "";

            //pt cá nhân
            var jsonPersonalDetail = ${jsonPersonalDetail};
            var jsonSchedulePersonal = ${jsonSchedulePersonal};
            for (var k = 0; k < jsonPersonalDetail.length; k++) {
                if (jsonPersonalDetail[k].current_date === formattedDate && jsonPersonalDetail[k].time_id - 1 === j){
                    for (var h = 0; h < jsonSchedulePersonal.length; h++) {
                        if (formattedDate >= jsonSchedulePersonal[h].start_date && formattedDate <= jsonSchedulePersonal[h].end_date) {
                            document.getElementById((i+1) + "" + (j+1)).innerHTML  = jsonSchedulePersonal[h].name;
                        }
                    }
                }
            }

            //class
            var shedule = ${jsonData};
            for (var k = 0; k < shedule.length; k++) {
                // console.log("shedule[k].c_start_date: " + shedule[k].c_start_date);
                if (formattedDate >= shedule[k].c_start_date && formattedDate <= shedule[k].c_end_date) {

                    checkWeekdays();
                }
            }
            document.getElementById((i+1) + "" + (j+1)).style.color = "# CDB38B"; //#363636 , # CDB38B, # 473C8B, #33CC33
            document.getElementById((i+1) + "" + (j+1)).style.fontWeight = "bold";
            // for (var k = 0; k < shedule.length; k++){
            //     if (shedule[k].c_start_date === formattedDate && shedule[k].c_time_id === j){
            //
            //         checkWeekdays();
            //         checkStatusClass();
            //         document.getElementById((i+1) + "" + (j+1)).style.background = "#C7CEEA";
            //         document.getElementById((i+1) + "" + (j+1)).style.color = "green";
            //     }
            // }

        }

    }

    function checkWeekdays() {
        if (shedule[k].monday === 1 && i === 0) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
        if (shedule[k].tuesday === 1 && i === 1) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
        if (shedule[k].wednesday === 1 && i === 2) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
        if (shedule[k].thursday === 1 && i === 3) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
        if (shedule[k].friday === 1 && i === 4) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
        if (shedule[k].saturday === 1 && i === 5) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
        if (shedule[k].sunday === 1 && i === 6) {
            if (shedule[k].c_time_id - 1 === j){
                checkStatusClass();
            }
        }
    }

    function checkStatusClass() {
        if (shedule[k].c_status === 0) {
            document.getElementById((i+1) + "" + (j+1)).innerHTML  = shedule[k].c_name + "<br>" + "Lớp chưa bắt đầu";
        }
        if (shedule[k].c_status === 1) {
            document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đang học";
        }
        if (shedule[k].c_status === -1) {
            document.getElementById((i+1) + "" + (j+1)).innerHTML = shedule[k].c_name + "<br>" + "Lớp đã kết thúc";
        }
    }

    var modalBookk = document.getElementById("myModalBook");
    var cellss = document.getElementsByTagName("td");
    var tbodyy = document.getElementsByTagName("tbody")[0];
    var thLists = tbodyy.getElementsByTagName("th");

    var end_date_personal_trainer;
    var dateConvert;

    // code model
    for (var i = 0; i < cellss.length; i++) {

        (function(index) { //để chuyển sang index không dùng i, addEventListener không được giữ nguyên giá trị ở i trong mỗi vòng lặp
            cellss[index].addEventListener("click", function(event) {

                var z = Array.prototype.indexOf.call(cellss, event.currentTarget);
                console.log("z: " + z);
                for(var l = 0; l < cellss.length; l++){
                    if(z<7){
                        document.getElementById("timePractice").value = thLists[0].innerHTML;
                        document.getElementById("time_id").innerText = 1;
                    }
                    if(z>=7&&z<14){
                        document.getElementById("timePractice").value = thLists[1].innerHTML;
                        document.getElementById("time_id").innerText = 2;
                    }
                    if(z>=14&&z<21){
                        document.getElementById("timePractice").value = thLists[2].innerHTML;
                        document.getElementById("time_id").innerText = 3;
                    }
                    if(z>=21&&z<28){
                        document.getElementById("timePractice").value = thLists[3].innerHTML;
                        document.getElementById("time_id").innerText = 4;
                    }
                    if(z>=28&&z<35){
                        document.getElementById("timePractice").value = thLists[4].innerHTML;
                        document.getElementById("time_id").innerText = 5;
                    }
                    if(z>=35&&z<42){
                        document.getElementById("timePractice").value = thLists[5].innerHTML;
                        document.getElementById("time_id").innerText = 6;
                    }
                    if(z>=42&&z<49){
                        document.getElementById("timePractice").value = thLists[6].innerHTML;
                        document.getElementById("time_id").innerText = 7;
                    }

                }


                for(var k = 0; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("0").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        console.log(dateParts[2]+"-"+dateParts[1]+"-"+dateParts[0]);
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                for(var k = 1; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("1").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        console.log(dateParts[2]+"-"+dateParts[1]+"-"+dateParts[0]);
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                for(var k = 2; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("2").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        console.log(dateParts[2]+"-"+dateParts[1]+"-"+dateParts[0]);
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                for(var k = 3; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("3").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                for(var k = 4; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("4").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        console.log(dateParts[2]+"-"+dateParts[1]+"-"+dateParts[0]);
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                for(var k = 5; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("5").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        console.log(dateParts[2]+"-"+dateParts[1]+"-"+dateParts[0]);
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                for(var k = 6; k < cellss.length; k=k+7){
                    if(z===k){
                        var dateString = document.getElementById("6").innerHTML;
                        var dateParts = dateString.split("-");
                        var date = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                        date.setHours(12,0,0,0); // Đặt giờ của date là 12:00:00 trưa (giờ của máy chủ)
                        document.getElementById("book_date").value = date.toISOString().split('T')[0];
                        console.log(dateParts[2]+"-"+dateParts[1]+"-"+dateParts[0]);
                        dateConvert = (
                            (dateParts[2] < 10 ? "0" : "") + dateParts[2] + "-" +
                            (dateParts[1] < 10 ? "0" + dateParts[1] : dateParts[1]) + "-" +
                            (dateParts[0] < 10 ? "0" + dateParts[0] : dateParts[0])
                        );
                    }
                }
                // Populate the modal with the data
                //document.getElementById("modal-text").textContent = data;

                // Display the modal
                //if(chua mua ve)
                //modal.style.display = "block";
                //modalBook.style.display = "none";
                //else if(da mua ve)

                if(this.classList.contains("past"))  {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Bạn không thể đặt lịch vào những ngày đã qua!',
                    })
                }
                else{
                    //check xem td đó đã có data hay có lịch tập ha chưa
                    if (cells[index].textContent !== "") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Bạn đã có lịch',
                            text: 'Vui lòng chọn thời gian khác!',
                        })
                    }else{
                        var token = $("meta[name='_csrf']").attr("content");
                        var data = {'_dateConvert' : dateConvert, _csrf: token};
                        $.ajax({
                            url: '/customer/check-personal-trainer',
                            type: 'GET',
                            data: data,
                            success: function(response, textStatus, xhr) {
                                if (xhr.status === 200) {
                                    if (!response){
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Bạn chưa có vé tập với PT cá nhân hoặc đã hết hạn!',
                                        });
                                    }else {
                                        document.getElementById("ticket_type").value = response.name;

                                        var startDateObj = new Date(response.start_date);
                                        var endDateObj = new Date(response.end_date);
                                        // Tính khoảng cách theo mili giây giữa hai ngày
                                        var timeDiff = Math.abs(endDateObj - startDateObj);
                                        // Chuyển đổi khoảng cách từ mili giây sang ngày
                                        var dayDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
                                        document.getElementById("ticket_day_book").value = dayDiff + "ngày";

                                        // Lấy ngày hôm nay
                                        var today = new Date();
                                        // Tính số ngày còn lại
                                        var timeDifff = endDateObj.getTime() - today.getTime();
                                        var dayDifff = Math.ceil(timeDifff / (1000 * 3600 * 24));
                                        document.getElementById("ticket_day").value = dayDifff + "ngày";

                                        document.getElementById("personal_trainer_id").innerText = response.create_date;

                                        end_date_personal_trainer = response.end_date;

                                        modalBookk.style.display = "block";
                                    }
                                }else {
                                    if (xhr.status === 204){
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Bạn đã có lịch tập với pt trong ngày này!',
                                        });
                                    }
                                }
                            },
                            error: function(xhr, status, error) {
                                console.log(error);
                            }
                        });


                    }
                    //modalBook.style.display = "block";
                }

            });
        })(i);
    }

    // code chọn option lặp lại
    document.addEventListener("DOMContentLoaded", function() {
        var selectElement = document.getElementById("ticket_turn");
        var defaultOption = document.getElementById("repeat1");

        selectElement.addEventListener("change", function() {
            var selectedOption = this.options[this.selectedIndex];
            var selectedOptionId = selectedOption.id;

            if (selectedOptionId === ("repeat1")){
                document.getElementById("form-number-of-repetitions").style.display = "none";
                document.getElementById("number_of_repetitions").value = "";
            } else {
                document.getElementById("form-number-of-repetitions").style.display = "inline";
            }
        });
        defaultOption.selected = true; // Đặt option mặc định
    });


    //code click button đặt lịch ở modal
    $(document).ready(function () {
        $('#btnTickets').click(function (e) {

            var date_book_schedule = document.getElementById("book_date").value;

            // lấy id của option
            var optionID = document.getElementById("ticket_turn");
            var selectedOptionID = optionID.options[optionID.selectedIndex].id;

            //check các ngày có thỏa mãm điều kiện book schedule không
            if (selectedOptionID === ("repeat1")){
                var token = $("meta[name='_csrf']").attr("content");
                var personal_trainer_id = document.getElementById("personal_trainer_id").innerText;
                var time_id = document.getElementById("time_id").innerText;
                var dateBookSchedule = [];
                dateBookSchedule.push(dateConvert);
                var data = {
                    '_personal_trainer_id' : personal_trainer_id,
                    '_time_id' : time_id,
                    '_date_book_schedule' : JSON.stringify(dateBookSchedule),
                    _csrf: token};
                $.ajax({
                    type: "POST",
                    url: '/customer/BookingTicketTrainer/bookSchedule',
                    data: data,
                    success: function (respone) {
                        if (respone === ""){
                            Swal.fire({
                                icon: 'success',
                                text: 'Bạn đã đặt lịch tập thành công',
                            }).then((result) => {
                                if(result.isConfirmed){
                                    modalBookk.style.display = "none";
                                    location.reload();
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: 'info',
                                text: 'Bạn đã có lịch tập vào ' + respone + ' ngày',
                                title: 'Vui lòng chọn lại lần lặp hoặc nhập số lần lặp bé hơn',
                            });
                        }

                    }
                });
            } else if (selectedOptionID === ("repeat2")){
                checkBookSchedule(1);
            } else if (selectedOptionID === ("repeat3")){
                checkBookSchedule(2);
            }else if (selectedOptionID === ("repeat4")){
                checkBookSchedule(3);
            }else if (selectedOptionID === ("repeat5")){
                checkBookSchedule(7);
            }


        });
    });

    function checkBookSchedule(repeat) {
        var number_of_repetitions = document.getElementById("number_of_repetitions").value;
        var personal_trainer_id = document.getElementById("personal_trainer_id").innerText;
        var time_id = document.getElementById("time_id").innerText;
        var token = $("meta[name='_csrf']").attr("content");
        var convertedDate = new Date(dateConvert);
        var endDate = new Date(end_date_personal_trainer);

        var dateBookSchedule = [];
        dateBookSchedule.push(dateConvert);
        for (var i = 0; i < number_of_repetitions;i++){
            convertedDate.setDate(convertedDate.getDate() + repeat);

            var year = convertedDate.getFullYear();
            var month = (convertedDate.getMonth() + 1).toString().padStart(2, '0');
            var day = convertedDate.getDate().toString().padStart(2, '0');
            var newDateStr = year + '-' + month + '-' + day;

            dateBookSchedule.push(newDateStr);
        }

        if (convertedDate.getTime() > endDate.getTime()) {
            Swal.fire({
                icon: 'info',
                text: 'Ngày kết thúc của đặt lịch lớn hơn hạn của vé',
                title: 'Vui lòng chọn số lần lặp bé hơn',
            });
        } else {
            var checkClass = true;
            var shedules = ${jsonData};
            for (var k = 0; k < shedules.length; k++) {
                for (var h = 0; h < dateBookSchedule.length; h++) {
                    if (dateBookSchedule[h] >= shedules[k].c_start_date && dateBookSchedule[h] <= shedules[k].c_end_date && shedules[k].c_time_id == time_id) {
                        var dateString = dateBookSchedule[h];
                        var date = new Date(dateString);
                        var dayOfWeek = date.getDay();
                        var weekdays = ["Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy"];
                        var dayOfWeekString = weekdays[dayOfWeek];
                        if (dayOfWeekString === "Chủ nhật" && shedules[k].sunday === 1) {
                            checkClass = false;
                            break;
                        }else if (dayOfWeekString === "Thứ hai" && shedules[k].monday === 1) {
                            checkClass = false;
                            break;
                        }else if (dayOfWeekString === "Thứ ba" && shedules[k].tuesday === 1) {
                            checkClass = false;
                            break;
                        }else if (dayOfWeekString === "Thứ tư" && shedules[k].wednesday === 1) {
                            checkClass = false;
                            break;
                        }else if (dayOfWeekString === "Thứ năm" && shedules[k].thursday === 1) {
                            checkClass = false;
                            break;
                        }else if (dayOfWeekString === "Thứ sáu" && shedules[k].friday === 1) {
                            checkClass = false;
                            break;
                        }else if (dayOfWeekString === "Thứ bảy" && shedules[k].saturday === 1) {
                            checkClass = false;
                            break;
                        }
                    }
                }
            }
            if (checkClass == false){
                Swal.fire({
                    icon: 'info',
                    text: 'Vui lòng chọn thời gian khác',
                    title: 'Đặt lịch của bạn bị trùng với lịch lớp',
                });
            }else if (checkClass == true){
                var data = {
                    '_personal_trainer_id' : personal_trainer_id,
                    '_time_id' : time_id,
                    '_date_book_schedule' : JSON.stringify(dateBookSchedule),
                    _csrf: token};
                $.ajax({
                    type: "POST",
                    url: '/customer/BookingTicketTrainer/bookSchedule',
                    data: data,
                    success: function (respone) {
                        if (respone === ""){
                            Swal.fire({
                                icon: 'success',
                                text: 'Bạn đã đặt lịch tập thành công',
                            }).then((result) => {
                                if(result.isConfirmed){
                                    modalBookk.style.display = "none";
                                    location.reload();
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: 'info',
                                text: 'Bạn đã có lịch tập vào ' + respone + ' ngày',
                                title: 'Vui lòng chọn lại lần lặp hoặc nhập số lần lặp bé hơn',
                            });
                        }

                    }
                });
            }
        }
    }
</script>
</html>
