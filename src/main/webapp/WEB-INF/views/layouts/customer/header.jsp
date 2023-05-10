<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="<c:url value="/customer/home"/>" style="padding: 0 .75rem;">
            <div class="sidebar-brand-icon rotate-n-15">
                <%--<i class="fas fa-laugh-wink"></i>--%>
                <img style="width: 62px" src="<c:url value="/assets/img/logo/logo-icon.png" />" />
            </div>
            <div class="sidebar-brand-text mx-3">
                <span style="font-weight: bold">GYM MASTER</span>
            </div>
        </a>
        <ul class="navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" href="<c:url value="/customer/home" />">
                   <span class="fas fa-home">&nbsp;&nbsp;Trang chủ</span>
                </a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <i class="fas fa-ticket-alt"></i><span>&nbsp;&nbsp;Vé</span>
                    </a>

                    <div class="dropdown-menu shadow animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/customer/show-list-personal"/>">Vé tập với PT</a>
                        <a class="dropdown-item" href="<c:url value="/customer/show-list-class"/>">Vé lớp</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" href="<c:url value="/customer/show-list-trainer"/>">
                    <span class="fas fa-chalkboard-teacher">&nbsp;&nbsp;Huấn Luyện Viên</span>
                </a>
            </li>
            <!--Thêm mới -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" href="<c:url value="/customer/list_class_of_customer"/>">
                    <span class="fas fa-person-booth">&nbsp;&nbsp;Lớp học</span>
                </a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" href="<c:url value="/customer/book_pt"/>">
                    <span class="fas fa-calendar-alt">&nbsp;&nbsp;Lịch tập</span>
                </a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link" href="<c:url value="/customer/product"/>">
                    <span class="fas fa-boxes">&nbsp;&nbsp;Sản phẩm</span>
                </a>
            </li>
            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
                <%--<a class="nav-link" href="<c:url value="/customer/attendance-an-class"/>">--%>
                    <%--<bu class="fas fa-boxes" >&nbsp;&nbsp;Điểm danh</bu>--%>
                <%--</a>--%>
            <%--</li>--%>
        </ul>
        <ul class="navbar-nav flex-nowrap ms-auto">
            <div class="d-none d-sm-block topbar-divider" style="color: white;"></div>
            <%--<li class="nav-item no-arrow mx-1" style="padding-top: auto; display: flex; justify-content: center; align-content: center; height: 60%">--%>
                <%--<button class="btn btn-info" id="check-in-btn" style="border-radius: 18px">--%>
                    <%--Check In <span class="tick">&#10004;</span>--%>
                <%--</button>--%>
            <%--</li>--%>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link">
                    <span class="fas" id="check-in-btn">Check In&nbsp;&nbsp;<span class="tick">&#10004;</span></span>
                </a>
            </li>

            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span
                        class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                        <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center"
                                                                         href="#">
                        <div class="me-3">
                            <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>
                        </div>
                        <div><span class="small text-gray-500">December 12, 2019</span>
                            <p>A new monthly report is ready to download!</p>
                        </div>
                    </a><a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="me-3">
                            <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i></div>
                        </div>
                        <div><span class="small text-gray-500">December 7, 2019</span>
                            <p>$290.29 has been deposited into your account!</p>
                        </div>
                    </a><a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="me-3">
                            <div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i>
                            </div>
                        </div>
                        <div><span class="small text-gray-500">December 2, 2019</span>
                            <p>Spending Alert: We've noticed unusually high spending for your account.</p>
                        </div>
                    </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" href="<c:url value="/CustomerUser/cart" />">
                        <%--<span class="badge bg-danger badge-counter">3+</span>--%>
                        <i class="fas fa-cart-plus fa-fw"></i>
                    </a>
                </div>
            </li>
            <div class="d-none d-sm-block topbar-divider"></div>
            <li class="nav-item dropdown no-arrow">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                    <span class="d-none d-lg-inline me-2 small" style="color: white">${display_name}</span>
                    <img class="border rounded-circle img-profile" src="<c:url value="${display_img}"/>"></a>
                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/customer/your-profile"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>
                        <a class="dropdown-item"  href="<c:url value="/customer/activity-log"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Lịch sử hoạt động</a>
                        <a class="dropdown-item" href="<c:url value="/customer/change-pass"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Đổi mật khẩu</a>

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
<script>

