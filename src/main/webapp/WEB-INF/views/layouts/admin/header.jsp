<!--SHOW MENU --><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#" style="padding: 0 .75rem;">
            <div class="sidebar-brand-icon rotate-n-15">
                <img style="width: 70px" src="<c:url value="/assets/img/logo/logo-icon.png" />" />
            </div>
            <div class="sidebar-brand-text">
                <span>GYM MASTER</span>
            </div>
        </a>
        <ul class="navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <i class="fas fa-user-alt"></i><span>Người dùng hệ thống</span>
                    </a>

                    <div class="dropdown-menu shadow animated--grow-in">
                        <%--<a class="dropdown-item" href="<c:url value="/admin/dashboard/users"/>">Danh sách người dùng hệ thống</a>--%>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/employee"/>">Danh sách nhân viên</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/trainer"/>">Danh sách huấn luyện viên</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/customer"/>">Danh sách khách hàng</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/log-activity  "/>">Lịch sử tác động</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <i class="fas fa-user-alt"></i><span>Phòng tập</span>
                    </a>

                    <div class="dropdown-menu shadow animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/ticket"/>">Quản lý vé</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/class"/>">Quản lý lớp học</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/"/>">Quản lý thiết bị</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/product"/>">Quản lý sản phẩm</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/"/>">Quản lý huấn luyện viên</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <i class="fas fa-user-alt"></i><span>Sổ quỹ</span>
                    </a>

                    <div class="dropdown-menu shadow animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý người dùng hệ thống</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý nhân viên</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý huấn luyện viên</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow">
                    <a class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <i class="fas fa-user-alt"></i><span>Báo cáo</span>
                    </a>

                    <div class="dropdown-menu shadow animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý người dùng hệ thống</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý nhân viên</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/users/trainer"/>">Quản lý huấn luyện viên</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/recycle-bin"/>">Thùng rác</a>
                    </div>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav flex-nowrap ms-auto">
            <li class="nav-item dropdown no-arrow mx-1">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false"
                                                           data-bs-toggle="dropdown" href="#"><span
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
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false"
                                                           data-bs-toggle="dropdown" href="#"><span
                        class="badge bg-danger badge-counter">7</span><i class="fas fa-envelope fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                        <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center"
                                                                         href="#">
                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                   src="/assets/img/avatars/avatar4.jpeg">
                            <div class="bg-success status-indicator"></div>
                        </div>
                        <div class="fw-bold">
                            <div class="text-truncate"><span>Hi there! I am wondering if you can help me with a problem I've been having.</span>
                            </div>
                            <p class="small text-gray-500 mb-0">Emily Fowler - 58m</p>
                        </div>
                    </a><a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                   src="/assets/img/avatars/avatar2.jpeg">
                            <div class="status-indicator"></div>
                        </div>
                        <div class="fw-bold">
                            <div class="text-truncate"><span>I have the photos that you ordered last month!</span></div>
                            <p class="small text-gray-500 mb-0">Jae Chun - 1d</p>
                        </div>
                    </a><a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                   src="/assets/img/avatars/avatar3.jpeg">
                            <div class="bg-warning status-indicator"></div>
                        </div>
                        <div class="fw-bold">
                            <div class="text-truncate"><span>Last month's report looks great, I am very happy with the progress so far, keep up the good work!</span>
                            </div>
                            <p class="small text-gray-500 mb-0">Morgan Alvarez - 2d</p>
                        </div>
                    </a><a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image me-3"><img class="rounded-circle"
                                                                   src="/assets/img/avatars/avatar5.jpeg">
                            <div class="bg-success status-indicator"></div>
                        </div>
                        <div class="fw-bold">
                            <div class="text-truncate"><span>Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</span>
                            </div>
                            <p class="small text-gray-500 mb-0">Chicken the Dog · 2w</p>
                        </div>
                    </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                    </div>
                </div>
                <div class="shadow dropdown-list dropdown-menu dropdown-menu-end"
                     aria-labelledby="alertsDropdown"></div>
            </li>
            <div class="d-none d-sm-block topbar-divider"></div>
            <li class="nav-item dropdown no-arrow">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                    <span class="d-none d-lg-inline me-2 text-gray-600 small">${display_name}</span>
                    <img class="border rounded-circle img-profile" src="<c:url value="${display_img}"/>"></a>
                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/your-profile"/>"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>
                        <a class="dropdown-item"  href="<c:url value="/admin/dashboard/activity-log"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Lịch sử hoạt động</a>
                        <a class="dropdown-item" href="<c:url value="/admin/dashboard/change-pass"/>"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Đổi mật khẩu</a>

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