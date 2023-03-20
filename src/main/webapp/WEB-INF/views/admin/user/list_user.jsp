<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/7/2023
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Duong
  Date: 21-02-2023
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
</head>

<body id="page-top">
<div id="wrapper">
    <%@include file="/WEB-INF/views/layouts/admin/menu.jsp" %>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>

            <div class="container-fluid">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">Employee Info</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label
                                        class="form-label">Show&nbsp;<select
                                        class="d-inline-block form-select form-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label
                                        class="form-label"><input type="search" class="form-control form-control-sm"
                                                                  aria-controls="dataTable"
                                                                  placeholder="Search"></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Email</th>
                                    <th>SĐT</th>
                                    <th>Trạng thái khóa</th>
                                    <th>Trạng thái kích hoạt</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty users}">

                                    <c:forEach items="${users}" var="users">
                                        <td>${users.u_id}</td>
                                        <td>${users.u_email}</td>
                                        <td>${users.u_phone_number}</td>
                                        <td>
                                            <a id="icon_${users.u_id}" onclick="changeStatusLog(${users.u_id})">
                                                <c:if test="${users.u_status eq true}">
                                                    <i class="fas fa-lock-open fa-lg fa-fw me-2 text-success"></i>
                                                </c:if>
                                                <c:if test="${users.u_status eq false}">
                                                    <i class="fas fa-lock fa-lg fa-fw me-2 text-danger"></i>
                                                </c:if>
                                            </a>
                                        </td>
                                        <td>
                                            <c:if test="${users.u_enable eq true}">
                                                Đã kích hoạt
                                            </c:if>
                                            <c:if test="${users.u_enable eq false}">
                                                Chưa kích hoạt
                                            </c:if>
                                        </td>
                                        <td>${users.create_date}</td>
                                        <td>
                                            <a onclick="deleteUser(${users.u_id})">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-primary"
                                                   title="Xem chi tiết"></i>
                                            </a>
                                            <a onclick="deleteUser(${users.u_id})">
                                                <i class="fas fa-trash fa-lg fa-fw me-2 text-danger"
                                                   title="Xóa vé"></i>
                                            </a>
                                        </td>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <%--<div class="row">--%>
                        <%--<div class="col-md-6 align-self-center">--%>
                        <%--<p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing--%>
                        <%--1 to 10 of 27</p>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6">--%>
                        <%--<nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">--%>
                        <%--<ul class="pagination">--%>
                        <%--<li class="page-item disabled">--%>
                        <%--<a class="page-link" href="#" aria-label="Previous">--%>
                        <%--<span aria-hidden="true">«</span>--%>
                        <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="page-item active">--%>
                        <%--<a class="page-link" href="#">1</a></li>--%>
                        <%--<li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                        <%--<li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                        <%--<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span--%>
                        <%--aria-hidden="true">»</span></a></li>--%>
                        <%--</ul>--%>
                        <%--</nav>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div>
</div>

</body>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script>
    function changeStatusLog(u_id) {
        $.ajax({
            type: 'PATCH',
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: '<c:url value="/admin/user-management/" />' + u_id + '/change_lock',
            success: function (result) {
                $("#icon1 > i").remove();
                $("#icon1").add('i', this).addClass(result);
            },
            error: function (error) {
                console.log(error);
            }
        })
    }


    function changeStatusLog(u_id) {
        $.ajax({
            type: 'GET',
            url: '<c:url value="/admin/user-management/" />' + u_id,
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {
                $("#icon1 > i").remove();
                $("#icon1").add('i', this).addClass(result);
            },
            error: function (error) {
                console.log(error);
            }
        })
    }

    function deleteTicket(u_id) {
        $.ajax({
            type: 'DELETE',
            url: '<c:url value="/admin/users-management/" />' + u_id,
            success: function (result) {
                $("#ticket_" + u_id).remove();
            },
            error: function (error) {
                console.log(error);
            }
        })
    }

</script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>

</html>