</script>
<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/7/2023
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">--%>
    <%--<div class="container-fluid">--%>
        <%--<a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="<c:url value="/trainer/index"/>" style="padding: 0 .75rem;">--%>
            <%--<div class="sidebar-brand-icon rotate-n-15">--%>
                <%--<i class="fas fa-laugh-wink"></i></div>--%>
            <%--<div class="sidebar-brand-text mx-3">--%>
                <%--<span>Brand</span>--%>
            <%--</div>--%>
        <%--</a>--%>
        <%--<ul class="navbar-nav text-light" id="accordionSidebar">--%>
            <%--<li class="nav-item no-arrow mx-1">--%>
                    <%--<a class="nav-link" href="<c:url value="/trainer/index"/>">--%>
                        <%--<i class="fas fa-user-alt"></i><span>Trang chủ</span>--%>
                    <%--</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
                <%--<div class="nav-item dropdown no-arrow">--%>
                    <%--<a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">--%>
                        <%--<i class="fas fa-user-alt"></i><span>Quản lý lớp học</span>--%>
                    <%--</a>--%>

                    <%--<div class="dropdown-menu shadow animated--grow-in">--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/ticket"/>">Quản lý vé</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/equipment"/>">Quản lý thiết bị</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/product"/>">Quản lý sản phẩm</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/class"/>">Quản lý lớp</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
                <%--<div class="nav-item dropdown no-arrow">--%>
                    <%--<a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">--%>
                        <%--<i class="fas fa-user-alt"></i><span>Quản lý học viên</span>--%>
                    <%--</a>--%>

                    <%--<div class="dropdown-menu shadow animated--grow-in">--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý người dùng hệ thống</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý nhân viên</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý huấn luyện viên</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <%--<ul class="navbar-nav flex-nowrap ms-auto">--%>
            <%--<li class="nav-item dropdown no-arrow mx-1">--%>
                <%--<div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false"--%>
                                                           <%--data-bs-toggle="dropdown" href="#"><span--%>
                        <%--class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>--%>
                    <%--<div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">--%>
                        <%--<h6 class="dropdown-header">Thông báo</h6><a class="dropdown-item d-flex align-items-center"--%>
                                                                     <%--href="#">--%>
                        <%--<div class="me-3">--%>
                            <%--<div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>--%>
                        <%--</div>--%>
                        <%--<div><span class="small text-gray-500">December 12, 2019</span>--%>
                            <%--<p>Bạn đã chấp nhận học viên</p>--%>
                        <%--</div>--%>
                    <%--</a><a class="dropdown-item d-flex align-items-center" href="#">--%>
                        <%--<div class="me-3">--%>
                            <%--<div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div><span class="small text-gray-500">December 2, 2019</span>--%>
                            <%--<p>Bạn sắp hết thời hạn hợp đồng,xin gia hạn thêm</p>--%>
                        <%--</div>--%>
                    <%--</a><a class="dropdown-item text-center small text-gray-500" href="<c:url value="/trainer/notify"/>">Hiển thị tất cả thông báo</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<div class="d-none d-sm-block topbar-divider"></div>--%>
            <%--<li class="nav-item dropdown no-arrow">--%>
                <%--<div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">--%>
                    <%--<span class="d-none d-lg-inline me-2 text-gray-600 small">${display_name}</span>--%>
                    <%--<img class="border rounded-circle img-profile" src="<c:url value="${display_img}"/>"></a>--%>
                    <%--<div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">--%>
                        <%--<a class="dropdown-item" href="<c:url value="/trainer/your-profile"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>--%>
                        <%--<a class="dropdown-item"  href="<c:url value="/trainer/activity-log"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Lịch sử hoạt động</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/trainer/change-pass"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Đổi mật khẩu</a>--%>

                        <%--<div class="dropdown-divider"></div>--%>
                        <%--<form action="<c:url value="/j_spring_security_logout"/>" method="POST" class="dropdown-item">--%>
                            <%--<button style="background: none; border: none" type="submit"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</button>--%>
                            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</nav>--%>
<script>
    $(document).ready(function () {
        // Lấy CSRF token
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        // Thiết lập CSRF token cho mọi ajax request
        $(document).ajaxSend(function(e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

        $('#check-in-btn').click(function (e) {

            $.ajax({
                url: '/customer/checkIn',
                type: "POST",
                success: function (respone) {
                    if (respone === 'YES') {
                        Swal.fire("Bạn đã CheckIn thành công", '', 'success');
                    }
                    if (respone === 'NO') {
                        Swal.fire("Vé của bạn đã hết hạn", 'Vui lòng mua vé mới', 'info');
                    }
                    if (respone === 'NULL') {
                        Swal.fire("Bạn chưa có vé", 'Vui lòng mua vé mới', 'info');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Lỗi hệ thống!!', 'Mã lỗi: ' + xhr.status + ', thông điệp lỗi: ' + thrownError, 'error');
                    console.log(xhr);
                }
            });

        });
    });
</script>