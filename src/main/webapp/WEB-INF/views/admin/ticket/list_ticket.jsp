<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Danh sách vé</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 82%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé</p>
                        <button class="btn btn-primary" id="show-add-ticket" data-bs-toggle="modal"
                                data-bs-target="#ticket" style="font-weight: 700;">Thêm mới vé tập</button>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Loại vé&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" id="type-ticket">
                                            <c:if test="${type == 1}">
                                                <option value="1" selected="">Vé vào của</option>
                                                <option value="2">Vé thuê huấn luyện viên</option>
                                                <option value="3">Vé tham gia lớp học</option>
                                                <option value="0">Bị xóa</option>
                                            </c:if>
                                            <c:if test="${type == 2}">
                                                <option value="1">Vé vào của</option>
                                                <option value="2" selected>Vé thuê huấn luyện viên</option>
                                                <option value="3">Vé tham gia lớp học</option>
                                                <option value="0">Bị xóa</option>
                                            </c:if>
                                            <c:if test="${type == 3}">
                                                <option value="1">Vé vào của</option>
                                                <option value="2">Vé thuê huấn luyện viên</option>
                                                <option value="3" selected>Vé tham gia lớp học</option>
                                                <option value="0">Bị xóa</option>
                                            </c:if>
                                            <c:if test="${type == 0}">
                                                <option value="1">Vé vào của</option>
                                                <option value="2">Vé thuê huấn luyện viên</option>
                                                <option value="3">Vé tham gia lớp học</option>
                                                <option value="0" selected>Bị xóa</option>
                                            </c:if>
                                        </select>&nbsp;
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" style="max-height: 100vh;">
                            <table class="table my-0" id="ticket-table">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>Tên vé</th>
                                    <th>Loại vé</th>
                                    <th class="text-center">Giá vé</th>
                                    <th class="text-center">Hạn sử dụng</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Ngày tạo</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody style="display: contents;width: 100%;overflow: auto;">
                                <c:if test="${not empty tickets}"><c:forEach items="${tickets}" var="tickets">
                                    <tr>
                                        <td><count></count></td>
                                        <td class="ticket-id" hidden aria-readonly="true">${tickets.t_id}</td>
                                        <td>${tickets.t_name}</td>
                                        <c:choose>
                                            <c:when test="${tickets.tt_id == 1}">
                                                <td>Vé vào cửa</td>
                                                <td class="class-price text-center">${tickets.t_price}</td>
                                            </c:when>
                                            <c:when test="${tickets.tt_id == 2}">
                                                <td>Vé thuê huấn luyện viên</td>
                                                <c:if test="${tickets.trainer_price_min == 0 && tickets.trainer_price_max == 0}">
                                                    <td class="class-price text-center">Chưa được định giá</td>
                                                </c:if>
                                                <c:if test="${tickets.trainer_price_min ==  tickets.trainer_price_max && tickets.trainer_price_min != 0 && tickets.trainer_price_min != 0}">
                                                    <td class="class-price text-center">${tickets.trainer_price_max}</td>
                                                </c:if>
                                                <c:if test="${tickets.trainer_price_max - tickets.trainer_price_min > 0}">
                                                    <td class="text-center"><span class="class-price">${tickets.trainer_price_min}</span> - <span class="class-price">${tickets.trainer_price_max}</span></td>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <td>Vé tham gia lớp học</td>
                                                <c:if test="${tickets.class_price_min == 0 && tickets.class_price_min == 0}">
                                                    <td class="class-price text-center">Chưa được định giá</td>
                                                </c:if>
                                                <c:if test="${tickets.class_price_min != 0 && tickets.class_price_max != 0 && tickets.class_price_min == tickets.class_price_max}">
                                                    <td class="class-price text-center">${tickets.class_price_max}</td>
                                                </c:if>
                                                <c:if test="${tickets.class_price_min !=  tickets.class_price_max}">
                                                    <td class="text-center"><span class="class-price">${tickets.class_price_min}</span> - <span class="class-price">${tickets.class_price_max}</span></td>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <td class="text-center"><span>${tickets.t_total_days}</span> ngày</td>
                                        <td class="status text-center">
                                            <c:if test="${tickets.t_status == 1}"><span class="active">Đang bán</span></c:if>
                                            <c:if test="${tickets.t_status == -1}"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></c:if>
                                            <c:if test="${tickets.t_status == 0}"><span class="danger">Bị xóa</span></c:if>
                                        </td>
                                        <td class="text-center">${tickets.create_date}</td>
                                        <td class="text-center">
                                            <a class="ticket-view">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Thông tin chi tiết"></i></a>
                                            <c:if test="${tickets.t_status != 0}">
                                                <a class="ticket-delete">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </c:if>

                                        </td>
                                    </tr>
                                </c:forEach></c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p>Tổng số bản ghi: <span>${count}</span></p>
                            </div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <c:forEach var="pageIndex" begin="1" end="${totalPages}">
                                            <c:set var="isActive" value="${pageIndex == pagination}" />
                                            <!-- Kiểm tra xem chỉ mục có phải là chỉ mục được chọn hay không -->
                                            <c:choose>
                                                <c:when test="${isActive}">
                                                    <li class="page-item active"><a class="page-link" href="<c:url value="/admin/ticket/page=${pageIndex}-type=${type}" />">${pageIndex}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/ticket/page=${pageIndex}-type=${type}" />">${pageIndex}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/admin/ticket/modal_ticket.jsp"%>
        <%@include file="/WEB-INF/views/admin/ticket/modal_ticket_trainer.jsp"%>
        <%@include file="/WEB-INF/views/admin/ticket/modal_ticket_class.jsp"%>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
