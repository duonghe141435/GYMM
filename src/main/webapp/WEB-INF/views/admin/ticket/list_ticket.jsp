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
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">

    <style>
        .modal input, select{
            margin-top: 13px;
        }


        count::before {
            /* Increment "my-sec-counter" by 1 */
            counter-increment: my-sec-counter;
            content: counter(my-sec-counter) ;
        }
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

                                        <tr>
                                            <td class="ticket_id">${tickets.t_id}</td>
                                            <td class="ticket_name">${tickets.t_name}</td>
                                            <td class="ticket_ttids">${tickets.tt_id}</td>
                                            <td class="ticket_note">${tickets.t_note}</td>
                                            <td class="ticket_price"><span>${tickets.t_price}</span> vnd</td>
                                            <td class="ticket_day"><span>${tickets.t_total_days}</span> ngày</td>
                                            <td>
                                                <c:if test="${tickets.t_status == true}">
                                                    Đang bán
                                                </c:if>
                                            </td>
                                            <td class="ticket_date">${tickets.create_date}</td>

                                            <td>
                                                <a class="ticket_view" data-bs-toggle="modal"
                                                   data-bs-target="#exampleModal">
                                                    <i class="fas fa-eye fa-lg fa-fw me-2 text-primary"></i>
                                                </a>

                                                <a class="ticket_delete">
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
        <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="py-5">
                        <div class="container">
                            <p id="title-form" class="text-dark h2 text-center">Tạo mới vé tập</p>

                            <div id="addNewTicketForm">
                                <div class="form-group">
                                    <div class="row d-flex justify-content-center">
                                        <label class="form-label col-sm-2 mt-3" for="ticket_name">Tên vé:</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="ticket_name" name=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row d-flex justify-content-center">
                                        <label class="form-label col-sm-2 mt-3" for="ticket_type">Loại
                                            vé:</label>
                                        <div class="col-sm-6">
                                            <select id="ticket_type" class="form-select">

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
                                        <label class="form-label col-sm-2 mt-3" for="ticket_price">Giá vé:</label>
                                        <div class="col-sm-6">
                                            <input type="text" min="0" class="form-control" id="ticket_price" name=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row d-flex justify-content-center">
                                        <label class="form-label col-sm-2 mt-3" for="ticket_day">Hạn sử
                                            dụng:</label>
                                        <div class="col-sm-6">
                                            <input type="number" min="1" max="365"
                                                   placeholder="Total day" class="form-control"
                                                   id="ticket_day"/>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="row d-flex justify-content-center">
                                        <label class="form-label col-sm-2 mt-3" for="ticket_date">Ngày
                                            tạo:</label>
                                        <div class="col-sm-6">
                                            <input type="date" class="form-control" id="ticket_date" name=""/>
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
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>

</body>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script>

    let id_ticket;

    $("#ticket_add").click(function () {
        $("#title-form").html("Tạo mới vé tập")
        $("#ticket_name").val("");
        $("#ticket_price").val("");
        $("#ticket_day").val("");
        $("#ticket_date").val("");
        $("#btnTickets").html("Thêm mới").prop('value', 'create');
    });

    $(document).ready(function () {
        $("#ticket_table").on('click', '.ticket_delete', function () {
            var ids = $(this).parent().siblings('.ticket_id').text();
            const row = $(this).closest('tr');
            Swal.fire({
                title: 'Bạn muốn xóa vé này chứ?',
                showDenyButton: true,
                confirmButtonText: 'Xóa',
                denyButtonText: 'Hoạc tác',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if(result.isConfirmed){
                $.ajax({
                    type: 'DELETE',
                    url: '<c:url value="/admin/ticket-management/" />' + ids,
                    success: function (result) {
                        row.remove();
                        Swal.fire('Vé đã được xóa!', '', 'success')
                    },
                    error: function (error) {
                        Swal.fire('Lỗi hệ thống', '', 'warning')
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Swal.fire('Hành động của bạn đã được thu hồi', '', 'info')
            }
        })
        });

        $("#ticket_table").on('click', '.ticket_view', function () {
            var ids = $(this).parent().siblings('.ticket_id').text();
            id_ticket = ids;
            $("#title-form").html("Cập nhập vé tập")
            $("#ticket_name").val($(this).parent().siblings('.ticket_name').text());
            $("#ticket_price").val($(this).parent().siblings('.ticket_price').children('span').text());
            $("#ticket_day").val($(this).parent().siblings('.ticket_day').children('span').text());
            $("#ticket_date").val($(this).parent().siblings('.ticket_date').text());
            $("#ticket_type").val($(this).parent().siblings('.ticket_ttids').text())
            $("#btnTickets").html("Cập nhập").prop('value', 'update');
        });
    });

    $("#btnTickets").click(function () {
        var ticketname = $("#ticket_name").val();
        var tickettype = $("#ticket_type").val();
        var price = $("#ticket_price").val();
        var total_day = $("#ticket_day").val();
        var create_date = $("#ticket_date").val();
        var checkacction = $("#btnTickets").val();

        var method = 'POST';
        var url = '<c:url value="/admin/ticket-management" />'
        if (checkacction == 'update') {
            method = 'PUT';
            url += "/" + id_ticket;
        }
        $.ajax({
            type: method,
            url: url,
            data: JSON.stringify({
                t_name: ticketname,
                tt_id: parseInt(tickettype),
                t_price: price,
                t_total_days: parseInt(total_day),
                create_date: create_date,
            }),
            contentType: 'application/json',
            success: function (respone) {
                Swal.fire('Thao thác thành công', '', 'info')
                $.modal.close();
            },
            error: function (error) {
                Swal.fire('Lỗi thực hiện thao thác này', '', 'error')
                console.log(error)
            }
        });
    })

</script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</html>




