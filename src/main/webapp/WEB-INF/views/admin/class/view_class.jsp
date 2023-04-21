<%--
  Created by IntelliJ IDEA.
  User: Duong
  Date: 20-04-2023
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Xem chi tiết lớp học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>

        th{
            background-color:#f0fcfc !important;
        }
        select{
            box-shadow: 1px 3px;
        }



    </style>
</head>
<body>
<div style="margin-left: 22%;">
    <div>
        <label style="font-weight: bold; font-size: 35px; color: blue;">Bảng điểm danh của lớp</label>
    </div>
</div>

<table border="1" class="table table-responsive" id="time_book_table"  style=" margin-left: 1%; text-align: center; width: 74%;margin-bottom: 100px; float: left;">
    <thead>
    <tr>
        <th>STT</th>
        <th id="0">Ảnh</th>
        <th id="1">Email học viên</th>
        <th id="2">Tên học viên</th>
        <th id="3">Thứ hai</th>
        <th id="4">Thứ ba</th>
        <th id="5">Thứ tư</th>
        <th id="6">Thứ năm</th>
        <th id="7">Thứ sáu</th>
        <th id="8">Thứ bảy</th>
        <th id="9">Chủ nhật</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list_user_of_class}" var="list_user_of_class">
        <tr>
            <td><count></count></td>
            <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="${list_user_of_class.u_img}"></td>
            <td>${list_user_of_class.u_email}</td>
            <td>${list_user_of_class.u_full_name}</td>
            <td></td>
            <td>Vắng</td>
            <td>Vắng</td>
            <td>Có mặt</td>
            <td>Có mặt</td>
            <td>Vắng</td>
            <td>Có mặt</td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<label style="font-weight: bold; font-size: 25px; color: blue; margin-left: 5%;">Thông tin lớp học</label>
<label style="border: 2px solid #000; width: 22%; float: right; margin-right: 1%; margin-top: 20px;">
    </br>
    <c:forEach items="${detail_class}" var="detail_class">
        <div style="margin-left: 1%;">
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Tên lớp:&nbsp;</p><p style="display: inline-block; color: blue; font-size: 20px;"> ${detail_class.c_name}</p></br>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Huấn luện viên:&nbsp;&nbsp;&nbsp;</p><p style="font-size: 20px;display: inline-block; color: blue;"> ${detail_class.c_trainer_name}</p></br>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Ngày bắt đầu:&nbsp;&nbsp;&nbsp;</p><p style="font-size: 20px;display: inline-block; color: blue;"> ${detail_class.c_start_date}</p></br>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Ngày kết thúc:&nbsp;&nbsp;&nbsp;<p style="font-size: 20px;display: inline-block; color: blue;">${detail_class.c_end_date}</p></br>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Số lượng thành viên tối đa:&nbsp;&nbsp;&nbsp;</p><p style="font-size: 20px;display: inline-block; color: blue;"> ${detail_class.max_member}</p></br>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Thành viên đã đăng ký:&nbsp;&nbsp;&nbsp;</p><p style="font-size: 20px;display: inline-block; color: blue;"> ${detail_class.total_attendees}/${detail_class.max_member}</p>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Thời gian tập:&nbsp;&nbsp;&nbsp;</p><p style="font-size: 20px;display: inline-block; color: blue;"> ${detail_class.start_time} đến ${detail_class.end_time}</p></br>
            <p style="font-size: 20px;font-weight: bold; display: inline-block;">- Trạng thái lớp:&nbsp;&nbsp;&nbsp;</p><p style="font-size: 20px;display: inline-block; color: blue;">
            <c:if test="${detail_class.c_status == 1}">Đang bán</c:if>
            <c:if test="${detail_class.c_status == -1}">Hết hạn</c:if>
            <c:if test="${detail_class.c_status == 0}">Bị hủy</c:if>
        </p></br>
        </div>
    </c:forEach>
</label>
</body>
</html>
