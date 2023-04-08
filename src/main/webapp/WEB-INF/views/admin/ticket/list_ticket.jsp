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
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé</p>
                        <button class="btn btn-primary" id="show-add-ticket" data-bs-toggle="modal"
                                data-bs-target="#ticket" style="font-weight: 700;">Thêm mới </button>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Show&nbsp;
                                        <select class="d-inline-block form-select form-select-sm">
                                            <option value="10" selected="">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter">
                                    <label class="form-label">
                                        <input type="search" class="form-control form-control-sm"  placeholder="Search">
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
                                        </td>
                                        <td class="text-center">${tickets.create_date}</td>
                                        <td class="text-center">
                                            <a class="ticket_plus">
                                                <i class="fas fa-plus-circle fa-lg fa-fw me-2 text-info" title="Thêm Huấn Luyện viên"></i></a>

                                            <a class="ticket-view">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-primary" title="Thôn tin chi tiết"></i></a>

                                            <a class="ticket-delete">
                                                <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
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
        var today = moment().format('YYYY-MM-DD');
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }})

        //=================Ticket===============
        var table_ticket = $("#ticket-table");
        var ticket_name = $("#ticket-name");
        var day = $("#ticket-day");
        var day_other = $("#day-other");
        var day_value = $("#day-value");
        var ticket_type = $("#ticket-type");
        var ticket_price = $("#ticket-price");
        var price = $("#ticket-price-value");

        var show_add_ticket = $("#show-add-ticket");
        var btn_add_ticket = $("#add-ticket");
        var btn_close_ticket = $("#close-ticket");
        var btn_show_trainer = $("#show-add-trainer");
        var btn_close_trainer = $("#close-add-trainer");
        var btn_show_class = $("#show-add-class");
        var btn_close_class = $("#close-add-class");
        //=================Ticket===============

        //=================Trainer===============
        var table_trainer = $("#trainer-table");
        var list_trainer = [];
        var btn_add_trainer = $("#btn-add-trainer");
        var price_trainer = $("#trainer-price");
        var trainer_select = $("#trainer-select");
        var save_trainer = $("#btn-save-trainer");



        //=================Trainer===============
        var list_class = [];
        var class_name = $("#class-name");
        var trainer_class = $("#trainer-class")
        var btn_add_class = $("#btn-add-class");
        var table_class =  $("#class-table");
        var class_price =  $("#class-price");
        var time_select = $("#time-select");
        var max_member = $("#max-member");
        var start_date = $("#date-start");


        var price_error = $(".price-error");

        price.on("input", function () { var input = $(this).val();
            input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
            if (parseInt(input) < 1000 || parseInt(input) > 500000) {
                price_error.show();
            }else{ price_error.hide();}
            input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
            $(this).val(input);
        });

        day.on("change", function () {
            if ($(this).val() === "-1") {day_other.show();}else{day_other.hide();}
        });

        $('.class-price').each(function () {
            var price = parseFloat($(this).text());
            if (!isNaN(price)) {$(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
        });

        btn_close_trainer.click(function () {
            if(list_trainer.length === 0){
                show_add_ticket.click();
            }else {
                Toast.fire({icon: 'info', title: 'Dữ liệu đã tự động lưu lại!'})
                show_add_ticket.click();
            }
        });
        btn_close_class.click(function () {
            if(list_class.length === 0){
                show_add_ticket.click();
            }else {
                Toast.fire({icon: 'info', title: 'Dữ liệu đã tự động lưu lại!'})
                show_add_ticket.click();
            }});
        btn_close_ticket.click(function () {});

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

        btn_add_ticket.click(function () {
            var _name = ticket_name.val();
            var _price = price.val().replace(/\D/g, "");
            var _day = day.val();
            var _day_other = day_value.val().replace(/\D/g, "");
            var _type = ticket_type.val();
            var _type_name = ticket_type.find(':selected').text();
            var token = $("meta[name='_csrf']").attr("content");
            var showday;
            if (_day === '-1') {
                showday = _day_other;
            } else {
                showday = _day;
            }

            if(ticket_type.val() === "2") {
                if (list_trainer.length === 0) {
                    var data = {'_name': _name, '_price': _price, '_day': _day, '_type': _type, '_day_other': _day_other, _csrf: token};
                    if ($.trim(_name) === '' || ((_day === '-1' && $.trim(_day_other) === '') || (parseInt(_day_other) < 1 || parseInt(_day_other) > 364))) {
                        Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
                    } else {
                        Swal.fire({
                            title: 'Bạn chắc chắn thêm vé này?',
                            text: 'Bạn chưa thêm huấn luyện viên cho loại vé này',
                            icon: 'question',
                            confirmButtonText: 'Đúng vậy',
                            showCancelButton: true,
                            cancelButtonText: 'Không!'
                        }).then((result) => {
                            if(result.isConfirmed){
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
                                        '<td>' + _type_name + '</td>' +
                                        '<td class="text-center">Chưa được xác định</td>' +
                                        '<td class="text-center"><span>' + showday + '</span> ngày</td>' +
                                        '<td class="status text-center"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></td>' +
                                        '<td class="text-center">' + today + '</td><a class="ticket_plus">\n' +
                                        '<i class="fas fa-plus-circle fa-lg fa-fw me-2 text-info" title="Thêm Huấn Luyện viên"></i></a>' +
                                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                    );
                                    Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                    table_ticket.append(newrow);
                                    btn_close_ticket.click();
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                                }
                            });
                        } else{Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})}
                    })}
                } else {
                    var maxPrice, minPrice;
                    var _maxPrice, _minPrice;
                    var price_show;

                    var prices = list_trainer.map(function(item) {
                        return item._price;
                    });

                    var isSamePrice = list_trainer.every(function(item) {
                        return item._price === list_trainer[0]._price;
                    });

                    if(isSamePrice) {
                        var __price = prices[0].toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                        price_show = '<td class="class-price text-center">'+__price+'</td>'
                    } else {

                        // Tìm giá trị lớn nhất và giá trị nhỏ nhất trong mảng `prices`
                        maxPrice = Math.max.apply(null, prices);
                        minPrice = Math.min.apply(null, prices);

                        _maxPrice = maxPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                        _minPrice = minPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

                        price_show = '<td class="text-center"><span class="class-price">'+_minPrice+'</span> - <span class="class-price">'+_maxPrice+'</span></td>'
                    }

                    var data = {'_name': _name, '_day': _day, '_type': _type, '_list' : JSON.stringify(list_trainer),
                        '_day_other': _day_other, _csrf: token};

                    Swal.fire({ title: 'Bạn chắc chắn thêm vé này?', icon: 'question',
                        confirmButtonText: 'Đúng vậy', showCancelButton: true, cancelButtonText: 'Không!'}).then((result) => {
                        if (result.isConfirmed) {
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
                                    '<td>' + _type_name + '</td>' +price_show+
                                    '<td class="text-center"><span>' + showday + '</span> ngày</td>' +
                                    '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                                    '<td class="text-center">' + today + '</td><a class="ticket_plus">\n' +
                                    '<i class="fas fa-plus-circle fa-lg fa-fw me-2 text-info" title="Thêm Huấn Luyện viên"></i></a>' +
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
            }else if(ticket_type.val() === "3"){
                if(list_class.length === 0){
                    var data = {'_name': _name, '_price': _price, '_day': _day, '_type': _type, '_day_other': _day_other, _csrf: token};
                    Swal.fire({ title: 'Bạn chắc chắn thêm vé này?', text: 'Bạn chưa thêm lớp học cho loại vé này',
                        icon: 'question', confirmButtonText: 'Đúng vậy', showCancelButton: true, cancelButtonText: 'Không!'
                    }).then((result) => {
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
                                    '<td>' + _type_name + '</td>' +
                                    '<td class="text-center">Chưa được xác định</td>' +
                                    '<td class="text-center"><span>' + showday + '</span> ngày</td>' +
                                    '<td class="status text-center"><span class="waiting">Chưa bán - Thiếu huấn luyện viên</span></td>' +
                                    '<td class="text-center">' + today + '</td><a class="ticket_plus">\n' +
                                    '<i class="fas fa-plus-circle fa-lg fa-fw me-2 text-info" title="Thêm Huấn Luyện viên"></i></a>' +
                                    '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                                    '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                );
                                Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                table_ticket.append(newrow);
                                btn_close_ticket.click();
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                            }
                        });
                    }else {Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})}
                })
                }else{
                    var maxPrice, minPrice;
                    var _maxPrice, _minPrice;
                    var price_show;

                    var prices = list_class.map(function(item) {
                        return item._price;
                    });

                    var isSamePrice = list_class.every(function(item) {
                        return item._price === list_trainer[0]._price;
                    });

                    if(isSamePrice) {
                        var __price = prices[0].toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                        price_show = '<td class="class-price text-center">'+__price+'</td>'
                    } else {

                        // Tìm giá trị lớn nhất và giá trị nhỏ nhất trong mảng `prices`
                        maxPrice = Math.max.apply(null, prices);
                        minPrice = Math.min.apply(null, prices);

                        _maxPrice = maxPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                        _minPrice = minPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

                        price_show = '<td class="text-center"><span class="class-price">'+_minPrice+'</span> - <span class="class-price">'+_maxPrice+'</span></td>'
                    }

                    var data = {'_name': _name, '_day': _day, '_type': _type, '_list' : JSON.stringify(list_class),
                        '_day_other': _day_other, _csrf: token};

                    Swal.fire({ title: 'Bạn chắc chắn thêm vé này?', icon: 'question',
                        confirmButtonText: 'Đúng vậy', showCancelButton: true, cancelButtonText: 'Không!'}).then((result) => {
                        if (result.isConfirmed) {
                        $.ajax({
                            type: "POST",
                            url: 'http://localhost:8080/admin/ticket-management/add-ticket-class',
                            data: data,
                            success: function (respone) {
                                var newrow = $("<tr>");
                                newrow.append(
                                    '<td class="text-center"><count></count></td>' +
                                    '<td class="ticket-id" hidden aria-readonly="true">' + respone + '</td>' +
                                    '<td>' + _name + '</td>' +
                                    '<td>' + _type_name + '</td>' +price_show+
                                    '<td class="text-center"><span>' + showday + '</span> ngày</td>' +
                                    '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                                    '<td class="text-center">' + today + '</td><a class="ticket_plus">\n' +
                                    '<i class="fas fa-plus-circle fa-lg fa-fw me-2 text-info" title="Thêm Huấn Luyện viên"></i></a>' +
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
            }else{
                var data = {'_name' : _name, '_price' : _price, '_day' : _day, '_type' : _type ,'_day_other' : _day_other, _csrf: token};
                if($.trim(_name) === '' || $.trim(_price) === '' || (parseInt(_price) < 1000 || parseInt(_price) > 50000) ||
                    ((_day === '-1' && $.trim(_day_other) === '') || (parseInt(_day_other) < 1 || parseInt(_day_other) > 364)) ){

                    Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
                } else{
                    Swal.fire({ title: 'Bạn chắc chắn thêm vé này?', icon: 'question',
                        confirmButtonText: 'Đúng vậy', showCancelButton: true, cancelButtonText: 'Không!'}).then((result) => {
                        if (result.isConfirmed) {
                        $.ajax({
                            type: "POST",
                            url: 'http://localhost:8080/admin/ticket-management/add-ticket',
                            data: data,
                            success: function (respone) {
                                var vndPrice = parseFloat(_price).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                                var newrow = $("<tr>");
                                newrow.append(
                                    '<td class="text-center"><count></count></td>' +
                                    '<td class="ticket-id" hidden aria-readonly="true">' + respone + '</td>' +
                                    '<td>' + _name + '</td>' +
                                    '<td>' + _type_name + '</td>' +
                                    '<td class="text-center">' + vndPrice + '</td>' +
                                    '<td class="text-center"><span>' + showday + '</span> ngày</td>' +
                                    '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                                    '<td class="text-center">' + today + '</td>' +
                                    '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                                    '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                                );
                                Toast.fire({icon: 'success', title: 'Thêm vé thành công!'});
                                table_ticket.append(newrow);
                                btn_close_ticket.click();
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                            }
                        });
                    }else {Toast.fire({icon: 'info', title: 'Dừng thêm vé!'})}
                })
                }
            }
        });

        price_trainer.on("input", function () {
            var input = $(this).val();
            input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
            if (parseInt(input) < 1000 || parseInt(input) > 500000) {
                price_error.show();
            } else {
                price_error.hide();
                input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
                $(this).val(input);
            }
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

        btn_add_class.click(function () {
            var _price = class_price.val().replace(/\D/g, "");

            var _id = trainer_class.val();
            var _id_check = list_class.map(function(item) {return item._id;});
            var newrow = $("<tr>");

            var input_value = $('#my-input').val();
            var checkbox_values = [];
            var lichtap = '';
            $('table input[type="checkbox"]:checked').each(function() {
                checkbox_values.push($(this).attr('id'));
                if($(this).attr('id') === '1'){
                    lichtap += ' Cn '
                }
                if($(this).attr('id') === '2'){
                    lichtap += ' Thu2 '
                }
                if($(this).attr('id') === '3'){
                    lichtap += ' Thu3'
                }
                if($(this).attr('id') === '4'){
                    lichtap += ' Thu4 '
                }
                if($(this).attr('id') === '5'){
                    lichtap += ' Thu5 '
                }
                if($(this).attr('id') === '6'){
                    lichtap += ' Thu6 '
                }
                if($(this).attr('id') === '7'){
                    lichtap += ' Thu7 '
                }
            });

            if($.trim(class_name.val()) === '' || $.trim(_price) === '' || (parseInt(_price) < 1000 || parseInt(_price) > 50000)){
                Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
            } else if (_id_check.includes(_id)) {
                Swal.fire({ title: 'Huấn luyện viên đã có vé', text:"Huấn luyện viên đã có vé này, bạn không thể tiếp tục thêm",
                    icon: 'info'
                })
            }else if(checkbox_values.length === 0){
                Swal.fire('Thiếu lịch tập', 'Bạn quên chưa chọn lịch tập trong tuần rôi', 'warning')
            }else{
                var data = {
                    '_name': class_name.val(),
                    '_id': trainer_select.val(),
                    '_id_time': time_select.val(),
                    '_max_member': max_member.val(),
                    '_price': parseFloat(_price),
                    '_start_date': start_date.val(),
                    '_check': JSON.stringify(checkbox_values)
                };
                var trainer_name = trainer_select.find(':selected').text();
                var time_detail = time_select.find(':selected').text();
                var formattedPrice = parseFloat(_price).toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).replace("₫", " ₫");

                list_class.push(data);

                newrow.append(
                    '<td>' + class_name.val() + '</td>' +
                    '<td>' + trainer_name + '</td>' +
                    '<td>' + time_detail + '</td>' +
                    '<td>' + lichtap + '</td>' +
                    '<td class="class-price">' + formattedPrice + '</td>' +
                    '<td>' + start_date.val() + '</td>' +
                    '<td>' + max_member.val() + '</td>' +
                    '<td style="text-align: center"><a class="delete-class">' +
                    '<i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                );
                table_class.append(newrow);
            }
        });

        table_class.on('click', '.delete-class', function () {
            var row = $(this).closest('tr');
            var _index = $(this).closest('tr').index();
            list_class.splice(_index,1);
            row.remove();
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
                    url: 'http://localhost:8080/admin/ticket-management',
                    data:data,
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

        table_ticket.on('click', '.ticket-view', function () {
            var ids = $(this).parent().siblings('.ticket-id').text();
            window.location.href = 'http://localhost:8080/admin/dashboard/ticket-detail/'+ids;
        });
    });


</script>
</html>




