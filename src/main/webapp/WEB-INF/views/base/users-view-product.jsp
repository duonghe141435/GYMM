<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hieuhm
  Date: 3/4/2023
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/css/users-view-product.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
</head>
<body>
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav">
    <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><img
            src="/assets/img/dogs/logo.png"></a><button data-bs-toggle="collapse" class="navbar-toggler"
                                                         data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span
            class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link active" href="">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="">PT-HLV</a></li>
                <li class="nav-item"><a class="nav-link" href="">SẢN PHẨM</a></li>
                <li class="nav-item"><a class="nav-link" href="">LỊCH TẬP</a></li>
                <li class="nav-item"><a class="nav-link" href="">DỊCH VỤ</a></li>
            </ul>
        </div>
        <div class="container-fluid">
            <ul class="navbar-nav flex-nowrap ms-auto">
                <li class="nav-item dropdown no-arrow">
                    <div class="nav-item dropdown no-arrow">
                        <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown"
                           href="#">
                            <span class="d-none d-lg-inline me-2 text-gray-600 small h3">Đức Lương</span>
                            <img class="border rounded-circle img-profile" src="/assets/img/avatars/avatar5.jpeg" />
                        </a>
                        <div class="dropdown-menu shadow dropdown-menu-end animated-grow-in">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-sw me-2 text-gray-400" style="color: black"> Profile</i>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400" style="color: black"> Log out</i>
                            </a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<header class="pt-5">
    <div class="container pt-4">
        <div class="col-md-8 text-center text-md-start mx-auto">
            <p class="mb-5 h1" style="color: yellow;">SẢN PHẨM CỦA CHÚNG TÔI</p>
            <p class="mb-5 h1" style="color: yellow;">HÀNG CHÍNH HÃNG, CHẤT LƯỢNG CAO, GIÁ CẢ HỢP LÝ</p>
        </div>
    </div>
</header>
<section class="navbar-brand">
    <div class="container py-4">
        <div class="py-1">
            <p class="text-dark float-start" style="font-size: 30px;">NHIỀU GÓI COMBO HẤP DẪN</p>
            <button class="btn btn-primary float-end">Đến ngay</button>
        </div>
    </div>
</section>
<section class="list_product" style="background-color: #eee;">
    <div class="container py-5">
        <h4 class="text-center mb-5"><strong>Product listing</strong></h4>

        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(1).webp"
                         class="w-100" />
                    <a href="#">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                            <div class="d-flex justify-content-start align-items-start h-30">
                                <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">$123</span></h5>
                            </div>
                        </div>
                        <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(2).webp"
                         class="w-100" />
                    <a href="#">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                            <div class="d-flex justify-content-start align-items-start h-30">
                                <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">$239</span></h5>
                            </div>
                        </div>
                        <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(3).webp"
                         class="w-100" />
                    <a href="#">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                            <div class="d-flex justify-content-start align-items-start h-30">
                                <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">$147</span></h5>
                            </div>
                        </div>
                        <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(4).webp"
                         class="w-100" />
                    <a href="#">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                            <div class="d-flex justify-content-start align-items-start h-30">
                                <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">$83</span></h5>
                            </div>
                        </div>
                        <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(5).webp"
                         class="w-100" />
                    <a href="#!">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                            <div class="d-flex justify-content-start align-items-start h-30">
                                <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">$106</span></h5>
                            </div>
                        </div>
                        <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/new/img(6).webp"
                         class="w-100" />
                    <a href="#!">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                            <div class="d-flex justify-content-start align-items-start h-30">
                                <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">$58</span></h5>
                            </div>
                        </div>
                        <div class="hover-overlay">
                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</section>
<footer class="bg-dark">
    <div class="container py-4">
        <div class="row">
            <div class="col-4">
                <img src="/assets/img/dogs/logo.png">
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
