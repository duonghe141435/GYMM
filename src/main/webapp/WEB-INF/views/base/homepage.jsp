<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hieuhm
  Date: 20/02/2023
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/homepagestyle.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/font-awesome/font-awesome.min.css'/>">
</head>
<body>
<%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
<header class="pt-5">
    <div class="container pt-4">
        <div class="col-md-8 text-center text-md-start mx-auto">
            <p class="text-light mb-5 h1">HÃY TĂNG CƯỜNG CƠ THỂ VÀ THỂ CHẤT CÙNG CÁC HLV CHUYÊN NGHIỆP</p>
            <button class="btn btn-primary">Đến Ngay</button>
        </div>
    </div>
</header>
<section class="navbar-brand">
    <div class="container py-4 py-xl-5">
        <div class="py-1">
            <p class="text-dark float-start" style="font-size: 30px;">NHIỀU GÓI COMBO HẤP DẪN</p>
            <button class="btn btn-primary float-end">Đến ngay</button>
        </div>
    </div>
</section>
<section class="py-4">
    <div class="container pt-4">
        <div class="col-md-8 text-center text-md-start mx-auto">
            <p class="text-light mb-5 h1">NHỮNG DỊCH VỤ TỐT NHẤT CHO KHÁCH HÀNG</p>
            <button class="btn btn-primary">Đến Ngay</button>
        </div>
    </div>
</section>
<section class="py-5 bg-dark">
    <div class="container py-4 py-xl-5">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2 class="display-6 fw-bold mb-4 text-light">GIÁ VÉ</h2>
            </div>
        </div>
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
</section>
<section class="py-5 bg-dark hlv">
    <div class="container py-4 py-xl-5">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2 class="display-6 fw-bold mb-4 text-light">HLV CHUYÊN NGHIỆP</h2>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
            <div class="col">
                <div class="d-flex justify-content-between p-4">
                    <div class="pb-4">
                        <img class="img-fluid" src="/assets/img/images/hlv1.jpg">
                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Hoàng Hiếu</h6>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex justify-content-between p-4">
                    <div class="pb-4">
                        <img class="img-fluid" src="/assets/img/images/hlv2.jpg">
                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Đức Lương</h6>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex justify-content-between p-4">
                    <div class="pb-4">
                        <img class="img-fluid mx-auto" src="/assets/img/images/hlv3.jpg">
                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Đại Dương</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/views/layouts/customer/footer.jsp" %>


<script src="<c:url value='/assets/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/startup-modern.js'/> "></script>
</body>
</html>