<script>

    $(document).ready(function () {

        var employee_status = $("#type-ticket");
        employee_status.on("change", function () {
            var data = $(this).val();
            window.location.href = 'http://localhost:8080/admin/ticket/page=1-type='+data;
        });

        var today = moment().format('YYYY-MM-DD');
        var table_ticket = $("#ticket-table");
        var btn_add_ticket = $("#add-ticket");
        var btn_close_ticket = $("#close-ticket");
        var show_add_ticket = $("#show-add-ticket");

        var btn_show_trainer = $("#show-add-trainer");
        var btn_show_class = $("#show-add-class");
        var btn_close_class = $("#close-add-class");

        var price_error = $(".price-error");
        var price = $("#ticket-price-value");
        var ticket_price = $("#ticket-price");

        var list_trainer = [];
        var list_class = [];
        var table_trainer = $("#trainer-table");

        var btn_add_trainer = $("#btn-add-trainer");
        var btn_close_trainer = $("#close-add-trainer");
        var price_trainer = $("#trainer-price");
        var trainer_select = $("#trainer-select");
        var save_trainer = $("#btn-save-trainer");

        var class_name = $("#class-name");
        var trainer_class = $("#trainer-class");
        var btn_add_class = $("#btn-add-class");
        var table_class =  $("#class-table");
        var price_class =  $("#class-price");
        var time_select = $("#time-select");
        var max_member = $("#max-member");
        var start_date = $("#date-start");

        const Toast = Swal.mixin({
            toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }})

        table_ticket.on('click', '.ticket-view', function () {
            var ids = $(this).parent().siblings('.ticket-id').text();
            window.location.href = 'http://localhost:8080/admin/ticket-detail/'+ids;
        });

        btn_close_trainer.click(function () {
            if(list_trainer.length === 0){
                show_add_ticket.click();
            }else {
                Toast.fire({icon: 'info', title: 'Dữ liệu đã tự động lưu lại!'});
                show_add_ticket.click();
            }
        });
        btn_close_class.click(function () {
            if(list_class.length === 0){
                show_add_ticket.click();
            }else {
                Toast.fire({icon: 'info', title: 'Dữ liệu đã tự động lưu lại!'});
                show_add_ticket.click();
            }});

        //===Tciket type====
        var ticket_type = $("#ticket-type");
        ticket_type.on("change", function () {
            if ($(this).val() === "2") {
                btn_show_trainer.show();
                btn_show_class.hide();
                ticket_price.hide();
                ticket_name.val('');
                price.val('');
                price_error.hide();
            }else if($(this).val() === "3"){
                btn_show_class.show();
                btn_show_trainer.hide();
                ticket_price.hide();
                ticket_name.val('');
                price.val('');
                price_error.hide();
            }else{
                btn_show_trainer.hide();
                btn_show_class.hide();
                ticket_price.show();
                ticket_name.val('');
                price.val('');
                price_error.hide();
            }
        });

        price.on("input", function () { var input = $(this).val();
            input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
            if (parseInt(input) < 1000 || parseInt(input) > 20000000) {
                price_error.show();
            }else{ price_error.hide();}
            input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
            $(this).val(input);
        });

        price_trainer.on("input", function () {
            var input = $(this).val();
            input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
            if (parseInt(input) < 1000 || parseInt(input) > 20000000) {
                price_error.show();
            } else {
                price_error.hide();
                input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
                $(this).val(input);
            }
        });

        // price_class.on("input", function () {
        //     var input = $(this).val();
        //     input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
        //     if (parseInt(input) < 1000 || parseInt(input) > 5000000) {
        //         price_error.show();
        //     } else {
        //         price_error.hide();
        //         input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
        //         $(this).val(input);
        //     }
        // });

        var day = $("#ticket-day");
        day.on("change", function () {
            if ($(this).val() === "-1") {day_other.show();}else{day_other.hide();}
        });

        btn_add_trainer.click(function () {
            var _price_trainer = price_trainer.val().replace(/\D/g, "");
            var _id = trainer_select.val();
            var _id_check = list_trainer.map(function(item) {return item._id;});
            var newrow = $("<tr>");

            if (_id_check.includes(_id)) {
                Swal.fire({ title: 'Huấn luyện viên đã có vé', text:"Huấn luyện viên đã có vé này, bạn không thể tiếp tục thêm",
                    icon: 'info'
                })
            } else {
                var data = {
                    '_id' : _id,
                    '_price' : parseFloat(_price_trainer)
                };
                var trainer_name = trainer_select.find(':selected').text();
                var vndPrice = parseFloat(_price_trainer).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                list_trainer.push(data);
                newrow.append(
                    '<td>' + trainer_name + '</td>' +
                    '<td class="class-price">' + vndPrice + '</td>' +
                    '<td style="text-align: center"><a class="delete-trainer">' +
                    '<i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                );
                table_trainer.append(newrow);
            }
        });

        table_trainer.on('click', '.delete-trainer', function () {
            var row = $(this).closest('tr');
            var _index = $(this).closest('tr').index();
            list_trainer.splice(_index,1);
            row.remove();
        });

        var ticket_name = $("#ticket-name");//ten cua ve
        var day_other = $("#day-other");//chon ngay mac dinh
        var day_value = $("#day-value");// ngay thay the neu khong phai ngay mac dinh

        btn_add_ticket.click(function () {

            var _name = ticket_name.val();
            var _price = price.val().replace(/\D/g, "");
            var _day = day.val();
            var _day_other = day_value.val().replace(/\D/g, "");
            var _type = ticket_type.val();
            var _type_name = ticket_type.find(':selected').text();
            var token = $("meta[name='_csrf']").attr("content");
            var showday;
            var swal;
            var status;
            var vndPrice;

            if (_day === '-1') {
                showday = _day_other;
            } else {
                showday = _day;
            }

            var data;

            if($.trim(_name) === ''  || ((_day === '-1' && $.trim(_day_other) === '') || (parseInt(_day_other) < 1 || parseInt(_day_other) > 364)) ) {
                Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
            }else {
                if(_type == 1) {
                    if ($.trim(_price) === '' || (parseInt(_price) < 1000 || parseInt(_price) > 20000000)) {
                        Swal.fire('Xin hãy điền đúng giá tiền của vé', '', 'warning');
                    } else {
                        data = {
                            '_name': _name,
                            '_price': _price,
                            '_day': _day,
                            '_type': _type,
                            '_day_other': _day_other,
                            _csrf: token
                        };
                        swal = Swal.fire({
                            title: 'Bạn chắc chắn thêm vé này?',
                            icon: 'question',
                            confirmButtonText: 'Đúng vậy',
                            showCancelButton: true,
                            cancelButtonText: 'Không!'
                        });
                        status = '<td class="status text-center"><span class="active">Đang bán</span></td>';
                        vndPrice = parseFloat(_price).toLocaleString('vi-VN', {
                            style: 'currency',
                            currency: 'VND'
                        }).replace("₫", " ₫");
                        _price = '<td class="text-center">' + vndPrice + '</td>';
                        swal.then((result) => {
                            if (result.isConfirmed) {
                            $.ajax({
                                type: "POST",
                                url: 'http://localhost:8080/admin/ticket-management/add-ticket',
                                data: data,
                                success: function (respone) {
                                    var newrow = $("<tr>");
                                    newrow.append(
                                        '<td class="text-center"><count></count></td>' +
                                        '<td class="ticket-id" hidden aria-readonly="true">' + respone + '</td>' +
                                        '<td>' + _name + '</td>' +
                                        '<td>' + _type_name + '</td>' + _price +
                                        '<td class="text-center"><span>' + showday + '</span> ngày</td>' + status+
                                        '<td class="text-center">' + today + '</td>' +
                                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                    );
                                    table_ticket.prepend(newrow);
                                    btn_close_ticket.click();
                                    Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                                }
                            });
                        }else{
                            Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})
                        }
                        })
                    }
                }
                if (_type == 2) {
                    if (list_trainer.length == 0) {
                        data = {
                            '_name': _name,
                            '_price': _price,
                            '_day': _day,
                            '_type': _type,
                            '_day_other': _day_other,
                            _csrf: token
                        };
                        swal = Swal.fire({
                            title: 'Bạn chắc chắn thêm vé này?',
                            text: 'Bạn chưa thêm huấn luyện viên cho loại vé này',
                            icon: 'question',
                            confirmButtonText: 'Đúng vậy',
                            showCancelButton: true,
                            cancelButtonText: 'Không!'
                        });
                        status = '<td class="status text-center"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></td>';
                        _price = '<td class="text-center">Chưa được định giá</td>'
                        swal.then((result) => {
                            if (result.isConfirmed) {
                            $.ajax({
                                type: "POST",
                                url: 'http://localhost:8080/admin/ticket-management/add-ticket',
                                data: data,
                                success: function (respone) {
                                    var newrow = $("<tr>");
                                    newrow.append(
                                        '<td class="text-center"><count></count></td>' +
                                        '<td class="ticket-id" hidden aria-readonly="true">' + respone + '</td>' +
                                        '<td>' + _name + '</td>' +
                                        '<td>' + _type_name + '</td>' + _price +
                                        '<td class="text-center"><span>' + showday + '</span> ngày</td>' + status+
                                        '<td class="text-center">' + today + '</td>' +
                                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                    );
                                    table_ticket.prepend(newrow);
                                    btn_close_ticket.click();
                                    Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                                }
                            });
                        }else{
                            Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})
                        }
                    })
                    } else {
                        var _maxPrice, _minPrice;
                        var prices = list_trainer.map(function(item) {return item._price;});
                        var isSamePrice = list_trainer.every(function(item) {return item._price === list_trainer[0]._price;});

                        if(isSamePrice) {
                            var __price = prices[0].toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            _price = '<td class="class-price text-center">'+__price+'</td>'
                        } else {
                            // Tìm giá trị lớn nhất và giá trị nhỏ nhất trong mảng `prices`
                            _maxPrice = Math.max.apply(null, prices).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            _minPrice = Math.min.apply(null, prices).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

                            _price = '<td class="text-center"><span class="class-price">'+_minPrice+'</span> - <span class="class-price">'+_maxPrice+'</span></td>'
                        }
                        Swal.fire({ title: 'Bạn chắc chắn thêm vé này?', icon: 'question',
                            confirmButtonText: 'Đúng vậy', showCancelButton: true, cancelButtonText: 'Không!'}).then((result) => {
                            if (result.isConfirmed) {

                                data = {'_name': _name, '_day': _day, '_type': _type, '_list' : JSON.stringify(list_trainer),
                                '_day_other': _day_other, _csrf: token};
                            $.ajax({
                                type: "POST",
                                url: 'http://localhost:8080/admin/ticket-management/add-ticket-trainer',
                                data: data,
                                success: function (respone) {
                                    var newrow = $("<tr>");
                                    newrow.append(
                                        '<td class="text-center"><count></count></td>' +
                                        '<td class="ticket-id" hidden aria-readonly="true">' + respone + '</td>' +
                                        '<td>' + _name + '</td>' +
                                        '<td>' + _type_name + '</td>' +_price+
                                        '<td class="text-center"><span>' + showday + '</span> ngày</td>' +
                                        '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                                        '<td class="text-center">' + today + '</td><a class="ticket_plus">' +
                                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xem vé"></i></a>' +
                                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                    );
                                    Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                    table_ticket.append(newrow);
                                    btn_close_ticket.click();
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                                }
                            })

                        }else {Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})}})
                    }
                }
                if (_type == 3) {
                    if (list_class.length == 0) {
                        data = {
                            '_name': _name,
                            '_price': _price,
                            '_day': _day,
                            '_type': _type,
                            '_day_other': _day_other,
                            _csrf: token
                        };
                        swal = Swal.fire({
                            title: 'Bạn chắc chắn thêm vé này?',
                            text: 'Sau khi vé được thêm. trang sẽ được chuyển đến trang thêm lớp học để hoàn thiện vé',
                            icon: 'question',
                            confirmButtonText: 'Đúng vậy',
                            showCancelButton: true,
                            cancelButtonText: 'Không!'
                        });
                        status = '<td class="status text-center"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></td>';
                        _price = '<td class="text-center">Chưa được định giá</td>';
                        swal.then((result) => {
                            if (result.isConfirmed) {
                            $.ajax({
                                type: "POST",
                                url: 'http://localhost:8080/admin/ticket-management/add-ticket',
                                data: data,
                                success: function (respone) {
                                    var newrow = $("<tr>");
                                    newrow.append(
                                        '<td class="text-center"><count></count></td>' +
                                        '<td class="ticket-id" hidden aria-readonly="true">' + respone + '</td>' +
                                        '<td>' + _name + '</td>' +
                                        '<td>' + _type_name + '</td>' + _price +
                                        '<td class="text-center"><span>' + showday + '</span> ngày</td>' + status+
                                        '<td class="text-center">' + today + '</td>' +
                                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                    );
                                    table_ticket.prepend(newrow);
                                    btn_close_ticket.click();
                                    Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                    window.location.href = '<c:url value="/admin/class/new-class"/>'
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                                }
                            });
                        }else{
                            Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})
                        }
                    })
                    }
                }
                }
        });

        table_ticket.on('click', '.ticket-delete', function () {
            var ids = $(this).parent().siblings('.ticket-id').text();
            var row = $(this).closest('tr');
            var token = $("meta[name='_csrf']").attr("content");
            var data = {'_id' : ids, _csrf: token};

            Swal.fire({
                title: 'Bạn muốn xóa vé này chứ?',
                showDenyButton: true,
                confirmButtonText: 'Xóa',
                denyButtonText: 'Hoạc tác',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if(result.isConfirmed){
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/admin/ticket-management/delete',
                    data: data,
                    success: function (result) {
                        row.remove();
                        Toast.fire({icon: 'info', title: 'Vé đã được xóa!'})
                    },
                    error: function (error) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Toast.fire({icon: 'info', title: 'Dừng xóa vé!'})
            }
        })
        });
    });


</script>
</html>