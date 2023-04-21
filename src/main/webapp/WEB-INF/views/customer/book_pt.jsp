<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><dec:title default="Master-Layout" /></title>
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
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
        <button class="btn-hover" id="myBook" style="box-shadow: 1px 3px;" type="button" title="Xem lịch tập với HLV của bản thân">Lịch huấn luyện</button>

        <select name="typePt" id="ptType">
            <option value="">HLV cá nhân</option>
            <option value="">HLV nhóm</option>
        </select>

        <select name="pt" id="pt">
            <option value="" hidden>Chọn HLV</option>
            <option value="">Nguyen Van A</option>
            <option value="">Nguyen Van B</option>
        </select>

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
                            <label class="form-label col-sm-2 mt-3" for="date-input">Ngày đặt:</label>
                            <div class="col-sm-6">
                                <input type="date" class="form-control" readonly value="2023-03-16">
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

                    <div class="form-group">
                        <div class="row d-flex justify-content-center">
                            <label class="form-label col-sm-2 mt-3" for="ticket_turn">Lặp lại:</label>
                            <div class="col-sm-6">
                                <select id="ticket_turn" class="form-select" required>
                                    <option value="">Không lặp lại</option>
                                    <option value="">Hàng ngày</option>
                                    <option value="">Sau 2 ngày</option>
                                    <option value="">Sau 3 ngày</option>
                                </select>
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
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<%--<script src="<c:url value='/assets/js/bs-init.js'/>"></script>--%>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>

<script>


    for (var i = 0; i <= 6; i++) {
        var getDate = document.getElementById(i).innerText.trim();
        var dateParts = getDate.split(' ');
        var dayy = dateParts[0];
        var monthh = dateParts[2];
        var yearr = dateParts[3];

        var dateObject = new Date(yearr, monthh - 1, dayy);
        dateObject.setDate(dateObject.getDate() + 1);
        var formattedDate = dateObject.toISOString().slice(0,10);

        // console.log(formattedDate);
        for (var j = 0; j <= 7; j++) {
            document.getElementById((i+1) + "" + (j+1)).innerHTML  = "";
            var shedule = ${jsonData};
            for (var k = 0; k < shedule.length; k++) {
                if (formattedDate >= shedule[k].c_start_date && formattedDate <= shedule[k].c_end_date) {
                    checkWeekdays();
                } else {
                    console.log("no");
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
            if (shedule[k].c_time_id === j){
                checkStatusClass();
            }
        }
        if (shedule[k].tuesday === 1 && i === 1) {
            if (shedule[k].c_time_id === j){
                checkStatusClass();
            }
        }
        if (shedule[k].wednesday === 1 && i === 2) {
            if (shedule[k].c_time_id === j){
                checkStatusClass();
            }
        }
        if (shedule[k].thursday === 1 && i === 3) {
            if (shedule[k].c_time_id === j){
                checkStatusClass();
            }
        }
        if (shedule[k].friday === 1 && i === 4) {
            if (shedule[k].c_time_id === j){
                checkStatusClass();
            }
        }
        if (shedule[k].saturday === 1 && i === 5) {
            if (shedule[k].c_time_id === j){
                checkStatusClass();
            }
        }
        if (shedule[k].sunday === 1 && i === 6) {
            if (shedule[k].c_time_id === j){
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
</script>
</html>
