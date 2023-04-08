<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                Lớp học
            </h1>
        </div>
        <div class="content">
            <div class="container">
                <div class="row">

                    <c:forEach items="${tickets}" var="tickets">
                        <c:if test="${tickets.tt_id == 3}">
                            <div class="col-xs-12 col-sm-4">
                                <div class="card">
                                    <a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">
                                        <img src="https://1.bp.blogspot.com/-Bii3S69BdjQ/VtdOpIi4aoI/AAAAAAAABlk/F0z23Yr59f0/s640/cover.jpg" />
                                    </a>
                                    <div class="card-content">
                                        <h4 class="card-title">
                                            <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> ${tickets.t_name}</a>
                                        </h4>
                                        <p class="">
                                            - Số người tham đã tham gia: <br/>
                                            - loại vé: Vé tập với lớp <br/>
                                            - Thời gian sử dụng: ${tickets.t_total_days} Ngày <br/>
                                            - Giá vé : 10.000₫ <br/>
                                            - Có hỗ trợ huấn luyện viên cá nhân <br/>
                                        </p>
                                    </div>
                                    <div class="card-read-more">
                                        <a class="btn btn-link btn-block" onclick="classticket(${tickets.t_id})">
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
        function classticket(id){
            console.log("class: " + id);
            $.ajax(
                {
                    type: "GET",
                    contentType: false,
                    url: "/customer/booking/checkEndDateTicketClass",
                    success: function (resultAPI) {
                        console.log("result: " + resultAPI);
                        if (resultAPI === ""){

                        }else{
                                Swal.fire({
                                    title: 'Bạn chắc chắn muốn mua tham gia vào lớp này không?',
                                    showDenyButton: true,
                                    confirmButtonText: 'Có',
                                    denyButtonText: 'Không',
                                    icon: 'question',
                                    text: 'Bạn đã có class',

                                }).then((result) => {
                                    /* Read more about isConfirmed, isDenied below */
                                    if(result.isConfirmed){
                                    Swal.fire('Bạn đã book class thành công', '', 'success').then((result) => {
                                        if(result.isConfirmed){
                                        <%--window.location.href = '<c:url value="/CustomerUser/saveTickerUserClass?" />' + "id=" + id;--%>
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
        }
    </script>
</section>



