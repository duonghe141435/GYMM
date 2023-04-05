<%--
  Created by IntelliJ IDEA.
  User: hieuhm
  Date: 20/02/2023
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Trang chủ</title>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
            <div class="container-fluid min-vh-100">
                <section class="py-5 bg-dark">
                    <div class="container py-4 py-xl-5">
                        <div class="row mb-5">
                            <div class="col-md-8 col-xl-6 text-center mx-auto">
                                <h2 class="display-6 fw-bold mb-4 text-light">GIÁ VÉ</h2>
                            </div>
                        </div>
                        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
                            <c:forEach items="${ticket}" var="ticket">
                                <div class="col">
                                    <div class="card border-0 h-100">
                                        <div class="card-body d-flex flex-column justify-content-between p-4">
                                            <div>
                                                    <%--<h4 class="tickett_id" style="display: none" aria-readonly="true">${ticket.t_id}</h4>--%>
                                                <h6 class="fw-bold text-muted">${ticket.t_name}</h6>
                                                <h4 class="display-5 fw-bold mb-4 price">${ticket.t_price}</h4>
                                                <ul class="list-unstyled">
                                                    <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                            viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                                            stroke-linecap="round" stroke-linejoin="round"
                                                            class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Trải nghiệm 24h</span></li>
                                                    <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                            viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                                            stroke-linecap="round" stroke-linejoin="round"
                                                            class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>HLV cá nhân</span></li>
                                                    <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                            viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                                            stroke-linecap="round" stroke-linejoin="round"
                                                            class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Tủ đồ + Phòng tắm</span></li>
                                                </ul>
                                            </div>
                                                <%--<a class="btn btn-primary" id="demo" role="button" href="<c:url value='/CustomerUser/${ticket.t_id}'/>">Book</a>--%>
                                            <a class="btn btn-primary" onclick="mess(${ticket.t_id})" id="demo" role="button">Book</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
                <section class="py-5 bg-dark hlv">
                    <div class="container py-4 py-xl-5">
                        <div class="row mb-5">
                            <div class="col-md-8 col-xl-6 text-center mx-auto">
                                <h2 class="display-6 fw-bold mb-4 text-light">HLV CHUYÊN NGHIỆP</h2>
                            </div>
                        </div>
                        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
                            <div class="col">
                                <div class="d-flex justify-content-between p-4">
                                    <div class="pb-4">
                                        <img class="img-fluid" src="/assets/img/images/hlv1.jpg">
                                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Hoàng Hiếu</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="d-flex justify-content-between p-4">
                                    <div class="pb-4">
                                        <img class="img-fluid" src="/assets/img/images/hlv2.jpg">
                                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Đức Lương</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="d-flex justify-content-between p-4">
                                    <div class="pb-4">
                                        <img class="img-fluid mx-auto" src="/assets/img/images/hlv3.jpg">
                                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Đại Dương</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
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
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
<script>
    $('.price').each(function () {
        var price = parseFloat($(this).text());
        if (!isNaN(price)) {
            $(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
    });

    function mess(id){
        console.log("id: " + id);
        <%--$.ajax({--%>
        <%--url: '<c:url value="/customer/booking/checkEndDate" />',--%>
        <%--contentType: "text"--%>
        <%--&lt;%&ndash;window.location.href = '<c:url value="/customer/booking/checkEndDate" />'&ndash;%&gt;--%>
        <%--&lt;%&ndash;url: '<c:url value="/admin/product-management/" />' + ids +"?${_csrf.parameterName}=${_csrf.token}" ,&ndash;%&gt;--%>
        <%--success: function (result) {--%>
        <%--console.log("result: " + result.responseText);--%>
        <%--// var date = result;--%>
        <%--if (result != null){--%>
        <%--Swal.fire({--%>
        <%--title: 'Bạn chắc chắn muốn mua thêm ticket này?',--%>
        <%--showDenyButton: true,--%>
        <%--confirmButtonText: 'Có',--%>
        <%--denyButtonText: 'Không',--%>
        <%--icon: 'question',--%>
        <%--text: 'Ticket cũ của bạn vẫn còn hạn',--%>

        <%--}).then((result) => {--%>
        <%--/* Read more about isConfirmed, isDenied below */--%>
        <%--if(result.isConfirmed){--%>
        <%--Swal.fire('Bạn đã book ticket thành công', '', 'success').then((result) => {--%>
        <%--if(result.isConfirmed){--%>

        <%--// console.log("end: " + date);--%>
        <%--&lt;%&ndash;window.location.href = '<c:url value="/CustomerUser/" />' + id&ndash;%&gt;--%>
        <%--}--%>
        <%--})--%>
        <%--}else if (result.isDenied) {--%>

        <%--}--%>
        <%--})--%>
        <%--}else{--%>
        <%--Swal.fire({--%>
        <%--title: 'Bạn có muốn thêm Book Ticket Trainer không?',--%>
        <%--showDenyButton: true,--%>
        <%--confirmButtonText: 'Có',--%>
        <%--denyButtonText: 'Không',--%>
        <%--icon: 'question',--%>
        <%--text: 'Bạn sẽ được chuyển sang trang Book Ticket Trainer',--%>
        <%--}).then((result) => {--%>
        <%--/* Read more about isConfirmed, isDenied below */--%>
        <%--if(result.isConfirmed){--%>

        <%--}else if (result.isDenied) {--%>
        <%--Swal.fire('Bạn đã book ticket thành công', '', 'success').then((result) => {--%>
        <%--if(result.isConfirmed){--%>
        <%--window.location.href = '<c:url value="/CustomerUser/" />' + id--%>
        <%--}--%>
        <%--})--%>
        <%--}--%>
        <%--})--%>
        <%--}--%>

        <%--},--%>
        <%--error: function (error) {--%>
        <%--Swal.fire('Lỗi hệ thống', '', 'warning')--%>
        <%--console.log(error);--%>
        <%--}--%>
        <%--});--%>

        $.ajax(
            {
                type : "GET",
                contentType: false,
                url : "/customer/booking/checkEndDate",
                success: function (resultAPI){
                    console.log("result: " + resultAPI);
                    <%--window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "id=" + id + "&date="+result;--%>
                    if (resultAPI === ""){
                        Swal.fire({
                            title: 'Bạn có muốn thêm Book Ticket Trainer không?',
                            showDenyButton: true,
                            confirmButtonText: 'Có',
                            denyButtonText: 'Không',
                            icon: 'question',
                            text: 'Bạn sẽ được chuyển sang trang Book Ticket Trainer',
                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            if(result.isConfirmed){

                        }else if (result.isDenied) {
                            Swal.fire('Bạn đã book ticket thành công', '', 'success').then((result) => {
                                if(result.isConfirmed){
                                <%--window.location.href = '<c:url value="/CustomerUser/" />' + id--%>
                                window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "id=" + id + "&date="+resultAPI;
                            }
                        })
                        }
                    })

                    }else{
                        Swal.fire({
                            title: 'Bạn chắc chắn muốn mua thêm ticket này?',
                            showDenyButton: true,
                            confirmButtonText: 'Có',
                            denyButtonText: 'Không',
                            icon: 'question',
                            text: 'Ticket cũ của bạn vẫn còn hạn',

                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            if(result.isConfirmed){
                            Swal.fire('Bạn đã book ticket thành công', '', 'success').then((result) => {
                                if(result.isConfirmed){
                                window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "id=" + id + "&date="+resultAPI;
                                // console.log("end: " + date);
                                <%--window.location.href = '<c:url value="/CustomerUser/" />' + id--%>
                            }
                        })
                        }else if (result.isDenied) {

                        }
                    })
                    }
                },

                error: function () {
                    Swal.fire('Lỗi hệ thống', '', 'warning')
                }
            }
        );



    };

</script>
</html>
