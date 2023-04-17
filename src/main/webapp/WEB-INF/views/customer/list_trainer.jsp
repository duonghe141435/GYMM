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
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 100px">
                <%--<%@include file="/WEB-INF/views/customer/list_ticket.jsp" %>--%>
                <%--&lt;%&ndash;<%@include file="/WEB-INF/views/customer/list_trainer.jsp" %>&ndash;%&gt;--%>
                <%--<%@include file="/WEB-INF/views/customer/list_personal.jsp" %>--%>
                <%--<%@include file="/WEB-INF/views/customer/list_class.jsp" %>--%>
                    <div class="container-fostrap" >
                        <div>
                            <h1 class="heading">
                                Huấn Luyện Viên
                            </h1>
                        </div>
                        <div class="content">
                            <div class="container">
                                <div class="row">
                                    <c:forEach items="${trainers}" var="trainers">

                                        <div class="col-xs-12 col-sm-4">
                                            <div class="card">
                                                <a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">
                                                    <img src="${trainers.u_img}" />
                                                </a>
                                                <div class="card-content">
                                                    <h4 class="card-title">
                                                        <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> ${trainers.u_full_name}</a>
                                                    </h4>
                                                    <p class="">
                                                        - Email: ${trainers.u_email} <br/>
                                                        - Phone: ${trainers.u_phone_number} <br/>
                                                        <c:if test="${trainers.u_gender  == 1}">
                                                            - gender: Pt Nam <br/>
                                                        </c:if>
                                                        <c:if test="${trainers.u_gender == 2}">
                                                            - gender: Pt Nữ <br/>
                                                        </c:if>
                                                        - Address: ${trainers.u_address} <br/>
                                                        - DOB: ${trainers.u_dob} <br/>
                                                        - Năm kinh nghiệm:  <br/>
                                                    </p>
                                                </div>
                                                <div class="card-read-more">
                                                    <a class="btn btn-link btn-block">
                                                        Read More
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
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
</html>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<section class="wrapper">--%>
    <%--<div class="container-fostrap" >--%>
        <%--<div>--%>
            <%--<h1 class="heading">--%>
                <%--Huấn Luyện Viên--%>
            <%--</h1>--%>
        <%--</div>--%>
        <%--<div class="content">--%>
            <%--<div class="container">--%>
                <%--<div class="row">--%>
                    <%--<c:forEach items="${trainers}" var="trainers">--%>

                            <%--<div class="col-xs-12 col-sm-4">--%>
                                <%--<div class="card">--%>
                                    <%--<a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">--%>
                                        <%--<img src="${trainers.u_img}" />--%>
                                    <%--</a>--%>
                                    <%--<div class="card-content">--%>
                                        <%--<h4 class="card-title">--%>
                                            <%--<a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> ${trainers.u_full_name}</a>--%>
                                        <%--</h4>--%>
                                        <%--<p class="">--%>
                                            <%--- Email: ${trainers.u_email} <br/>--%>
                                            <%--- Phone: ${trainers.u_phone_number} <br/>--%>
                                            <%--<c:if test="${trainers.u_gender  == 1}">--%>
                                                <%--- gender: Pt Nam <br/>--%>
                                            <%--</c:if>--%>
                                            <%--<c:if test="${trainers.u_gender == 2}">--%>
                                                <%--- gender: Pt Nữ <br/>--%>
                                            <%--</c:if>--%>
                                            <%--- Address: ${trainers.u_address} <br/>--%>
                                            <%--- DOB: ${trainers.u_dob} <br/>--%>
                                            <%--- Năm kinh nghiệm:  <br/>--%>
                                        <%--</p>--%>
                                    <%--</div>--%>
                                    <%--<div class="card-read-more">--%>
                                        <%--<a class="btn btn-link btn-block">--%>
                                            <%--Read More--%>
                                        <%--</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>

                    <%--</c:forEach>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>
