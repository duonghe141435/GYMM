<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href='<c:url value="/home"/>' style="padding: 0 .75rem">
            <div class="sidebar-brand-icon rotate-n-15">
                <img style="width: 70px" src="<c:url value="/assets/img/logo/logo-icon.png" />" />
            </div>
            <div class="sidebar-brand-text" id="logo-name">
                <span style="font-weight: bold">GYM MASTER</span>
            </div>
        </a>
        <ul class="navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" style="color: black" href="<c:url value="/home" />">
                    <i class="fas fa-home"></i><span>&nbsp;&nbsp;Trang chủ</span>
                </a>
            </li>

            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" style="color: black" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <i class="fas fa-user-alt"></i><span>&nbsp;&nbsp;Vé</span>
                    </a>

                    <div class="dropdown-menu shadow animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/list-personal"/>">Vé tập với PT</a>
                        <a class="dropdown-item" href="<c:url value="/list-class"/>">Vé lớp</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" style="color: black" href="<c:url value="/list-trainer"/>">
                    <i class="fas fa-chalkboard-teacher"></i><span>&nbsp;&nbsp;Huấn Luyện Viên</span>
                </a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" style="color: black" href="<c:url value="/product"/>">
                    <i class="fas fa-boxes"></i><span>&nbsp;&nbsp;Sản phẩm</span>
                </a>
            </li>
        </ul>
        <div>
            <a href="/login" class="btn btn-info">Đăng nhập</a>
        </div>
        <%--<ul class="navbar-nav flex-nowrap ms-auto" style="background-color: seagreen">--%>

            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
                <%--<a class="nav-link">--%>
                    <%--<span class="fas" id="check-in-btn">Check In&nbsp;&nbsp;<span class="tick">&#10004;</span></span>--%>
                <%--</a>--%>
            <%--</li>--%>

            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
            <%--<div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false"--%>
            <%--data-bs-toggle="dropdown" href="#"><span--%>
            <%--class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>--%>
            <%--<div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">--%>
            <%--<h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center"--%>
            <%--href="#">--%>
            <%--<div class="me-3">--%>
            <%--<div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>--%>
            <%--</div>--%>
            <%--<div><span class="small text-gray-500">December 12, 2019</span>--%>
            <%--<p>A new monthly report is ready to download!</p>--%>
            <%--</div>--%>
            <%--</a><a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--<div class="me-3">--%>
            <%--<div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i></div>--%>
            <%--</div>--%>
            <%--<div><span class="small text-gray-500">December 7, 2019</span>--%>
            <%--<p>$290.29 has been deposited into your account!</p>--%>
            <%--</div>--%>
            <%--</a><a class="dropdown-item d-flex align-items-center" href="#">--%>
            <%--<div class="me-3">--%>
            <%--<div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div><span class="small text-gray-500">December 2, 2019</span>--%>
            <%--<p>Spending Alert: We've noticed unusually high spending for your account.</p>--%>
            <%--</div>--%>
            <%--</a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</li>--%>
            <%--<div class="d-none d-sm-block topbar-divider"></div>--%>
            <%--<li class="nav-item dropdown no-arrow">--%>
                <%--<div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">--%>
                    <%--<span class="d-none d-lg-inline me-2 small" style="color: white">${display_name}</span>--%>
                    <%--<img class="border rounded-circle img-profile" src="<c:url value="${display_img}"/>"></a>--%>
                    <%--<div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">--%>
                        <%--<a class="dropdown-item" href="<c:url value="/customer/your-profile"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>--%>
                        <%--<a class="dropdown-item"  href="<c:url value="/customer/activity-log/page=1"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Lịch sử hoạt động</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/customer/change-pass"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Đổi mật khẩu</a>--%>

                        <%--<div class="dropdown-divider"></div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
        <%--</ul>--%>
    </div>
</nav>