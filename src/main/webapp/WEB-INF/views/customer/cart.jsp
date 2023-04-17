<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/12/2023
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <div class="container-fluid min-vh-100" style="padding-top: 100px" id="container_fluid">
                <div class="container-fostrap">
                    <div>
                        <h1 class="heading" id="heading">
                            Danh sách vé
                        </h1>
                    </div>
                    <div class="content">
                        <div class="container">
                            <div class="row">
                                <h3 style="display: none" id="title_cart_empty">Giỏ hàng hiện tại của bạn đang trống</h3>
                                <c:forEach items="${allTicketOfUser}" var="allTicketOfUser">
                                    <div class="col-xs-12 col-sm-4" id="form_class">
                                        <div class="card${allTicketOfUser.t_u_ID}" id="card${allTicketOfUser.t_u_ID}">
                                            <a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">
                                                <img src="https://1.bp.blogspot.com/-Bii3S69BdjQ/VtdOpIi4aoI/AAAAAAAABlk/F0z23Yr59f0/s640/cover.jpg" />
                                            </a>
                                            <div class="card-content">
                                                <h4 class="card-title">
                                                    <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> ${allTicketOfUser.name}</a>
                                                </h4>
                                                <p class="">
                                                <c:set var="create_date" value="${allTicketOfUser.create_date}" />
                                                <c:set var="start_date" value="${allTicketOfUser.start_date}" />
                                                <c:set var="end_date" value="${allTicketOfUser.end_date}" />
                                                <%
                                                    LocalDateTime create_date = (LocalDateTime) pageContext.getAttribute("create_date");
                                                    LocalDateTime start_date = (LocalDateTime) pageContext.getAttribute("start_date");
                                                    LocalDateTime end_date = (LocalDateTime) pageContext.getAttribute("end_date");
                                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                    String formattedDate = create_date.format(formatter);
                                                    String formattedStartDate = start_date.format(formatter);
                                                    String formattedEndDate = end_date.format(formatter);

                                                %>

                                                <p style="margin-top: 1px">- Ngày thêm: <%=formattedDate%></p>
                                                <p style="margin-top: 1px">- Ngày bắt đầu: <%=formattedStartDate%></p>
                                                <p style="margin-top: 1px">- Ngày kết thúc: <%=formattedEndDate%></p>

                                                    <%--<fmt:formatDate value="${allTicketOfUser.create_date}" pattern="yyyy-MM-dd"></fmt:formatDate>--%>
                                                    <%--- Ngày thêm: <fmt:parseDate value="${allTicketOfUser.create_date}" pattern="yyyy-MM-dd"/><br/>--%>

                                                    <%--- Ngày thêm: <fmt:formatDate value="${allTicketOfUser.create_date}" pattern="dd/MM/yyyy HH:mm:ss" /><br/>--%>
                                                    - Trạng thái thanh toán: ${allTicketOfUser.payment_Status} <br/>
                                                    - Giá vé:
                                                <p class="display-7 fw-bold mb-4 price" title="test">${allTicketOfUser.value_Cost}</p>
                                                </p>
                                            </div>
                                            <div class="card-read-more">
                                                <a class="btn btn-link btn-block" onclick="deleteTicket(${allTicketOfUser.t_u_ID})">
                                                    Xóa vé
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                    <div>
                        <button style="background: #20c9a6;border-color: #d8d8da; width: 330px; margin-left: 20px; margin-right: 20px; margin-top: 10px;"
                                class="btn btn-primary btn-block mt-5" id="payment" onclick="payment()">
                            Thanh Toán
                        </button>
                    </div>
                    <c:if test="${empty allTicketOfUser}">
                        <script>
                            document.getElementById("payment").disabled = true;
                            document.getElementById("title_cart_empty").style.display = "inline";
                            document.getElementById("heading").style.marginLeft = "100%";
                            document.getElementById("heading").style.width = "80%";

                            document.getElementById("title_cart_empty").style.marginLeft = "90%";
                            document.getElementById("payment").style.marginLeft = "110%";

                        </script>
                    </c:if>
                    <c:if test="${allTicketOfUser.size() == 1}">
                        <script>
                            document.getElementById("form_class").style.width = "500px";
                            document.getElementById("form_class").style.marginLeft = "450px";
                            document.getElementById("payment").style.marginLeft = "50%";
                            document.getElementById("heading").style.marginLeft = "50%";
                            document.getElementById("container_fluid").style.padding = "1%";
                        </script>
                    </c:if>
                    <c:if test="${allTicketOfUser.size() == 2}">
                        <script>
                            document.getElementById("form_class").style.width = "370px";
                            document.getElementById("form_class").style.marginLeft = "350px";
                            document.getElementById("payment").style.marginLeft = "20%";
                            document.getElementById("heading").style.marginLeft = "20%";
                            document.getElementById("container_fluid").style.padding = "1%";
                            <%--<c:forEach items="${allTicketOfUser}" var="allTicketOfUser">--%>
                            <%--document.getElementById("card${allTicketOfUser.t_u_ID}").style.width = "400px";--%>
                            <%--document.getElementById("card${allTicketOfUser.t_u_ID}").style.marginLeft = "220px";--%>
                            <%--</c:forEach>--%>

                            <%--card${allTicketOfUser.t_u_ID}--%>
                        </script>
                    </c:if>
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
    var prices = document.querySelectorAll('.price');
    var total_price = 0;
    prices.forEach(price => {
        var valueCost = price.innerHTML;
        var cost = parseFloat(valueCost);
        total_price += cost;
    });


    function deleteTicket(ticketUserID) {
        // var row = $(this).closest("cart" + ticketUserID);
        var token = $("meta[name='_csrf']").attr("content");
        var data = {'_ticketUserID' : ticketUserID, _csrf: token};
        $.ajax({
            url: '/customer/booking/delete',
            type: 'post',
            data: data,
            success: function(response) {
                Swal.fire('Bạn đã xóa ticket thành công', '', 'success').then((result) => {
                    if(result.isConfirmed){
                    location.reload();
                    }
            })
                // row.remove();
                <%--${'#'+ticketUserID}.remove();--%>
                // var ticketList = document.querySelectorAll('.row');
                // ticketList.forEach(ticket => {
                // if (ticket === ticketUserID) {
                //     // Xóa phần tử khỏi DOM
                //     ticket.remove();
                // }

            // });
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }
    function payment(){
        $.ajax({
            url: '/customer/BookingTicketClass/check_user_class', // Địa chỉ URL của controller
            type: 'GET', // Phương thức HTTP
            success: function(data, textStatus, xhr) {
                if (xhr.status === 200) {
                    //nếu không có class nào đã full thành viên
                    if (data.length === 0) {
                        $.ajax({
                            url: '/homepage/create-payment?' + "amount=" + total_price, // Địa chỉ URL của controller
                            type: 'get', // Phương thức HTTP
                            success: function(response) { // Xử lý kết quả trả về từ controller
                                console.log(response);
                                window.location.href = response;
                            },
                            error: function(xhr, status, error) { // Xử lý lỗi (nếu có)
                                console.log(error);
                            }
                        });
                    } else {
                        //có class đã full thành viên
                        Swal.fire('Lớp đã đầy, vui lòng chọn lớp khác', 'vé class này sẽ xóa khỏi giỏ hàng', 'success').then((result) => {
                            if(result.isConfirmed){
                                data.forEach(function(ticket_user) {
                                    var token = $("meta[name='_csrf']").attr("content");
                                    var data = {'_ticketUserID' : ticket_user.ticket_user_id, _csrf: token};
                                    $.ajax({
                                        url: '/customer/booking/delete',
                                        type: 'post',
                                        data: data,
                                        success: function(response) {
                                        },
                                        error: function(xhr, status, error) {
                                            console.log(error);
                                        }
                                    });
                                });
                                location.reload();
                            }
                        })
                    }
                }
            },

            error: function(xhr, status, error) { // Xử lý lỗi (nếu có)
                console.log(error);
            }
        });


    }
</script>
<script>
    $('.price').each(function () {
        var price = parseFloat($(this).text());
        if (!isNaN(price)) {
            $(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
    });

</script>
</html>
