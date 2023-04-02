<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Danh sách người dùng hệ thống</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
    <style>
        body {
            /* Set "my-sec-counter" to 0 */
            counter-reset: my-sec-counter;
        }

        count::before {
            /* Increment "my-sec-counter" by 1 */
            counter-increment: my-sec-counter;
            content: counter(my-sec-counter) ;
        }
        .table tbody td.status .active {
            background: #cff6dd;
            color: #1fa750;
        }
        .table tbody td.status span {
            position: relative;
            border-radius: 30px;
            padding: 4px 10px 4px 25px;
        }
        td.status span:after {
            position: absolute;
            top: 9px;
            left: 10px;
            width: 10px;
            height: 10px;
            content: '';
            border-radius: 50%;
        }
        .table tbody td.status .active:after {
            background: #23bd5a;
        }
        .table tbody td .img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .table tbody td .img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .table tbody td .email span {
            display: block;
        }
        .table tbody td.status .waiting {
            background: #fdf5dd;
            color: #cfa00c;
        }
        .table tbody td.status .waiting:after {
            background: #f2be1d;
        }
        .table tbody td.status .danger {
            background: #fd6f48;
            color: rgba(170, 14, 9, 0.74);
        }
        .table tbody td.status .danger:after {
            background: #f21b21;
        }

    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Thông tin nhân viên</p>
                        <a href="<c:url value='/admin/dashboard/users/new-user'/> " class="btn btn-primary" style="font-weight: 700;">Thêm mới</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label class="form-label">Show&nbsp;<select class="d-inline-block form-select form-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label class="form-label"><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info" style="max-height: 100vh;">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>Email</th>
                                    <th>Tên người dùng</th>
                                    <th class="text-center">SĐT</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody style="display: contents;width: 100%;overflow: auto;">
                                <c:if test="${not empty users}">
                                    <c:forEach items="${users}" var="users">
                                        <tr>
                                            <td class="text-center"><count></count></td>
                                            <td class="d-flex align-items-center" style="border: none;">
                                                <div class="img" style="background-image: url('<c:url value="${users.u_img}"/> ');"></div>
                                                <div class="pl-3 email">
                                                    <span>${users.u_email}</span>
                                                    <span>Added: ${users.u_create_date}</span>
                                                </div>
                                            </td>
                                            <td>${users.u_full_name}</td>
                                            <td class="text-center">${users.u_phone_number}</td>
                                            <c:if test="${users.u_enable == 0}">
                                                <td class="status text-center"><span class="waiting">Chưa kích hoạt</span></td>
                                            </c:if>
                                            <c:if test="${users.u_enable == -1}">
                                                <td class="status text-center"><span class="danger">Khóa</span></td>
                                            </c:if>
                                            <c:if test="${users.u_enable == 1}">
                                                <td class="status text-center"><span class="active">Hoạt động</span></td>
                                            </c:if>
                                            <td class="text-center"><a class="user_view" data-bs-toggle="modal" data-bs-target="#vew_user_modal">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>

                                                <a class="ticket_update" href="<c:url value='/admin/dashboard/users/${users.u_id}'/> ">
                                                    <i class="fas fa-edit fa-lg fa-fw me-2 text-primary" title="Cập nhập vé"></i></a>

                                                <a class="ticket_delete">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script src="<c:url value="/assets/perfect-scrollbar/perfect-scrollbar.min.js"/>"></script>
<script>
    $('.js-pscroll').each(function () {
        var ps = new PerfectScrollbar(this);
        $(window).on('resize', function () {
            ps.update();
        })
    });

</script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</html>