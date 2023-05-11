<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Thông tin lớp học</title>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 2px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;text-align: left;margin-top: auto;margin-bottom: auto;">Chi tiết lớp học</p>
                        <a class="btn btn-primary" href="<c:url value="/trainer/manage_class"/>" style="font-weight: 900; width: 210px;">Trở lại danh sách lớp</a>
                    </div>
                    <div class="card-body">
                        <div style="margin-right: 20%;" id="card-body">
                            <div style="text-align: center">
                                <label style="font-weight: bold; font-size: 35px; color: blue;">Bảng danh sách học viên</label>
                            </div>
                            <%--<div class="card-body">--%>

                            <%--<select id="date" name="date">--%>
                            <%--<option value="">17/4</option>--%>
                            <%--<option value="">18/4</option>--%>
                            <%--<option value="" selected>Hôm nay</option>--%>
                            <%--<option value="">20/4</option>--%>
                            <%--<option value="">21/4</option>--%>
                            <%--</select>--%>

                            <%--</div>--%>
                            <a class="btn btn-primary view-attendance-report" style="font-weight: 700; margin-left: 15px">khóa biểu tổng quát</a>
                            <a class="btn btn-primary view-list-user" style="font-weight: 700;">Danh sách học viên</a>
                        </div>
                        <c:if test="${not empty list_user_of_class}">
                            <table border="1" class="table table-responsive" id="attendance-report"  style="margin-top: 5px; display: none; margin-left: 1%; text-align: center; width: 74%;margin-bottom: 100px; float: left;">
                                <thead>
                                <tr id="head_table" style="background-color: #1fa750;">
                                    <th style="color: white">STT</th>
                                    <th style="color: white">Email</th>

                                </tr>
                                </thead>
                                <tbody id="body_table">
                                <c:forEach varStatus="index" items="${list_user_of_class}" var="list_user_of_class">
                                    <tr id="${index.count}">
                                        <td class="text-center">
                                            <count></count>
                                                <%--${index.count}--%>
                                        </td>
                                        <td style="font-size: 15px" id="email">${list_user_of_class.u_email}</td>
                                        <td style="font-size: 15px; display: none" id="user_id">${list_user_of_class.u_id}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <table border="1" class="table table-responsive" id="time_book_table"  style="margin-top: 5px; margin-left: 1%; text-align: center; width: 74%;margin-bottom: 100px; float: left;">
                                <thead>
                                <tr style="background-color: #1fa750;">
                                    <th style="color: white">STT</th>
                                    <th id="0" style="color: white">Ảnh</th>
                                    <th id="1" style="color: white">Email</th>
                                    <th id="2" style="color: white">Tên học viên</th>
                                    <th id="3" style="color: white">Giới tính</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach varStatus="index" items="${list_user_of_class}" var="list_user_of_class">
                                    <tr>
                                        <td class="text-center">
                                            <count></count>
                                                <%--${index.count}--%>
                                        </td>
                                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="${list_user_of_class.u_img}"></td>
                                        <td>${list_user_of_class.u_email}</td>
                                        <td>${list_user_of_class.u_full_name}</td>
                                        <td>
                                            <c:if test="${list_user_of_class.u_gender == 1}">Nam</c:if>
                                            <c:if test="${list_user_of_class.u_gender == 2}">Nữ</c:if>
                                        </td>
                                        <p style="display: none" id="userID${index.count}">${list_user_of_class.u_id}</p>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <h2 style="margin-left: 30%; display: none" id="text_notification">Lớp chưa có thành viên</h2>
                        <label style="font-weight: bold; font-size: 25px; color: blue; margin-left: 5%;" id="text_content_class">Thông tin lớp học</label>
                        <c:if test="${empty list_user_of_class}">

                            <script>
                                document.getElementById("text_content_class").style.marginLeft = "80%";
                                document.getElementById("text_notification").style.display = "inline";
                                $(document).ready(function () {
                                    $('.view-attendance-report').css('display', 'none');
                                    $('.view-list-user').css('display', 'none');
                                });
                            </script>
                        </c:if>
                        <label style="border: 2px solid #000; width: 24%; float: right; margin-left: 1%; margin-top: 20px; height: auto;">
                            </br>
                            <div style="margin-left: 1%;">
                                <p style="font-weight: bold; display: inline-block;">- Tên lớp:&nbsp;</p><p style="display: inline-block; color: blue;"> ${classDto.c_name}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Huấn luện viên:&nbsp;</p><p style="display: inline-block; color: blue;"> ${classDto.c_trainer_name}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Ngày bắt đầu:&nbsp;</p><p style="display: inline-block; color: blue;"> ${classDto.c_start_date}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Ngày kết thúc:&nbsp;<p style="display: inline-block; color: blue;">${classDto.c_end_date}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Số lượng thành viên tối đa:&nbsp;</p><p style="display: inline-block; color: blue;">${classDto.max_member}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Thành viên đã đăng ký:&nbsp;</p><p style="display: inline-block; color: blue;"> ${classDto.total_attendees}/${classDto.max_member}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Thời gian tập:&nbsp;<p style="display: inline-block; color: blue;">${classDto.start_time} - ${classDto.end_time}</p></br>
                                <p style="font-weight: bold; display: inline-block;">- Trạng thái lớp:&nbsp;<p style="display: inline-block; color: blue;">
                                <c:if test="${classDto.c_status == 1}"><span class="active" style="font-size: 15px;">Lớp đã bắt đầu</span></c:if>
                                <c:if test="${classDto.c_status == -1}"><span class="waiting" style="font-size: 15px;">Bị hủy</span></c:if>
                                <c:if test="${classDto.c_status == 0}"><span class="waiting" style="font-size: 15px;">Lớp chưa bắt đầu - Đang bán</span></c:if>
                            </p></br>
                                <p style="font-weight: bold; display: inline-block;">- Lịch tập:&nbsp;<p style="display: inline-block; color: blue;">
                                <c:if test="${classDto.monday == 1}"><span class="active" style="font-size: 16px !important;">monday</span> </c:if>
                                <c:if test="${classDto.tuesday == 1}"><span class="waiting" style="font-size: 16px;">, tuesday</span> </c:if>
                                <c:if test="${classDto.wednesday == 1}"><span class="waiting" style="font-size: 16px;">, wednesday</span> </c:if>
                                <c:if test="${classDto.thursday == 1}"><span class="waiting" style="font-size: 16px;">, thursday</span> </c:if>
                                <c:if test="${classDto.friday == 1}"><span class="waiting" style="font-size: 16px;">, friday</span> </c:if>
                                <c:if test="${classDto.saturday == 1}"><span class="waiting" style="font-size: 16px;">, saturday</span></c:if>
                                <c:if test="${classDto.sunday == 1}"><span class="waiting" style="font-size: 16px;">, sunday</span></c:if>
                            </p></br>
                            </div>
                        </label>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/trainer/footer.jsp" %>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var class_table = $("#card-body");
        class_table.on('click', '.view-attendance-report', function () {
            //margin-left: 1%; text-align: center; width: 74%;margin-bottom: 100px; float: left;
            document.getElementById("attendance-report").style.display = "table";
            document.getElementById("time_book_table").style.display = "none";

        });
        class_table.on('click', '.view-list-user', function () {
            document.getElementById("attendance-report").style.display = "none";
            document.getElementById("time_book_table").style.display = "table";
        });

        var jsonDetailClass = ${jsonDetailClass};
        var start_date = new Date(jsonDetailClass.c_start_date);
        var end_date = new Date(jsonDetailClass.c_end_date);

        // lấy list tr
        var trList = document.querySelectorAll("#body_table tr");

        //tính sô ngày giữa start date với end date
        // Chuyển đổi sang mili giây và tính hiệu
        var time_difference = end_date.getTime() - start_date.getTime();
        // Chuyển đổi từ mili giây sang số ngày
        var days_difference = Math.ceil(time_difference / (1000 * 3600 * 24));

        var head = document.getElementById("head_table");

        for (var i = 0; i<= days_difference; i++) {

            var dayOfWeek = start_date.getDay(); // Lấy giá trị từ 0 đến 6, 0 là Chủ nhật, 1 là Thứ hai, ..., 6 là Thứ bảy

            if (dayOfWeek === 1 && jsonDetailClass.monday === 1) {
                createElement(start_date, head, trList);
            }
            if (dayOfWeek === 2 && jsonDetailClass.tuesday === 1) {
                createElement(start_date, head, trList);
            }
            if (dayOfWeek === 3 && jsonDetailClass.wednesday === 1) {
                createElement(start_date, head, trList);
            }
            if (dayOfWeek === 4 && jsonDetailClass.thursday === 1) {
                createElement(start_date, head, trList);
            }
            if (dayOfWeek === 5 && jsonDetailClass.friday === 1) {
                createElement(start_date, head, trList);
            }
            if (dayOfWeek === 6 && jsonDetailClass.saturday === 1) {
                createElement(start_date, head, trList);
            }
            if (dayOfWeek === 0 && jsonDetailClass.sunday === 1) {
                createElement(start_date, head, trList);
            }
            start_date.setDate(start_date.getDate() + 1);
        }
    });

    function createElement(start_date, head, trList) {
        //chuyển date từ 2023-05-01 sang 01-05-2023
        var yearr = start_date.getFullYear();
        var monthh = String(start_date.getMonth() + 1).padStart(2, "0");
        var dayy = String(start_date.getDate()).padStart(2, "0");
        var formatted_date = dayy + "-" + monthh;

        //create thẻ th
        var day = document.createElement("th");
        day.textContent = formatted_date;
        day.style.fontSize = "10px";
        day.style.color = "white" ;
        head.appendChild(day);

        var jsonListAttendance = ${jsonListAttendance};


        trList.forEach(function(tr) {
            //create thẻ td và set text '-'
            var status = document.createElement("td");
            status.innerText = "-";
            status.style.color = "black";

            var td = tr.querySelector("td#user_id");
            if (td) {
                var user_id = td.textContent;

                for (var k = 0; k < jsonListAttendance.length; k++) {
                    var attendance_date = new Date(jsonListAttendance[k].attendance_date);
                    if (user_id === jsonListAttendance[k].user_id + "" && start_date.getTime() === attendance_date.getTime()){
                        if (jsonListAttendance[k].status === 0) {
                            status.innerText = "A";
                            status.style.fontSize = "13px";
                            status.style.color = "green";
                        }
                        if (jsonListAttendance[k].status === 1) {
                            status.innerText = "P";
                            status.style.fontSize = "13px";
                            status.style.color = "red";
                        }
                    }
                }
            }

            tr.appendChild(status);
            // var td = tr.querySelector("td#email");
            // if (td) {
            //     var email = td.textContent;
            //     console.log(email);
            // }

        });
    }
</script>
</html>
