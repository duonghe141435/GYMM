<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                Vé được nhiều người chọn
            </h1>
        </div>
        <div class="content">
            <div class="container">
                <div class="row">
                    <c:forEach items="${tickets}" var="tickets">
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
                                        - Thời gian sử dụng: ${tickets.t_total_days} <br/>
                                        - Giá vé : 10.000₫ <br/>
                                        - Có hỗ trợ huấn luyện viên cá nhân <br/>
                                    </p>
                                </div>
                                <div class="card-read-more">
                                    <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html" class="btn btn-link btn-block">
                                        Mua vé ngay
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

