<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/7/2023
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
    <div class="container-fluid" style="background-color: seagreen">
        <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#" style="padding: 0 .75rem;">
            <div class="sidebar-brand-icon rotate-n-15">
                <img style="width: 70px" src="<c:url value="/assets/img/logo/logo-icon.png" />" />
            </div>
            <div class="sidebar-brand-text">
                <span style="font-weight: bold">GYM MASTER</span>
            </div>
        </a>
        <ul class="navbar-nav text-light" id="accordionSidebar">
            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
                <%--<div class="nav-item dropdown no-arrow">--%>
                    <%--<a class="nav-link" href="<c:url value="/trainer/index"/>">--%>
                        <%--<i class="fas fa-home"></i><span>&nbsp;&nbsp;Trang chủ</span>--%>
                    <%--</a>--%>
                <%--</div>--%>
            <%--</li>--%>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" href="<c:url value="/trainer/index"/>">
                        <i class="fas fa-person-booth"></i><span>&nbsp;&nbsp;Quản lý lớp học</span>
                    </a>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" >
                        <i class="fas fa-user-alt"></i><span>&nbsp;&nbsp;Quản lý học viên</span>
                    </a>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" href="<c:url value="/trainer/product"/>">
                        <i class="fas fa-user-alt"></i><span>&nbsp;&nbsp;Sản phẩm</span>
                    </a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav flex-nowrap ms-auto">
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false"
                                                           data-bs-toggle="dropdown" href="#"><span
                        class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                        <h6 class="dropdown-header">Thông báo</h6><a class="dropdown-item d-flex align-items-center"
                                                                         href="#">
                        <div class="me-3">
                            <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>
                        </div>
                        <div><span class="small text-gray-500">December 12, 2019</span>
                            <p>Bạn đã chấp nhận học viên</p>
                        </div>
                    </a><a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="me-3">
                            <div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i>
                            </div>
                        </div>
                        <div><span class="small text-gray-500">December 2, 2019</span>
                            <p>Bạn sắp hết thời hạn hợp đồng,xin gia hạn thêm</p>
                        </div>
                    </a><a class="dropdown-item text-center small text-gray-500" href="<c:url value="/trainer/notify"/>">Hiển thị tất cả thông báo</a>
                    </div>
                </div>
            </li>
            <div class="d-none d-sm-block topbar-divider"></div>
            <li class="nav-item dropdown no-arrow">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                    <span class="d-none d-lg-inline me-2 small" style="color: white">${display_name}</span>
                    <img class="border rounded-circle img-profile" src="<c:url value="${display_img}"/>"></a>
                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/trainer/your-profile"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>
                        <a class="dropdown-item"  href="<c:url value="/trainer/activity-log"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Lịch sử hoạt động</a>
                        <a class="dropdown-item" href="<c:url value="/trainer/change-pass"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Đổi mật khẩu</a>

                        <div class="dropdown-divider"></div>
                        <form action="<c:url value="/j_spring_security_logout"/>" method="POST" class="dropdown-item">
                            <button style="background: none; border: none" type="submit"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>