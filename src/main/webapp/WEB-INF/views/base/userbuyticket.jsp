<%--
  Created by IntelliJ IDEA.
  User: Hieuhm
  Date: 3/1/2023
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Buying Ticket</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Pricing - Brand</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/profilestyle.css'/> ">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;display=swap">
</head>
<body>
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav">
    <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><span>DashBoard</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item h3"><a class="nav-link active" href="">GIÁ VÉ</a></li>
            </ul><a class="btn btn-primary shadow" role="button" href="">Logout</a>
        </div>
    </div>
</nav>
<section class="py-5 bg-dark">
    <div class="container py-4 py-xl-5">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2 class="display-6 fw-bold mb-4 text-light">Mua vé ngay để trải nghiệm cùng chúng tôi</h2>
            </div>
        </div>
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
                        <div class="col">
                            <div class="card border-0 h-100">
                                <div class="card-body d-flex flex-column justify-content-between p-4">
                                    <div>
                                        <h6 class="fw-bold text-muted">Vé Ngày</h6>
                                        <h4 class="display-5 fw-bold mb-4">$15</h4>
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
                                    </div><a class="btn btn-primary" role="button" href="#">Button</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-warning border-2 h-100">
                                <div class="card-body d-flex flex-column justify-content-between p-4"><span
                                        class="badge bg-warning position-absolute top-0 end-0 rounded-bottom-left text-uppercase text-primary">Most
                                        Popular</span>
                                    <div>
                                        <h6 class="fw-bold text-muted">Vé tháng</h6>
                                        <h4 class="display-5 fw-bold mb-4">$38</h4>
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
                                    </div><a class="btn btn-warning" role="button" href="#">Button</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-0 h-100">
                                <div class="card-body d-flex flex-column justify-content-between p-4">
                                    <div class="pb-4">
                                        <h6 class="fw-bold text-muted">Vé năm</h6>
                                        <h4 class="display-5 fw-bold mb-4">$70</h4>
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
                                    </div><a class="btn btn-primary" role="button" href="#">Button</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="..." class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="..." class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev"
            >
                <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    </div>
</section>
<footer class="bg-dark">
    <div class="container py-4">
        <div class="row">
            <div class="col-4">
                <img src="/assets/img/brands/logo.png">
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
<script src="<c:url value='/assets/js/startup-modern.js'/> "></script>

</body>
</html>
