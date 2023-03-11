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
    <style>
        .modal input, select{
            margin-top: 13px;
        }
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
        <div class="container-fluid d-flex flex-column p-0"><a
                class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
            <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
            <div class="sidebar-brand-text mx-3"><span>Brand</span></div>
        </a>
            <hr class="sidebar-divider my-0">
            <ul class="navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link" href="index.html"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
                </li>
                <li class="nav-item"><a class="nav-link active" href="/admin/dashboard/users"><i
                        class="fas fa-table"></i><span>Users</span></a>
                </li>
                <li class="nav-item"><a class="nav-link active" href="/admin/dashboard/tickets"><i
                        class="fas fa-table"></i><span>Tickets</span></a>
                </li>
                <li class="nav-item"><a class="nav-link active" href="/admin/dashboard/products"><i
                        class="fas fa-table"></i><span>Product</span></a>
                </li>
            </ul>
            <div class="text-center d-none d-md-inline">
                <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
            </div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid">
                    <button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i
                            class="fas fa-bars"></i></button>
                    <form class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text"
                                                        placeholder="Search for ...">
                            <button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button>
                        </div>
                    </form>
                    <ul class="navbar-nav flex-nowrap ms-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link"
                                                                            aria-expanded="false"
                                                                            data-bs-toggle="dropdown" href="#"><i
                                class="fas fa-search"></i></a>
                            <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in"
                                 aria-labelledby="searchDropdown">
                                <form class="me-auto navbar-search w-100">
                                    <div class="input-group"><input class="bg-light form-control border-0 small"
                                                                    type="text" placeholder="Search for ...">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary py-0" type="button"><i
                                                    class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item dropdown no-arrow mx-1">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#"><span
                                    class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                    <h6 class="dropdown-header">alerts center</h6><a
                                        class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="me-3">
                                        <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div><span class="small text-gray-500">December 12, 2019</span>
                                        <p>A new monthly report is ready to download!</p>
                                    </div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="me-3">
                                        <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div><span class="small text-gray-500">December 7, 2019</span>
                                        <p>$290.29 has been deposited into your account!</p>
                                    </div>
                                </a><a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="me-3">
                                        <div class="bg-warning icon-circle"><i
                                                class="fas fa-exclamation-triangle text-white"></i></div>
                                    </div>
                                    <div><span class="small text-gray-500">December 2, 2019</span>
                                        <p>Spending Alert: We've noticed unusually high spending for your account.</p>
                                    </div>
                                </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All
                                    Alerts</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown no-arrow mx-1">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#"><span
                                    class="badge bg-danger badge-counter">7</span><i class="fas fa-envelope fa-fw"></i></a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                    <h6 class="dropdown-header">alerts center</h6><a
                                        class="dropdown-item d-flex align-items-center" href="#">
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
                                        <div class="text-truncate">
                                            <span>I have the photos that you ordered last month!</span></div>
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
                                </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All
                                    Alerts</a>
                                </div>
                            </div>
                            <div class="shadow dropdown-list dropdown-menu dropdown-menu-end"
                                 aria-labelledby="alertsDropdown"></div>
                        </li>
                        <div class="d-none d-sm-block topbar-divider"></div>
                        <li class="nav-item dropdown no-arrow">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link"
                                                                       aria-expanded="false" data-bs-toggle="dropdown"
                                                                       href="#"><span
                                    class="d-none d-lg-inline me-2 text-gray-600 small">Valerie Luna</span><img
                                    class="border rounded-circle img-profile"
                                    src="/assets/img/avatars/avatar1.jpeg"></a>
                                <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Settings</a><a
                                        class="dropdown-item" href="#"><i
                                        class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Activity log</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#"><i
                                            class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">

                <div class="card shadow">
                    <div class="card-header py-5" >
                        <p class="text-primary m-0 fw-bold">Ticket Info</p>
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
                                    <th>Tên vé</th>
                                    <th>Loại vé</th>
                                    <th>Ghi chú</th>
                                    <th>Giá vé</th>
                                    <th>Hạn sử dụng</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty tickets}">

                                    <c:forEach items="${tickets}" var="tickets">

                                        <tr id="ticket_${tickets.t_id}">
                                            <td>${tickets.t_id}</td>
                                            <td>${tickets.t_name}</td>
                                            <td>${tickets.tt_id}</td>
                                            <td>${tickets.t_note}</td>
                                            <td>${tickets.t_price} vnd</td>
                                            <td>${tickets.t_total_days} ngày</td>
                                            <td>${tickets.t_status}</td>
                                            <td>${tickets.create_date}</td>
                                            <td>
                                                <a onclick="viewDetailTicket(${tickets.t_id})" data-bs-toggle="modal"
                                                   data-bs-target="#exampleModal">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-primary"></i>
                                                </a>

                                                <a onclick="deleteTicket(${tickets.t_id})">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger"
                                                       title="Xóa vé"></i>
                                                </a>
                                            </td>
                                        </tr>

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
                    <button id="addTicket" type="button" class="btn btn-primary d-flex justify-content-center"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add new
                    </button>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div style="max-width: 950px; margin-left: 80px">
                <div class="modal-dialog text-center">
                    <div style="width: 750px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button id="btn-close" type="button" class="btn-close " data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="py-5">
                                <div class="container">
                                    <p id="title-form" class="text-dark h2 text-center">Tạo mới vé tập</p>

                                    <div id="addNewTicketForm">
                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" for="ticketName">Tên vé:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="ticketName" name=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" for="tickeType">Loại vé:</label>
                                                <div class="col-sm-6">
                                                    <select id="tickeType" class="form-select">

                                                        <option disabled selected hidden>Chọn loại vé</option>
                                                        <c:forEach items="${ticketTypes}" var="ticketTypes">
                                                            <option value="${ticketTypes.tt_id}">${ticketTypes.name}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" for="ticketPrice">Giá vé:</label>
                                                <div class="col-sm-6">
                                                    <input type="text"  min="0" class="form-control"
                                                           id="ticketPrice" name=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" for="t_time">Hạn sử dụng:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" min="1" max="365"
                                                           placeholder="Total day" class="form-control" id="t_time"
                                                           name=""/>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" for="createDate">Ngày tạo:</label>
                                                <div class="col-sm-6">
                                                    <input type="date" class="form-control" id="createDate" name=""/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <button style="width: 200px;" id="btnTickets" value="create"
                                                        class="btn btn-primary btn-block mt-5">Create
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>

