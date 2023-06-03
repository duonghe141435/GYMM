<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Tập với Huấn luyện viên</title>
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
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/guest/header.jsp" %>
            <div class="container min-vh-100" style="padding-top: 60px">
                <div class="container-fostrap">
                    <div>
                        <h1 class="heading">
                            Tập với PT
                        </h1>
                    </div>
                    <div class="content ">
                        <div class="container">
                            <div id="show-ticket-trainer">
                                <div class="row" id="shows">
                                    <c:forEach items="${tickets}" var="tickets">
                                        <c:if test="${tickets.tt_id == 2}">
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="card" id="open_modal">
                                                    <h4 class="ticketsPersonal_id" style="display: none" aria-readonly="true">${tickets.t_id}</h4>
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
                                                            - loại vé <br/>
                                                            - Thời gian sử dụng: ${tickets.t_total_days} Ngày<br/>
                                                            <c:forEach items="${allTicketTrainer}" var="allTicketTrainer">
                                                            <c:if test="${(tickets.t_id) == (allTicketTrainer.ticket_id)}">
                                                        <td class="text-center">- Giá vé: <span class="class-price">${allTicketTrainer.t_price_min}</span> - <span class="class-price">${allTicketTrainer.t_price_max}</span></td><br/>
                                                        </c:if>
                                                        </c:forEach>
                                                        - Có hỗ trợ huấn luyện viên cá nhân <br/>
                                                        </p>
                                                    </div>

                                                    <div class="card-read-more">
                                                        <a onclick="handleOpenModal(this)" class="btn btn-link btn-block bookInTicketPersonal">
                                                        Mua vé ngay
                                                        </a>
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
        <%@include file="/WEB-INF/views/layouts/customer/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>
    // click "Mua vé ngay"
    function handleOpenModal(event) {
        $(document).ready(function () {
            const Toast = Swal.mixin({
                toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }});

            Swal.fire({
                title: 'Bạn cần đăng nhập để mua vé?',
                showDenyButton: true,
                confirmButtonText: 'Có',
                denyButtonText: 'Không',
                icon: 'question',
                text: 'Bạn có muốn chuyển đến trang đăng nhập không?',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if(result.isConfirmed) {
                    Toast.fire({icon: 'info', title: 'Chuyển hướng sang trang Đăng nhập!'});
                    window.location.href = '<c:url value="/login"/>';
                }
            })
        })
    }
</script>
</html>
