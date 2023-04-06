<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                Tập với PT
            </h1>
        </div>
        <div class="content">
            <div class="container">
                <div class="row">

                    <c:forEach items="${tickets}" var="tickets">
                        <c:if test="${tickets.tt_id == 2}">
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
                                            <%--<a class="btn btn-link btn-block" onclick="mess(${tickets.t_id})">--%>
                                            <%--Mua vé ngay--%>
                                            <%--</a>--%>
                                        <a class="btn btn-link btn-block">
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
</section>