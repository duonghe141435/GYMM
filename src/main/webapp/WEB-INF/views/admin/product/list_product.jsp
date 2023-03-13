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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css' />">

    <style>
        .modal input, select{
            margin-top: 13px;
        }
    </style>
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
                                <div id="sort_price">
                                    <label class="form-label">Show&nbsp;
                                        <select class="d-inline-block form-select form-select-sm">
                                            <option disabled selected hidden>Chọn loại vé</option>
                                            <option value="25"></option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;
                                    </label>
                                </div>
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
                            <table class="table my-0" id="ticket_table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên sản phẩm</th>
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

                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing
                                    1 to 10 of 27</p>
                            </div>
                            <div class="col-md-6">
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
                            </div>
                        </div>
                    </div>
                    <button id="ticket_add" type="button" class="btn btn-primary d-flex justify-content-center"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add new
                    </button>
                </div>
            </div>
        </div>

        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>

</body>
<script src="/assets/js/jquery.min.js"></script>

<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</html>
