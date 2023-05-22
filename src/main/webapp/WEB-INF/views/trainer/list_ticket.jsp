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
                                        <%--<a class="btn btn-link btn-block" onclick="mess(${tickets.t_id})">--%>
                                            <%--Muya vé nga--%>
                                        <%--</a>--%>
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

    </script>
</section>