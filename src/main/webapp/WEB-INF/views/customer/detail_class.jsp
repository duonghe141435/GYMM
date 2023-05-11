<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/19/2023
  Time: 6:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title></title>
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
        .bold{
            font-weight: bold;
            font-size:20px;
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

                            <div class="right">
                                <div class="text-nowrap">
                                    <div class="card-body" style="padding-top: 0;">
                                        <div class="card-body" style="padding-top: 0;">
                                            <c:if test="${not empty detailClassOfCustomer}">
                                                <div class="table-responsive table mt-2" role="grid" style="max-height: 62vh;" >
                                                    <table class="table my-0" style="border: 1px">
                                                        <thead>
                                                        <tr>
                                                            <th class="text-left">
                                                        <tr>
                                                            <th class="text-center"></th>
                                                            <th class="text-center"></th>

                                                        </tr>
                                                        </th>
                                                            <%--<th class="text-center"></th>--%>

                                                        </tr>
                                                        </thead>
                                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                                        <%--<c:forEach items="${detail_class}" var="detail_class">--%>

                                                            <%--<table style="width: 800px; height: 400px">--%>
                                                            <%--<tbody>--%>
                                                            <%--<tr style="border-bottom: 0 none">--%>
                                                            <%--<td>--%>
                                                            <%--<div>--%>
                                                            <%--<h2>.............</h2>--%>
                                                            <%--<center style="text-align: -webkit-center">--%>
                                                            <%--<div >--%>
                                                            <%--<table style="font-size: 23px;width: 800px; border-bottom: 0 none">--%>
                                                            <%--<tbody>--%>
                                                            <%--<tr align="left" >--%>
                                                            <%--<td>Tên lớp: </td>--%>
                                                            <%--<td style="">${detail_class.c_name}</td>--%>
                                                            <%--</tr>--%>
                                                            <%--<tr align="left">--%>
                                                            <%--<td>Tên PT: </td>--%>
                                                            <%--<td>${detail_class.c_trainer_name} </td>--%>
                                                            <%--</tr>--%>
                                                            <%--<tr align="left">--%>
                                                            <%--<td>Giá thuê:</td>--%>
                                                            <%--<td class="class-price">${detail_class.c_price}</td>--%>
                                                            <%--</tr>--%>
                                                            <%--</tbody>--%>
                                                            <%--</table>--%>
                                                            <%--</div>--%>
                                                            <%--</center>--%>
                                                            <%--</div>--%>
                                                            <%--</td>--%>
                                                            <%--</tr>--%>
                                                            <%--</tbody>--%>
                                                            <%--</table>--%>
                                                            <tr>
                                                                <td class="text-left" >
                                                                    <p class="bold">- Tên lớp: <p/>
                                                                    <p class="bold">- Tên PT: <p/>
                                                                    <p class="bold">- Giá thuê: <br/>
                                                                    <p class="bold">- thời Hạn: <br/>
                                                                    <p class="bold">- Trạng thái lớp: <br/>
                                                                    <p class="bold">- Thời gian: <br/>
                                                                    <p class="bold">- Số thành viên lớp: <br/>
                                                                    <p class="bold">- Lịch tập: <br/>

                                                                </td>
                                                                    <%--<td class="text-center class-price">--%>
                                                                    <%--${classDtos.c_price}--%>
                                                                    <%--</td>--%>

                                                                <td class="text-left">
                                                                    <p style="font-size:20px;">${detailClassOfCustomer.c_name} <p/>
                                                                    <p style="font-size:20px;">${detailClassOfCustomer.c_trainer_name}<p/>
                                                                    <p class="text-left class-price" style="font-size:20px;">
                                                                            ${detailClassOfCustomer.c_price}
                                                                    </p>
                                                                    <p style="font-size:20px;">${detailClassOfCustomer.c_start_date} - ${detailClassOfCustomer.c_end_date}</p>
                                                                    <p class="status text-left" style="font-size: 20px">
                                                                        <c:if test="${detailClassOfCustomer.c_status == 1}"><span class="active" style="font-size: 20px;">Lớp đã bắt đầu</span></c:if>
                                                                        <c:if test="${detailClassOfCustomer.c_status == -1}"><span class="waiting" style="font-size: 20px;">Bị hủy</span></c:if>
                                                                        <c:if test="${detailClassOfCustomer.c_status == 0}"><span class="waiting" style="font-size: 20px;">Lớp chưa bắt đầu - Đang bán / còn hạn</span></c:if>
                                                                    </p>
                                                                    <p style="font-size:20px;">${detailClassOfCustomer.start_time} - ${detailClassOfCustomer.end_time}</p>
                                                                    <p style="font-size:20px;">${detailClassOfCustomer.total_attendees} / ${detailClassOfCustomer.max_member}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="showListCustomer(${detailClassOfCustomer.class_id})">Danh sách lớp</button></p>
                                                                    <p class="status text-left">
                                                                        <c:if test="${detailClassOfCustomer.monday == 1}"><span class="active" style="font-size: 20px !important;">monday</span></c:if>
                                                                        <c:if test="${detailClassOfCustomer.tuesday == 1}"><span class="waiting" style="font-size: 20px;">, tuesday</span> </c:if>
                                                                        <c:if test="${detailClassOfCustomer.wednesday == 1}"><span class="waiting" style="font-size: 20px;">, wednesday</span> </c:if>
                                                                        <c:if test="${detailClassOfCustomer.thursday == 1}"><span class="waiting" style="font-size: 20px;">, thursday</span> </c:if>
                                                                        <c:if test="${detailClassOfCustomer.friday == 1}"><span class="waiting" style="font-size: 20px;">, friday</span> </c:if>
                                                                        <c:if test="${detailClassOfCustomer.saturday == 1}"><span class="waiting" style="font-size: 20px;">, saturday</span></c:if>
                                                                        <c:if test="${detailClassOfCustomer.sunday == 1}"><span class="waiting" style="font-size: 20px;">sunday</span></c:if>
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                        <%--</c:forEach>--%>
                                                        </tbody>
                                                    </table>
                                                </div>
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

    function showListCustomer(classID) {
        window.location.href = '<c:url value="/customer/show_list_customer?" />' + "class_id=" + classID;

    }
</script>
</html>
