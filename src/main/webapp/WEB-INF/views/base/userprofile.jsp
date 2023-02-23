<%--
  Created by IntelliJ IDEA.
  User: Hieuhm
  Date: 2/23/2023
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/profilestyle.css'/>">
</head>
<body>
<header>
    <nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><img
                src="assets/img/avatars/logo.png"></a><button data-bs-toggle="collapse" class="navbar-toggler"
                                                              data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span
                class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#">PT-HLV</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="#">Sản Phẩm</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="pricing.html">Lịch Tập</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="contacts.html">Dịch Vụ</a></li>
                </ul><a href="#"><i class="fas fa-sign-out-alt text-dark">Log out</i></a>
            </div>
        </div>
    </nav>
</header>
<section>
    <div class="container py-0">
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
                             alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                        <h5 class="my-3">John Smith</h5>
                        <p class="text-muted mb-1">Full Stack Developer</p>
                        <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                        <div class="d-flex justify-content-center mb-2">
                            <button type="button" class="btn btn-primary">Update</button>

                        </div>
                    </div>
                </div>
                <div class="card mb-4 mb-lg-0">
                    <div class="card-body p-0">
                        <ul class="list-group list-group-flush rounded-3">
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <p class="mb-0">https://mdbootstrap.com</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                                <p class="mb-0">mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                <p class="mb-0">@mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                <p class="mb-0">mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                <p class="mb-0">mdbootstrap</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Full Name</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">Johnatan Smith</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">example@example.com</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Phone</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">(097) 234-5678</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Date of Birth</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">18/09/2000</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Address</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-4 mb-md-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="prs text-primary">Project Status</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>Loại vé tập</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Vé tháng</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>Thời gian còn lại</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Còn 27 ngày</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>Ngày hết hạn</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p>27/03/2023</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>PT đang book</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Hoàng Đức Lương</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="bg-dark py-5 mt-5">
    <div class="container py-4">
        <div class="row">
            <div class="col-4">
                <img src="/assets/img/avatars/logo.png">
                <p class="text-light text-start h5 mt-3">Chúng tôi cung cấp khả năng thực hiện các hoạt động thể thao: Crossfit, Gym và các hoạt động khác
                    , nhằm cải thiện sức khỏe và sức đề kháng thể chất của bạn, thông qua hệ thống đào tạo chuyên nghiệp 100%.
                </p>
            </div>
            <div class="col-4">
                <p class="text-info text-center h2">INFORMATION</p>
                <p class="text-light text-center h5 mt-5">HOME</p>
                <p class="text-light text-center h5">PT-HLV</p>
                <p class="text-light text-center h5">SẢN PHẨM</p>
                <p class="text-light text-center h5">LỊCH TẬP</p>
                <p class="text-light text-center h5">DỊCH VỤ</p>
            </div>
            <div class="col-4">
                <p class="text-info text-center h2">SUBCRIBE</p>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="EMAIL" aria-label="Email" aria-describedby="basic-addon1">
                </div>
                <button class="btn btn-primary">Subcribe</button>
            </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
            <p class="text-light">Copyright @ 2023</p>
            <p class="text-light">Hòa Lạc,Thạch Thất, Hà Nội</p>
            <p class="text-light">Hotline: +84 962103669</p>
        </div>
    </div>
</footer>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/> "></script>
<script src="<c:url value='/assets/js/chart.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
<script src="<c:url value='/assets/js/startup-modern.js'/>"></script>
</body>
</html>
