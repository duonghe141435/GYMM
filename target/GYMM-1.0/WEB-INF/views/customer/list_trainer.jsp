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
                Huấn Luyện Viên được mọi người tin tưởng
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
                    <%--<div class="col-xs-12 col-sm-4">--%>
                        <%--<div class="card">--%>
                            <%--<a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">--%>
                                <%--<img src="https://1.bp.blogspot.com/-Bii3S69BdjQ/VtdOpIi4aoI/AAAAAAAABlk/F0z23Yr59f0/s640/cover.jpg" />--%>
                            <%--</a>--%>
                            <%--<div class="card-content">--%>
                                <%--<h4 class="card-title">--%>
                                    <%--<a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> Bootstrap 3 Carousel FadeIn Out Effect--%>
                                    <%--</a>--%>
                                <%--</h4>--%>
                                <%--<p class="">--%>
                                    <%--Tutorial to make a carousel bootstrap by adding more wonderful effect fadein ...--%>
                                <%--</p>--%>
                            <%--</div>--%>
                            <%--<div class="card-read-more">--%>
                                <%--<a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html" class="btn btn-link btn-block">--%>
                                    <%--Read More--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-xs-12 col-sm-4">--%>
                        <%--<div class="card">--%>
                            <%--<a class="img-card" href="http://www.fostrap.com/2016/03/5-button-hover-animation-effects-css3.html">--%>
                                <%--<img src="https://3.bp.blogspot.com/-bAsTyYC8U80/VtLZRKN6OlI/AAAAAAAABjY/kAoljiMALkQ/s400/material%2Bnavbar.jpg" />--%>
                            <%--</a>--%>
                            <%--<div class="card-content">--%>
                                <%--<h4 class="card-title">--%>
                                    <%--<a href="http://www.fostrap.com/2016/02/awesome-material-design-responsive-menu.html"> Material Design Responsive Menu--%>
                                    <%--</a>--%>
                                <%--</h4>--%>
                                <%--<p class="">--%>
                                    <%--Material Design is a visual programming language made by Google. Language programming...--%>
                                <%--</p>--%>
                            <%--</div>--%>
                            <%--<div class="card-read-more">--%>
                                <%--<a href="https://codepen.io/wisnust10/full/ZWERZK/" class="btn btn-link btn-block">--%>
                                    <%--Read More--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-xs-12 col-sm-4">--%>
                        <%--<div class="card">--%>
                            <%--<a class="img-card" href="http://www.fostrap.com/2016/03/5-button-hover-animation-effects-css3.html">--%>
                                <%--<img src="https://4.bp.blogspot.com/-TDIJ17DfCco/Vtneyc-0t4I/AAAAAAAABmk/aa4AjmCvRck/s1600/cover.jpg" />--%>
                            <%--</a>--%>
                            <%--<div class="card-content">--%>
                                <%--<h4 class="card-title">--%>
                                    <%--<a href="http://www.fostrap.com/2016/03/5-button-hover-animation-effects-css3.html">5  Button Hover Animation Effects--%>
                                    <%--</a>--%>
                                <%--</h4>--%>
                                <%--<p class="">--%>
                                    <%--tutorials button hover animation, although very much a hover button is very beauti...--%>
                                <%--</p>--%>
                            <%--</div>--%>
                            <%--<div class="card-read-more">--%>
                                <%--<a href="http://www.fostrap.com/2016/03/5-button-hover-animation-effects-css3.html" class="btn btn-link btn-block">--%>
                                    <%--Read More--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>
</section>
