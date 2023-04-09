<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="wrapper">
    <div class="container-fostrap" >
        <div>
            <h1 class="heading">
                Huấn Luyện Viên
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
                </div>
            </div>
        </div>
    </div>
</section>
