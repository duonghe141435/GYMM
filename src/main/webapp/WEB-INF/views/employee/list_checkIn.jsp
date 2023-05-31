<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 5/9/2023
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><dec:title default="Master-Layout" />Danh sách CheckIn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        th{
            background-color:#f0fcfc !important;
        }
        select{
            box-shadow: 1px 3px;
        }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        button {
            margin-bottom: 2%;
        }

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
            <%@include file="/WEB-INF/views/layouts/employee/header.jsp" %>
            <div class="container-fluid min-vh-100">
                <div class="card shadow">
                    <div style="margin-left: 13%;">
                        <div style="margin-left: 32%">
                            <label style="font-weight: bold; font-size: 35px; color: blue;">Danh sách CheckIn</label>
                        </div>
                    </div>
                    <c:if test="${not empty allCheckIn}">
                        <table border="1" class="table table-responsive " id="class_table"  style="margin-top: 14px; margin-left: 13%; text-align: center; width: 74%;">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th id="0">Ảnh</th>
                                <th id="1">Email</th>
                                <th id="2">Tên học viên</th>
                                <th id="3">Giới tính</th>
                                <th id="4">Thời gian</th>
                                <th id="5">Trạng thái</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach varStatus="index" items="${allCheckIn}" var="allCheckIn">
                                    <tr>
                                        <td class="text-center">
                                            <count></count>
                                                <%--${index.count}--%>
                                        </td>
                                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="${allCheckIn.u_img}"></td>
                                        <td>${allCheckIn.u_email}</td>
                                        <td>${allCheckIn.u_full_name}</td>
                                        <td>
                                            <c:if test="${allCheckIn.u_gender == 1}">Nam</c:if>
                                            <c:if test="${allCheckIn.u_gender == 2}">Nữ</c:if>
                                        </td>
                                        <td>${allCheckIn.current_time}</td>
                                        <td>
                                            <c:if test="${allCheckIn.status == 1}"><p style="color: green">Check in thành công</p></c:if>
                                            <c:if test="${allCheckIn.status == -1}"><p style="color: red">Hội viên chưa có vé</p></c:if>
                                            <c:if test="${allCheckIn.status == 0}"><p style="color: red">vé hết hạn - vé không hợp lệ</p></c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty allCheckIn}">
                        <h3 style="margin-top: 5%; text-align: center">Hôm nay chưa có hội viên CheckIn</h3>
                    </c:if>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <%@include file="/WEB-INF/views/layouts/employee/footer.jsp" %>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>
</script>
</html>