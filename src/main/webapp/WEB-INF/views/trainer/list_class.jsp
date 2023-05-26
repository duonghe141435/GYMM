<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Trang chủ</title>
    <style>
        .wrapper {
            display: table;
            height: 100%;
            width: 100%;
        }

        .container-fostrap {
            display: table-cell;
            padding: 1em;
            text-align: center;
            vertical-align: middle;
        }
        .fostrap-logo {
            width: 100px;
            margin-bottom:15px
        }
        h1.heading {
            color: #fff;
            font-size: 1.15em;
            font-weight: 900;
            margin: 0 0 0.5em;
            color: #505050;
        }
        @media (min-width: 450px) {
            h1.heading {
                font-size: 3.55em;
            }
        }
        @media (min-width: 760px) {
            h1.heading {
                font-size: 3.05em;
            }
        }
        @media (min-width: 900px) {
            h1.heading {
                font-size: 3.25em;
                margin: 0 0 0.3em;
            }
        }
        .card {
            display: block;
            margin-bottom: 20px;
            line-height: 1.42857143;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            transition: box-shadow .25s;
        }
        .card:hover {
            box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        }
        .img-card {
            width: 100%;
            height:200px;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            display:block;
            overflow: hidden;
        }
        .img-card img{
            width: 100%;
            height: 200px;
            object-fit:cover;
            transition: all .25s ease;
        }
        .card-content {
            padding:15px;
            text-align:left;
        }
        .card-title {
            margin-top:0px;
            font-weight: 700;
            font-size: 1.65em;
        }
        .card-title a {
            color: #000;
            text-decoration: none !important;
        }
        .card-read-more {
            border-top: 1px solid #D4D4D4;
        }
        .card-read-more a {
            text-decoration: none !important;
            padding:10px;
            font-weight:600;
            text-transform: uppercase
        }

        .row {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .row > * {
            flex: 0 0 auto;
        }
        .container {
            max-width: 1200px;
        }
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div class="container min-vh-100" style="padding-top: 100px">
                <%--<%@include file="/WEB-INF/views/customer/list_ticket.jsp" %>--%>
                <%--<%@include file="/WEB-INF/views/customer/list_trainer.jsp" %>--%>
                <%--<%@include file="/WEB-INF/views/customer/list_personal.jsp" %>--%>
                <%--<%@include file="/WEB-INF/views/customer/list_class.jsp" %>--%>
                    <div class="container-fostrap">
                        <div>
                            <h1 class="heading">
                                Lớp học
                            </h1>
                        </div>
                        <div class="content">
                            <div class="container">
                                <div id="show-ticket-class">
                                    <div class="row" id="show-class">

                                        <c:forEach items="${tickets}" var="tickets">
                                            <c:if test="${tickets.tt_id == 3}">
                                                <div class="col-xs-12 col-sm-4">
                                                    <div class="card">
                                                        <h4 class="ticket_class_id" style="display: none" aria-readonly="true">${tickets.t_id}</h4>
                                                        <a class="img-card">
                                                            <c:set var="randomNumber">
                                                                <c:out value="<%= (int)(Math.random() * 5) + 1 %>" />
                                                            </c:set>
                                                            <img src="/assets/img/ticket/${randomNumber}.jpg"/>
                                                        </a>
                                                        <div class="card-content">
                                                            <h4 class="card-title">
                                                                <a> ${tickets.t_name}</a>
                                                            </h4>
                                                            <p class="">
                                                                - Số người tham đã tham gia: <br/>
                                                                - loại vé: Vé tập với lớp <br/>
                                                                - Thời gian sử dụng: ${tickets.t_total_days} Ngày <br/>
                                                                <c:forEach items="${allTicketClass}" var="allTicketClass">
                                                                <c:if test="${(tickets.t_id) == (allTicketClass.ticket_id)}">
                                                            <td class="text-center">- Giá vé: <span class="class-price">${allTicketClass.t_price_min}</span> - <span class="class-price">${allTicketClass.t_price_max}</span></td><br/>
                                                            </c:if>
                                                            </c:forEach>
                                                            - Có hỗ trợ huấn luyện viên cá nhân <br/>
                                                            </p>
                                                        </div>
                                                        <div class="card-read-more">
                                                            <a class="btn btn-link btn-block bookInTicketClass" onclick="handleOpenModalClass(this)" tid=${tickets.t_id} t_name="${tickets.t_name}" t_total_day=${tickets.t_total_days}
                                                                    type="button" data-bs-toggle="modal" data-bs-target="#classModal">
                                                                Read more
                                                            </a>
                                                            <div class="modal fade" id="classModal">
                                                                <div class="modal-dialog"  style="max-width: 82%;">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <p class="text-dark h2 text-center">Mua vé</p>
                                                                        <div class="modal-body">
                                                                            <div class="py-5">
                                                                                <div class="container">
                                                                                    <p id="title_ticket_class_form" class="text-dark h2 text-center"></p>
                                                                                    <p hidden style="display: none" id="ticket_class_id"></p>
                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3" for="total_day_class">Tổng số ngày:</label>
                                                                                            <div class="col-sm-6">
                                                                                                <input type="text" class="form-control" id="total_day_class" readonly required/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3" for="start_date_class">Ngày bắt đầu:</label>
                                                                                            <div class="col-sm-6">
                                                                                                <input type="date" class="form-control" id="start_date_class" readonly/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3" for="stop_date_class">Ngày kết thúc:</label>
                                                                                            <div class="col-sm-6">
                                                                                                <input type="date" class="form-control" id="stop_date_class" readonly required/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3" for="pt_class_name">Chọn Lớp:</label>
                                                                                            <div class="col-sm-6">
                                                                                                <select class="form-select"  id="pt_class_name" >
                                                                                                        <%--<option disabled selected hidden>Chọn HLV</option>--%>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3">PT:</label>
                                                                                            <div class="col-sm-6" id="PT">
                                                                                                    <%--<input type="number" class="form-control" id="year" readonly required/>--%>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3">Số người đã tham gia:</label>
                                                                                            <div class="col-sm-6" id="totalAttendees">
                                                                                                    <%--<input type="number" class="form-control" id="year" readonly required/>--%>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3">Thời gian tập:</label>
                                                                                            <div class="col-sm-6" id="time">
                                                                                                    <%--<input type="number" class="form-control" id="year" readonly required/>--%>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3">Giá gói:</label>
                                                                                            <div class="col-sm-6" id="classPrice">
                                                                                                    <%--<input type="number" min="1" class="form-control" id="price" readonly required/>--%>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <label class="form-label col-sm-2 mt-3">Lịch tập trong tuần:</label>
                                                                                            <div class="col-sm-6" id="classSchedule">
                                                                                                    <%--<input type="number" min="1" class="form-control" id="price" readonly required/>--%>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <div class="row d-flex justify-content-center">
                                                                                            <%--<button onclick="handleBookingClass()" style="background: #20c9a6;border-color: #d8d8da; width: 730px; margin-left: 20px; margin-right: 20px; margin-top: 10px;"--%>
                                                                                                    <%--id="btnShedule"  class="btn btn-primary btn-block mt-5">--%>
                                                                                                <%----%>
                                                                                            <%--</button>--%>
                                                                                            <a id="getPriceClass" style="display: none"></a>
                                                                                            <a id="getTicketClassID" style="display: none"></a>
                                                                                                <%--<a onclick="handleBooking()" class="btn btn-link btn-block bookInModal" type="button" data-bs-toggle="modal" style="background: #d8d8da; max-width: 730px">--%>
                                                                                                <%--Mua vé ngay--%>
                                                                                                <%--</a>--%>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
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
<%--<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>--%>
<%--<script src="<c:url value='/assets/js/bs-init.js'/>"></script>--%>
<%--<script src="<c:url value='/assets/js/theme.js'/>"></script>--%>
<script>
    $('.price').each(function () {
        var price = parseFloat($(this).text());
        if (!isNaN(price)) {
            $(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
    });

</script>
<script>
    // click "Mua vé ngay"
    function handleOpenModalClass(event) {
        // document.getElementById("stop_date")
        // đưa data lên để hiển thị
        document.getElementById("title_ticket_class_form").innerText = event.getAttribute("t_name");
        document.getElementById("ticket_class_id").innerText = event.getAttribute("tid");
        document.getElementById("total_day_class").value = event.getAttribute("t_total_day") + " Ngày";
    }

    $(document).ready(function () {
        $("#show-ticket-class").on('click', '.bookInTicketClass', function () {
            var ids = $(this).parent().siblings(".ticket_class_id").text();
            loadDataTicketClass(ids);
        })
    });

    function loadDataTicketClass(ids) {
        $.ajax({
            type : "GET",
            // contentType: false,
            url: '<c:url value="/trainer/find-class?" />' + "ids=" + ids,
            success: function (result1) {
                var start_date = document.getElementById("start_date_class");
                var stop_date = document.getElementById("stop_date_class");
                var name = document.getElementById("pt_class_name");
                var PT = document.getElementById("PT");
                var totalAttendees = document.getElementById("totalAttendees");
                var time_class = document.getElementById("time");
                var price = document.getElementById("classPrice");
                var classSchedule = document.getElementById("classSchedule");

                start_date.innerHTML = "";
                stop_date.innerHTML = "";
                name.innerHTML = "";
                totalAttendees.innerHTML = "";
                time_class.innerHTML = "";
                price.innerHTML = "";
                PT.innerHTML = "";
                classSchedule.innerHTML = "";

                var optionHLV = document.createElement("option");
                optionHLV.innerText = "Chọn lớp";
                optionHLV.disabled = true;
                optionHLV.selected = true;
                optionHLV.hidden = true;
                name.appendChild(optionHLV);

                result1.forEach(function(ticket_class) {
                    var name_trainer = document.createElement("option");
                    name_trainer.id = ticket_class.class_id;
                    name_trainer.innerText = ticket_class.c_name;
                    name.appendChild(name_trainer);
                    name.addEventListener("change", function() {
                        var selectedOption = this.options[this.selectedIndex];
                        if (selectedOption.id == ticket_class.class_id) {
                            start_date.innerHTML = "";
                            stop_date.innerHTML = "";
                            totalAttendees.innerHTML = "";
                            time_class.innerHTML = "";
                            price.innerHTML = "";
                            PT.innerHTML = "";
                            classSchedule.innerHTML = "";

                            document.getElementById("getTicketClassID").innerText = ticket_class.c_trainer_id;

                            var optionHLV = document.createElement("option");
                            optionHLV.innerText = ticket_class.c_name;
                            optionHLV.disabled = true;
                            optionHLV.selected = true;
                            optionHLV.hidden = true;
                            name.appendChild(optionHLV);

                            // set PT
                            var pt = document.createElement("input");
                            pt.classList = "form-control";
                            pt.id = "PT";
                            pt.readOnly = true;
                            pt.required = true;
                            // total_attendees.type = "number";
                            pt.value = ticket_class.c_trainer_name;
                            pt.style.display = "inline";
                            PT.appendChild(pt);

                            // set start date
                            var dateObj = new Date(ticket_class.c_start_date);
                            var year = dateObj.getFullYear();
                            var month = String(dateObj.getMonth() + 1).padStart(2, '0');
                            var day = String(dateObj.getDate()).padStart(2, '0');
                            var formattedDate = year + '-' + month + '-' + day;
                            start_date.value = formattedDate;

                            // set end date
                            var dateObj = new Date(ticket_class.c_end_date);
                            var year = dateObj.getFullYear();
                            var month = String(dateObj.getMonth() + 1).padStart(2, '0');
                            var day = String(dateObj.getDate()).padStart(2, '0');
                            var formattedEndDate = year + '-' + month + '-' + day;
                            stop_date.value = formattedEndDate;

                            // set số người đã tham gia
                            var total_attendees = document.createElement("input");
                            total_attendees.classList = "form-control " + ticket_class.total_attendees;
                            total_attendees.id = "total_attendees" + ticket_class.total_attendees;
                            total_attendees.readOnly = true;
                            total_attendees.required = true;
                            // total_attendees.type = "number";
                            total_attendees.value = ticket_class.total_attendees + "/" + ticket_class.max_member;
                            total_attendees.style.display = "inline";
                            totalAttendees.appendChild(total_attendees);

                            //set time
                            var timeClass = document.createElement("input");
                            timeClass.classList = "form-control " + ticket_class.class_id;
                            timeClass.id = "time" + ticket_class.class_id;
                            timeClass.readOnly = true;
                            timeClass.required = true;
                            // timeClass.type = "number";
                            timeClass.value = ticket_class.start_time + " - " + ticket_class.end_time;
                            timeClass.style.display = "inline";
                            time_class.appendChild(timeClass);

                            //set price
                            var class_price = document.createElement("input");
                            class_price.classList = "form-control " + ticket_class.class_id;
                            class_price.id = "trainerPrice" + ticket_class.class_id;
                            class_price.readOnly = true;
                            class_price.required = true;
                            class_price.type = "text";
                            // set value cho input để hieent thị data
                            var formattedValue = ticket_class.c_price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                            class_price.value =  formattedValue;
                            price.appendChild(class_price);
                            document.getElementById("getPriceClass").innerText = ticket_class.c_price;

                            //set classSchedule
                            var class_schedule = document.createElement("input");
                            class_schedule.classList = "form-control " + ticket_class.class_id;
                            class_schedule.id = "trainerPrice" + ticket_class.class_id;
                            class_schedule.readOnly = true;
                            class_schedule.required = true;
                            // set value cho input để hieent thị data
                            var day_of_the_week = "";
                            if (ticket_class.monday === 1) {
                                day_of_the_week = day_of_the_week + "Thứ 2, ";
                            }
                            if (ticket_class.tuesday === 1) {
                                day_of_the_week = day_of_the_week + "Thứ 3, ";
                            }
                            if (ticket_class.wednesday === 1) {
                                day_of_the_week = day_of_the_week + "Thứ 4, ";
                            }
                            if (ticket_class.thursday === 1) {
                                day_of_the_week = day_of_the_week + "Thứ 5, ";
                            }
                            if (ticket_class.friday === 1) {
                                day_of_the_week = day_of_the_week + "Thứ 6, ";
                            }
                            if (ticket_class.saturday === 1) {
                                day_of_the_week = day_of_the_week + "Thứ 7, ";
                            }
                            if (ticket_class.sunday === 1) {
                                day_of_the_week = day_of_the_week + "Chủ nhật, ";
                            }
                            day_of_the_week = day_of_the_week.replace(/, $/, "");
                            class_schedule.value = day_of_the_week;
                            class_schedule.style.display = "inline";
                            classSchedule.appendChild(class_schedule);

                            //btnShedule
                            if (ticket_class.total_attendees === ticket_class.max_member) {
                                check_total_attendees = "full";
                            }else {
                                check_total_attendees = "notfull";
                            }

                        }
                    });
                });
            },
            error: function (error) {
                console.log("loadDataTicketClass");
                Swal.fire('Lỗi hệ thống', '', 'warning')
                console.log(error);
            }
        });
    }

</script>
</html>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<section class="wrapper">--%>
    <%--<div class="container-fostrap">--%>
        <%--<div>--%>
            <%--<h1 class="heading">--%>
                <%--Lớp học--%>
            <%--</h1>--%>
        <%--</div>--%>
        <%--<div class="content">--%>
            <%--<div class="container">--%>
                <%--<div id="show-ticket-class">--%>
                    <%--<div class="row" id="show-class">--%>

                        <%--<c:forEach items="${tickets}" var="tickets">--%>
                            <%--<c:if test="${tickets.tt_id == 3}">--%>
                                <%--<div class="col-xs-12 col-sm-4">--%>
                                    <%--<div class="card">--%>
                                        <%--<h4 class="ticket_class_id" style="display: none" aria-readonly="true">${tickets.t_id}</h4>--%>
                                        <%--<a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">--%>
                                            <%--<img src="https://1.bp.blogspot.com/-Bii3S69BdjQ/VtdOpIi4aoI/AAAAAAAABlk/F0z23Yr59f0/s640/cover.jpg" />--%>
                                        <%--</a>--%>
                                        <%--<div class="card-content">--%>
                                            <%--<h4 class="card-title">--%>
                                                <%--<a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> ${tickets.t_name}</a>--%>
                                            <%--</h4>--%>
                                            <%--<p class="">--%>
                                                <%--- Số người tham đã tham gia: <br/>--%>
                                                <%--- loại vé: Vé tập với lớp <br/>--%>
                                                <%--- Thời gian sử dụng: ${tickets.t_total_days} Ngày <br/>--%>
                                                <%--<c:forEach items="${allTicketClass}" var="allTicketClass">--%>
                                                <%--<c:if test="${(tickets.t_id) == (allTicketClass.ticket_id)}">--%>
                                            <%--<td class="text-center">- Giá vé: <span class="class-price">${allTicketClass.t_price_min}</span> - <span class="class-price">${allTicketClass.t_price_max}</span></td><br/>--%>
                                            <%--</c:if>--%>
                                            <%--</c:forEach>--%>
                                            <%--- Có hỗ trợ huấn luyện viên cá nhân <br/>--%>
                                            <%--</p>--%>
                                        <%--</div>--%>
                                        <%--<div class="card-read-more">--%>
                                            <%--<a class="btn btn-link btn-block bookInTicketClass" onclick="handleOpenModalClass(this)" tid=${tickets.t_id} t_name="${tickets.t_name}" t_total_day=${tickets.t_total_days}--%>
                                                    <%--type="button" data-bs-toggle="modal" data-bs-target="#classModal">--%>
                                                <%--Mua vé ngay--%>
                                            <%--</a>--%>
                                            <%--<div class="modal fade" id="classModal">--%>
                                                <%--<div class="modal-dialog"  style="max-width: 82%;">--%>
                                                    <%--<div class="modal-content">--%>
                                                        <%--<div class="modal-header">--%>
                                                            <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                                                        <%--</div>--%>
                                                        <%--<p class="text-dark h2 text-center">Mua vé</p>--%>
                                                        <%--<div class="modal-body">--%>
                                                            <%--<div class="py-5">--%>
                                                                <%--<div class="container">--%>
                                                                    <%--<p id="title_ticket_class_form" class="text-dark h2 text-center"></p>--%>
                                                                    <%--<p hidden style="display: none" id="ticket_class_id"></p>--%>
                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3" for="total_day_class">Tổng số ngày:</label>--%>
                                                                            <%--<div class="col-sm-6">--%>
                                                                                <%--<input type="text" class="form-control" id="total_day_class" readonly required/>--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3" for="start_date_class">Ngày bắt đầu:</label>--%>
                                                                            <%--<div class="col-sm-6">--%>
                                                                                <%--<input type="date" class="form-control" id="start_date_class" readonly/>--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3" for="stop_date_class">Ngày kết thúc:</label>--%>
                                                                            <%--<div class="col-sm-6">--%>
                                                                                <%--<input type="date" class="form-control" id="stop_date_class" readonly required/>--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>
                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3" for="pt_class_name">Chọn HLV:</label>--%>
                                                                            <%--<div class="col-sm-6">--%>
                                                                                <%--<select class="form-select"  id="pt_class_name" style="width: 82%;float:left;">--%>
                                                                                        <%--&lt;%&ndash;<option disabled selected hidden>Chọn HLV</option>&ndash;%&gt;--%>
                                                                                <%--</select>--%>
                                                                                <%--<button type="button" style="text-align: center; float:right;" class="btn btn-primary">Lịch trình</button>--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3">PT:</label>--%>
                                                                            <%--<div class="col-sm-6" id="PT">--%>
                                                                                    <%--&lt;%&ndash;<input type="number" class="form-control" id="year" readonly required/>&ndash;%&gt;--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3">Số người đã tham gia:</label>--%>
                                                                            <%--<div class="col-sm-6" id="totalAttendees">--%>
                                                                                    <%--&lt;%&ndash;<input type="number" class="form-control" id="year" readonly required/>&ndash;%&gt;--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3">Thời gian tập:</label>--%>
                                                                            <%--<div class="col-sm-6" id="time">--%>
                                                                                    <%--&lt;%&ndash;<input type="number" class="form-control" id="year" readonly required/>&ndash;%&gt;--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<label class="form-label col-sm-2 mt-3">Giá gói:</label>--%>
                                                                            <%--<div class="col-sm-6" id="classPrice">--%>
                                                                                    <%--&lt;%&ndash;<input type="number" min="1" class="form-control" id="price" readonly required/>&ndash;%&gt;--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                    <%--<div class="form-group">--%>
                                                                        <%--<div class="row d-flex justify-content-center">--%>
                                                                            <%--<button onclick="handleBookingClass()" style="background: #20c9a6;border-color: #d8d8da; width: 730px; margin-left: 20px; margin-right: 20px; margin-top: 10px;"--%>
                                                                                    <%--id="btnShedule"  class="btn btn-primary btn-block mt-5">--%>
                                                                                <%--Mua vé ngay--%>
                                                                            <%--</button>--%>
                                                                            <%--<a id="getPriceClass" style="display: none"></a>--%>
                                                                            <%--<a id="getTicketClassID" style="display: none"></a>--%>
                                                                                <%--&lt;%&ndash;<a onclick="handleBooking()" class="btn btn-link btn-block bookInModal" type="button" data-bs-toggle="modal" style="background: #d8d8da; max-width: 730px">&ndash;%&gt;--%>
                                                                                <%--&lt;%&ndash;Mua vé ngay&ndash;%&gt;--%>
                                                                                <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>
                                                                <%--</div>--%>
                                                            <%--</div>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</c:if>--%>
                        <%--</c:forEach>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<script>--%>
        <%--// click "Mua vé ngay"--%>
        <%--function handleOpenModalClass(event) {--%>
            <%--// document.getElementById("stop_date")--%>
            <%--// đưa data lên để hiển thị--%>
            <%--document.getElementById("title_ticket_class_form").innerText = event.getAttribute("t_name");--%>
            <%--document.getElementById("ticket_class_id").innerText = event.getAttribute("tid");--%>
            <%--document.getElementById("total_day_class").value = event.getAttribute("t_total_day") + " Ngày";--%>
        <%--}--%>

        <%--var end_date_class;--%>
        <%--var check_total_attendees = "";--%>
        <%--// click vào mua ở modal--%>
        <%--function handleBookingClass() {--%>
            <%--var classID = document.getElementById("btnShedule").value;--%>
            <%--if (check_total_attendees === "full") {--%>
                <%--Swal.fire({--%>
                    <%--title: 'Hiện tại lớp đã đủ học viên',--%>
                    <%--icon: 'success',--%>
                    <%--text: 'Vui lòng chọn lớp khác',--%>
                <%--});--%>
             <%--}--%>
             <%--else{--%>
                <%--$.ajax(--%>
                    <%--{--%>
                        <%--type: "GET",--%>
                        <%--contentType: false,--%>
                        <%--url: "/customer/BookingTicketClass/Check_ticket_exists?" + "classID=" + parseInt(classID),--%>
                        <%--success: function (result) {--%>
                            <%--if (result === 'true'){--%>
                                <%--var price_class = document.getElementById("getPriceClass").innerHTML;--%>
                                <%--// var ticketClassID = document.getElementById("getTicketClassID").innerHTML;--%>
                                <%--var ticket_id = sessionStorage.getItem("ticket_id");--%>
                                <%--var end_date_ticket = sessionStorage.getItem("end_date_ticket");--%>
                                <%--var ticket_class_id = document.getElementById("ticket_class_id").textContent;--%>
                                <%--if (ticket_id != null) {--%>
                                    <%--&lt;%&ndash;Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + ticket_id + "&end_date_ticket=" + end_date_ticket + "&price=" + price_class+ "&ticket_pt_id=" + ticket_class_id + "&end_date_ticket_personal=" + end_date_class + "&class_or_personal_id=" + ticketClassID;&ndash;%&gt;--%>
                                    <%--var token = $("meta[name='_csrf']").attr("content");--%>
                                    <%--var data = {--%>
                                        <%--"_ticket_id" : ticket_id,--%>
                                        <%--"_end_date_ticket" : end_date_ticket,--%>
                                        <%--"_ticket_pt_id" : 0,--%>
                                        <%--"_price_ticket_pt" : 0,--%>
                                        <%--"_personal_trainer_id" : 0,--%>
                                        <%--"_end_date_ticket_personal" : 0,--%>
                                        <%--"_ticket_class_id" : ticket_class_id,--%>
                                        <%--"_price_ticket_class" : price_class,--%>
                                        <%--"_class_id" : classID,--%>
                                        <%--_csrf: token};--%>
                                    <%--$.ajax({--%>
                                        <%--url: '/CustomerUser/saveTickerUser',--%>
                                        <%--type: 'post',--%>
                                        <%--data: data,--%>
                                        <%--success: function(response) {--%>
                                            <%--Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');--%>
                                        <%--},--%>
                                        <%--error: function(xhr, status, error) {--%>
                                            <%--console.log(error);--%>
                                        <%--}--%>
                                    <%--});--%>
                                    <%--sessionStorage.removeItem('ticket_id');--%>
                                    <%--sessionStorage.removeItem('end_date_ticket');--%>
                                <%--}else {--%>
                                    <%--var token = $("meta[name='_csrf']").attr("content");--%>
                                    <%--var data = {--%>
                                        <%--"_ticket_id" : 0,--%>
                                        <%--"_end_date_ticket" : 0,--%>
                                        <%--"_ticket_pt_id" : 0,--%>
                                        <%--"_price_ticket_pt" : 0,--%>
                                        <%--"_personal_trainer_id" : 0,--%>
                                        <%--"_end_date_ticket_personal" : 0,--%>
                                        <%--"_ticket_class_id" : ticket_class_id,--%>
                                        <%--"_price_ticket_class" : price_class,--%>
                                        <%--"_class_id" : classID,--%>
                                        <%--_csrf: token};--%>
                                    <%--$.ajax({--%>
                                        <%--url: '/CustomerUser/saveTickerUser',--%>
                                        <%--type: 'post',--%>
                                        <%--data: data,--%>
                                        <%--success: function(response) {--%>
                                            <%--Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');--%>
                                        <%--},--%>
                                        <%--error: function(xhr, status, error) {--%>
                                            <%--console.log(error);--%>
                                        <%--}--%>
                                    <%--});--%>
                                    <%--&lt;%&ndash;Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + 0 + "&end_date_ticket=" + 0 + "&price=" + price_class+ "&ticket_pt_id=" + ticket_class_id + "&end_date_ticket_personal=" + end_date_class + "&class_or_personal_id=" + ticketClassID;&ndash;%&gt;--%>
                                <%--}--%>
                            <%--} else {--%>
                                <%--Swal.fire('Bạn đã tham gia vào lớp này', '', 'success')--%>
                            <%--}--%>
                        <%--},--%>
                        <%--error: function () {--%>
                            <%--console.log("check");--%>
                            <%--Swal.fire('Lỗi hệ thống', '', 'warning')--%>
                        <%--}--%>
                    <%--}--%>
                <%--);--%>
            <%--}--%>


        <%--}--%>

        <%--$(document).ready(function () {--%>
            <%--$("#show-ticket-class").on('click', '.bookInTicketClass', function () {--%>
                <%--var ids = $(this).parent().siblings(".ticket_class_id").text();--%>
                <%--$.ajax(--%>
                    <%--{--%>
                        <%--type: "GET",--%>
                        <%--contentType: false,--%>
                        <%--url: "/customer/booking/checkEndDateTicket?" + "ticket_type_id=" + 3,--%>
                        <%--success: function (resultAPI) {--%>
                            <%--// lấy end date để lưu vào database--%>
                            <%--end_date_class = resultAPI;--%>
                            <%--if (resultAPI === ""){--%>
                                <%--loadDataTicketClass(ids);--%>
                            <%--}else{--%>
                                <%--Swal.fire({--%>
                                    <%--title: 'Bạn có tiếp tục tham gia vé lớp này không?',--%>
                                    <%--showDenyButton: true,--%>
                                    <%--confirmButtonText: 'Có',--%>
                                    <%--denyButtonText: 'Không',--%>
                                    <%--icon: 'question',--%>
                                    <%--text: 'Bạn đã có vé lớp',--%>
                                <%--}).then((result) => {--%>
                                    <%--if(result.isConfirmed){--%>
                                    <%--loadDataTicketClass(ids);--%>
                                <%--}else if (result.isDenied) {--%>
                                    <%--$('#classModal').modal('hide');--%>
                                    <%--var show = document.getElementById("show-class");--%>
                                    <%--show.scrollIntoView();--%>
                                <%--}--%>
                            <%--})--%>
                            <%--}--%>
                        <%--},--%>

                        <%--error: function () {--%>
                            <%--console.log("mua vé ngay");--%>
                            <%--Swal.fire('Lỗi hệ thống', '', 'warning')--%>
                        <%--}--%>
                    <%--});--%>
            <%--})--%>
        <%--});--%>

        <%--function loadDataTicketClass(ids) {--%>
            <%--$.ajax({--%>
                <%--type : "GET",--%>
                <%--// contentType: false,--%>
                <%--url: '<c:url value="/customer/BookingTicketClass?" />' + "ids=" + ids,--%>
                <%--success: function (result1) {--%>
                    <%--var start_date = document.getElementById("start_date_class");--%>
                    <%--var stop_date = document.getElementById("stop_date_class");--%>
                    <%--var name = document.getElementById("pt_class_name");--%>
                    <%--var PT = document.getElementById("PT");--%>
                    <%--var totalAttendees = document.getElementById("totalAttendees");--%>
                    <%--var time_class = document.getElementById("time");--%>
                    <%--var price = document.getElementById("classPrice");--%>

                    <%--start_date.innerHTML = "";--%>
                    <%--stop_date.innerHTML = "";--%>
                    <%--name.innerHTML = "";--%>
                    <%--totalAttendees.innerHTML = "";--%>
                    <%--time_class.innerHTML = "";--%>
                    <%--price.innerHTML = "";--%>
                    <%--PT.innerHTML = "";--%>


                    <%--var optionHLV = document.createElement("option");--%>
                    <%--optionHLV.innerText = "Chọn lớp";--%>
                    <%--optionHLV.disabled = true;--%>
                    <%--optionHLV.selected = true;--%>
                    <%--optionHLV.hidden = true;--%>
                    <%--name.appendChild(optionHLV);--%>

                    <%--result1.forEach(function(ticket_class) {--%>
                        <%--var name_trainer = document.createElement("option");--%>
                        <%--name_trainer.id = ticket_class.class_id;--%>
                        <%--name_trainer.innerText = ticket_class.c_name;--%>
                        <%--name.appendChild(name_trainer);--%>
                        <%--name.addEventListener("change", function() {--%>
                            <%--var selectedOption = this.options[this.selectedIndex];--%>
                            <%--if (selectedOption.id == ticket_class.class_id) {--%>
                                <%--start_date.innerHTML = "";--%>
                                <%--stop_date.innerHTML = "";--%>
                                <%--totalAttendees.innerHTML = "";--%>
                                <%--time_class.innerHTML = "";--%>
                                <%--price.innerHTML = "";--%>
                                <%--PT.innerHTML = "";--%>

                                <%--document.getElementById("getTicketClassID").innerText = ticket_class.c_trainer_id;--%>

                                <%--var optionHLV = document.createElement("option");--%>
                                <%--optionHLV.innerText = "Chọn lớp";--%>
                                <%--optionHLV.disabled = true;--%>
                                <%--optionHLV.selected = true;--%>
                                <%--optionHLV.hidden = true;--%>
                                <%--name.appendChild(optionHLV);--%>

                                <%--// set PT--%>
                                <%--var pt = document.createElement("input");--%>
                                <%--pt.classList = "form-control";--%>
                                <%--pt.id = "PT";--%>
                                <%--pt.readOnly = true;--%>
                                <%--pt.required = true;--%>
                                <%--// total_attendees.type = "number";--%>
                                <%--pt.value = ticket_class.c_trainer_name;--%>
                                <%--pt.style.display = "inline";--%>
                                <%--PT.appendChild(pt);--%>

                                <%--// set start date--%>
                                <%--var dateObj = new Date(ticket_class.c_start_date);--%>
                                <%--var year = dateObj.getFullYear();--%>
                                <%--var month = String(dateObj.getMonth() + 1).padStart(2, '0');--%>
                                <%--var day = String(dateObj.getDate()).padStart(2, '0');--%>
                                <%--var formattedDate = year + '-' + month + '-' + day;--%>
                                <%--start_date.value = formattedDate;--%>

                                <%--// set end date--%>
                                <%--var dateObj = new Date(ticket_class.c_end_date);--%>
                                <%--var year = dateObj.getFullYear();--%>
                                <%--var month = String(dateObj.getMonth() + 1).padStart(2, '0');--%>
                                <%--var day = String(dateObj.getDate()).padStart(2, '0');--%>
                                <%--var formattedEndDate = year + '-' + month + '-' + day;--%>
                                <%--stop_date.value = formattedEndDate;--%>

                                <%--// set số người đã tham gia--%>
                                <%--var total_attendees = document.createElement("input");--%>
                                <%--total_attendees.classList = "form-control " + ticket_class.total_attendees;--%>
                                <%--total_attendees.id = "total_attendees" + ticket_class.total_attendees;--%>
                                <%--total_attendees.readOnly = true;--%>
                                <%--total_attendees.required = true;--%>
                                <%--// total_attendees.type = "number";--%>
                                <%--total_attendees.value = ticket_class.total_attendees + "/" + ticket_class.max_member;--%>
                                <%--total_attendees.style.display = "inline";--%>
                                <%--totalAttendees.appendChild(total_attendees);--%>

                                <%--//set time--%>
                                <%--var timeClass = document.createElement("input");--%>
                                <%--timeClass.classList = "form-control " + ticket_class.class_id;--%>
                                <%--timeClass.id = "time" + ticket_class.class_id;--%>
                                <%--timeClass.readOnly = true;--%>
                                <%--timeClass.required = true;--%>
                                <%--// timeClass.type = "number";--%>
                                <%--timeClass.value = ticket_class.start_time + " - " + ticket_class.end_time;--%>
                                <%--timeClass.style.display = "inline";--%>
                                <%--time_class.appendChild(timeClass);--%>

                                <%--//set price--%>
                                <%--var class_price = document.createElement("input");--%>
                                <%--class_price.classList = "form-control " + ticket_class.class_id;--%>
                                <%--class_price.id = "trainerPrice" + ticket_class.class_id;--%>
                                <%--class_price.readOnly = true;--%>
                                <%--class_price.required = true;--%>
                                <%--class_price.type = "number";--%>
                                <%--// set value cho input để hieent thị data--%>
                                <%--class_price.value =  ticket_class.c_price;--%>
                                <%--class_price.style.display = "inline";--%>
                                <%--price.appendChild(class_price);--%>
                                <%--document.getElementById("getPriceClass").innerText = ticket_class.c_price;--%>

                                <%--//btnShedule--%>
                                <%--if (ticket_class.total_attendees === ticket_class.max_member) {--%>
                                    <%--check_total_attendees = "full";--%>
                                <%--}else {--%>
                                    <%--check_total_attendees = "notfull";--%>
                                <%--}--%>
                                <%--document.getElementById("btnShedule").value = ticket_class.class_id;--%>
                            <%--}--%>
                        <%--});--%>
                    <%--});--%>
                <%--},--%>
                <%--error: function (error) {--%>
                    <%--console.log("loadDataTicketClass");--%>
                    <%--Swal.fire('Lỗi hệ thống', '', 'warning')--%>
                    <%--console.log(error);--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>

    <%--</script>--%>
<%--</section>--%>


