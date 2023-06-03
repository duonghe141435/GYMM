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
                                        <h5 class="display-7 fw-bold mb-4">Giá vé: <span class="price">${tickets.t_price}</span></h5>
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
    function mess(id){
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
};

    </script>
</section>