</body>
<script src="/assets/js/jquery.min.js"></script>
<script>

    let id_ticket;

    $("#addTicket").click(function () {
        $("title-form").html("Tạo mới vé tập")
        $("#ticketName").val("");
        $("#ticketPrice").val("");
        $("#t_time").val("");
        $("#createDate").val("");
        $("#btnTickets").html("Thêm mới").prop('value', 'create');
    });

    function viewDetailTicket(u_id) {
        $.ajax({
            type: 'GET',
            url: '<c:url value="/admin/ticket-management/" />' + u_id,
            dataType: 'json',
            contentType: 'application/json',
            success: function (result) {
                $("#title-form").html("Cập nhập vé tập")
                $("#ticketName").val(result.t_name);
                $("#ticketPrice").val(result.t_price);
                $("#t_time").val(result.t_total_days);
                $("#createDate").val(result.create_date);
                $("#btnTickets").html("Cập nhập").prop('value', 'update');
                id_ticket = result.t_id;
            },
            error: function (error) {
                console.log(error);
            }
        })
    }

    function deleteTicket(u_id) {
        $.ajax({
            type: 'DELETE',
            url: '<c:url value="/admin/ticket-management/" />' + u_id,
            success: function (result) {
                $("#ticket_" + u_id).remove();
            },
            error: function (error) {
                console.log(error);
            }
        })
    }

    $("#btnTickets").click(function () {
        var ticketname = $("#ticketName").val();
        var tickettype = $("#tickeType").val();
        var price = $("#ticketPrice").val();
        var total_day = $("#t_time").val();
        var create_date = $("#createDate").val();
        var checkacction = $("#btnTickets").val();
        var method = 'POST'
        var url = '<c:url value="/admin/ticket-management" />'
        if (checkacction == 'update') {
            method = 'PUT';
            url += "/" + id_ticket;
        }
        $.ajax({
            type: method,
            url: url,
            dataType: 'json',
            data: JSON.stringify({
                t_name: ticketname,
                tt_id: parseInt(tickettype),
                t_price: price,
                t_total_days: parseInt(total_day),
                create_date: create_date,
            }),
            contentType: 'application/json',
            success: function (result) {
            },
            error: function (error) {
                console.log(error);
            }
        })
        window.location.href = "http://localhost:8080/admin/dashboard/tickets"
    })


</script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>

</html>




