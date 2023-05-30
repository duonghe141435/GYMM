<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/5/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .row {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .row > * {
        flex: 0 0 auto;
    }
</style>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                Danh sách vé
            </h1>
        </div>
        <div class="content">
            <div class="container">
                <div class="row">
                    <c:forEach items="${tickets}" var="tickets">
                        <c:if test="${tickets.tt_id == 1}">
                            <div class="col-xs-12 col-sm-4">
                                <div class="card">
                                    <a class="img-card">
                                        <c:set var="randomNumber">
                                            <c:out value="<%= (int)(Math.random() * 3) + 1 %>" />
                                        </c:set>
                                        <img src="/assets/img/ticket/${randomNumber}.jpg"/>
                                    </a>
                                    <div class="card-content">
                                        <h4 class="card-title">
                                            <a> ${tickets.t_name}</a>
                                        </h4>
                                        <p class="">
                                            - Số người đã tham gia: <br/>
                                            - loại vé: vé tập và sử dụng phòng GYM <br/>
                                            - Thời gian sử dụng: ${tickets.t_total_days} Ngày<br/>
                                        <h5 class="display-7 fw-bold mb-4 price">- Giá vé: ${tickets.t_price}</h5>
                                        </p>
                                    </div>
                                    <div class="card-read-more">
                                        <a class="btn btn-link btn-block" onclick="mess(${tickets.t_id})">
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
    <script>
        // $('.price').each(function () {
        //     var price = parseFloat($(this).text());
        //     if (!isNaN(price)) {
        //         $(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
        // });

        function mess(id){
            console.log("id: " + id);
            $.ajax(
                {
                    type : "GET",
                    contentType: false,
                    url : "/customer/booking/checkEndDateTicket?" + "ticket_type_id=" + 1,
                    success: function (resultAPI){
                        console.log("result: " + resultAPI);
                        <%--window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "id=" + id + "&date="+result;--%>
                        if (resultAPI === ""){
                            Swal.fire({
                                title: 'Bạn có muốn mua thêm vé tập với PT hoặc vé lớp không?',
                                showDenyButton: true,
                                confirmButtonText: 'Có',
                                denyButtonText: 'Không',
                                icon: 'question',
                                text: 'Bạn sẽ được chuyển đến vé tập với PT',
                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if(result.isConfirmed){
                                // lưu ticket_id vào session
                                sessionStorage.setItem("ticket_id", id);
                                sessionStorage.setItem("end_date_ticket", resultAPI);
                                window.location.href='<c:url value="/customer/list-personal"/>';
                                // var show = document.getElementById("shows");
                                // show.scrollIntoView();
                            }else if (result.isDenied) {
                                    var token = $("meta[name='_csrf']").attr("content");
                                    var data = {
                                        "_ticket_id" : id,
                                        "_end_date_ticket" : resultAPI,
                                        "_ticket_pt_id" : 0,
                                        "_price_ticket_pt" : 0,
                                        "_personal_trainer_id" : 0,
                                        "_end_date_ticket_personal" : 0,
                                        "_ticket_class_id" : 0,
                                        "_price_ticket_class" : 0,
                                        "_class_id" : 0,
                                        _csrf: token};
                                    $.ajax({
                                    url: '/CustomerUser/saveTickerUser',
                                    type: 'post',
                                    data: data,
                                    success: function(response) {
                                        Swal.fire('Bạn đã thêm vé vào giỏ thành công', '', 'success');
                                        console.log(response);
                                    },
                                    error: function(xhr, status, error) {
                                        console.log(error);
                                    }
                                });
                                <%--Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success').then((result) => {--%>
                                    <%--if(result.isConfirmed){--%>
                                    <%--&lt;%&ndash;window.location.href = '<c:url value="/CustomerUser/" />' + id&ndash;%&gt;--%>
                                    <%--window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + id + "&end_date_ticket="+resultAPI + "&price=" + 0 + "&ticket_pt_id=" + 0 + "&end_date_ticket_personal=" + 0 + "&class_or_personal_id=" + 0;--%>
                                <%--}--%>
                            <%--})--%>
                            }
                        })
                        }else{
                            Swal.fire({
                                title: 'Bạn có tiếp tục mua thêm vé này?',
                                showDenyButton: true,
                                confirmButtonText: 'Có',
                                denyButtonText: 'Không',
                                icon: 'question',
                                text: 'Vé cũ của bạn vẫn còn hạn',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if(result.isConfirmed){
                                Swal.fire({title: 'Bạn có muốn mua thêm vé tập với PT hoặc vé lớp không?', text: 'Bạn sẽ được chuyển đến vé tập với PT ',
                                    showDenyButton: true, showConfirmButton: true, confirmButtonText: 'Có',
                                    denyButtonText: 'Không', icon: 'question'}).then((result) => {
                                    if(result.isConfirmed){
                                    // lưu ticket_id vào session
                                    sessionStorage.setItem("ticket_id", id);
                                    sessionStorage.setItem("end_date_ticket", resultAPI);
                                    // var show = document.getElementById("shows");
                                    // show.scrollIntoView()
                                    window.location.href='<c:url value="/customer/list-personal"/>';
                                }else if (result.isDenied) {
                                    var token = $("meta[name='_csrf']").attr("content");
                                    var data = {
                                        "_ticket_id" : id,
                                        "_end_date_ticket" : resultAPI,
                                        "_ticket_pt_id" : 0,
                                        "_price_ticket_pt" : 0,
                                        "_personal_trainer_id" : 0,
                                        "_end_date_ticket_personal" : 0,
                                        "_ticket_class_id" : 0,
                                        "_price_ticket_class" : 0,
                                        "_class_id" : 0,
                                        _csrf: token};
                                    $.ajax({
                                        url: '/CustomerUser/saveTickerUser',
                                        type: 'post',
                                        data: data,
                                        success: function(response) {
                                            Swal.fire('Bạn đã thêm vé vào giỏ thành công', '', 'success');
                                            console.log(response);
                                        },
                                        error: function(xhr, status, error) {
                                            console.log(error);
                                        }
                                    });
                                    <%--Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success').then((result) => {--%>
                                        <%--if(result.isConfirmed){--%>
                                        <%--&lt;%&ndash;window.location.href = '<c:url value="/CustomerUser/" />' + id&ndash;%&gt;--%>
                                        <%--window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + id + "&end_date_ticket="+resultAPI + "&price=" + 0 + "&ticket_pt_id=" + 0 + "&end_date_ticket_personal=" + 0 + "&class_or_personal_id=" + 0;--%>
                                    <%--}--%>
                                <%--})--%>
                                }

                                <%--Swal.fire('Bạn đã book ticket thành công', '', 'success').then((result) => {--%>
                                <%--if(result.isConfirmed){--%>
                                <%--window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "id=" + id + "&date="+resultAPI;--%>
                                <%--}--%>
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
        };

    </script>
</section>