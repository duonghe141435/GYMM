<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Doanh thu sản phẩm</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 95px">

                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Doanh thu từ bán vé</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div>
                                    <label class="form-label">Năm&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" id="year-revenue-ticket">
                                            <option value="0" selected>Tất cả</option>
                                            <c:forEach items="${year}" var="year">
                                                <option value="${year}">${year}</option>
                                            </c:forEach>
                                        </select>&nbsp;</label>
                                    <label class="form-label" id="month-label" style="padding-left: 60px">Tháng&nbsp;
                                        <select class="d-inline-block form-select form-select-sm" id="month-revenue-ticket">
                                            <option value="0" selected>Tất cả</option>
                                            <option value="1">Tháng 1</option>
                                            <option value="2">Tháng 2</option>
                                            <option value="3">Tháng 3</option>
                                            <option value="4">Tháng 4</option>
                                            <option value="5">Tháng 5</option>
                                            <option value="6">Tháng 6</option>
                                            <option value="7">Tháng 7</option>
                                            <option value="8">Tháng 8</option>
                                            <option value="9">Tháng 9</option>
                                            <option value="10">Tháng 10</option>
                                            <option value="11">Tháng 11</option>
                                            <option value="12">Tháng 12</option>
                                        </select>&nbsp;</label>
                                    <div id="radio-label">
                                        <label class="form-label" style="padding-left: 80px">Theo ngày bán vé&nbsp;
                                            <input type="radio" checked value="day" name="type-choose" id="choose-day">
                                        </label>
                                        <label class="form-label" style="padding-left: 60px">Theo loại vé&nbsp;
                                            <input type="radio" value="ticket" name="type-choose" id="choose-ticket">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%--<div class="mb-4">--%>
                                <%--<div class="card shadow border-start-primary py-2">--%>
                                    <%--<div class="card-body">--%>
                                        <%--<div class="row align-items-center no-gutters">--%>
                                            <%--<div class="col me-2">--%>
                                                <%--<div class="text-uppercase text-primary fw-bold text-xs mb-1"><span>Doanh thu cả năm</span></div>--%>
                                                <%--<div class="text-dark fw-bold h5 mb-0"><span class="class-price">${total_year}</span></div>--%>
                                            <%--</div>--%>
                                            <%--<div class="col-auto"><i class="fas fa-calendar fa-2x text-gray-300"></i></div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="col-10 table-responsive table mt-2" role="grid" style="max-height: 55vh;">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Năm</th>
                                        <th class="text-center">Tổng số tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                    <c:forEach items="${revenues}" var="revenues">
                                        <tr>
                                            <td class="text-center">Năm ${revenues.time}</td>
                                            <td class="class-price text-center"> ${revenues.total_money}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
<script>
    $(document).ready(function () {

        var year = $("#year-revenue-ticket");
        var month = $("#month-revenue-ticket");
        var label = $("#month-label");
        var label_radio = $("#radio-label");
        var table = $("#dataTable");
        var token = $("meta[name='_csrf']").attr("content");

        label.hide();
        label_radio.hide();

        year.on("change", function () {
            if ($(this).val() !== "0") {
                label.show();

            }else if ($(this).val() === "0") {
                label.hide();
                month.val($('#month-revenue-ticket option:first').val());
                $('input[name="type-choose"]:first').prop('checked', true);
                label_radio.hide();
            }
            var data = $(this).val();
            table.empty();

            $.ajax({
                type: "GET",
                url: 'http://localhost:8080/admin/revenue-management/'+data,
                success: function (respone) {

                    if(data === "0"){
                        var head = " <thead>\n" +
                            "<tr><th class=\"text-center\">Năm</th>\n" +
                            "<th class=\"text-center\">Tổng số tiền</th>\n" +
                            "</tr></thead>";

                        table.append(head);
                        const rows = respone.map(item => {
                        var formattedPrice = parseFloat(item.total_money).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                        const yearCell = $('<td>').addClass('text-center').text(item.time);
                        const moneyCell = $('<td>').addClass('text-center').text(formattedPrice);
                        const emptyCell = $('<td>');
                        return $('<tr>').append(yearCell, moneyCell, emptyCell);
                    });
                        table.append(rows);
                    }else {
                        var head = " <thead>\n" +
                            "<tr><th class=\"text-center\">Tháng</th>\n" +
                            "<th class=\"text-center\">Tổng số tiền</th>\n" +
                            "</tr></thead>";
                        table.append(head);
                        const rows = respone.map(item => {
                            var formattedPrice = parseFloat(item.total_money).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            const yearCell = $('<td>').addClass('text-center').text(item.time);
                            const moneyCell = $('<td>').addClass('text-center').text(formattedPrice);
                        return $('<tr>').append(yearCell, moneyCell);
                    });
                        table.append(rows);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                }
            });
        });

        month.on("change", function () {
            if ($(this).val() !== "0") {
                label_radio.show();
            }else if ($(this).val() === "0") {
                label_radio.hide();
            }

            var selectedValue = $('input[name="type-choose"]:checked').val();
            var data = {
                "year" : year.val(),
                "month" : $(this).val(),
                "type" : selectedValue,
                _csrf : token
            };
            table.empty();

            $.ajax({
                type: "POST",
                url: 'http://localhost:8080/admin/revenue-management/',
                data : data,
                success: function (respone) {
                    if( respone.length === 0){
                      var rows = "Tháng này không phát sinh mua bán";
                        table.append(rows);
                    }else{
                        if(data === "0"){
                            var head = " <thead>\n" +
                                "<tr><th class=\"text-center\">Ngày</th>\n" +
                                "<th class=\"text-center\">Tổng số tiền</th>\n" +
                                "</tr></thead>";

                            table.append(head);
                            const rows = respone.map(item => {
                            var formatted = parseFloat(item.total_money).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            var yearCell = $('<td>').addClass('text-center').text(item.time);
                            var moneyCell = $('<td>').addClass('text-center').text(formatted);
                            return $('<tr>').append(yearCell, moneyCell);
                        });
                            table.append(rows);
                        }else {
                            var head = " <thead>\n" +
                                "<tr><th class=\"text-center\">Ngày</th>\n" +
                                "<th class=\"text-center\">Tổng số tiền</th>\n" +
                                "</tr></thead>";
                            table.append(head);
                            const rows = respone.map(item => {
                            var formattedPrice = parseFloat(item.total_money).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            const yearCell = $('<td>').addClass('text-center').text(item.time);
                            const moneyCell = $('<td>').addClass('text-center').text(formattedPrice);
                            return $('<tr>').append(yearCell, moneyCell);
                        });
                            table.append(rows);
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                }
            });
        });

        $("input[name='type-choose']").change(function() {
            var selectedValue = $(this).val();
            var data = {
                "year" : year.val(),
                "month" : month.val(),
                "type" : selectedValue,
                _csrf : token
            };
            table.empty();
            $.ajax({
                type: "POST",
                url: 'http://localhost:8080/admin/revenue-management/',
                data : data,
                success: function (respone) {
                    if( respone.length === 0) {
                        var rows = "Tháng này không phát sinh mua bán";
                        table.append(rows);
                    }else{
                        if(data === "0"){
                            var head = " <thead>\n" +
                                "<tr><th class=\"text-center\">Ngày</th>\n" +
                                "<th class=\"text-center\">Tổng số tiền</th>\n" +
                                "</tr></thead>";

                            table.append(head);
                            const rows = respone.map(item => {
                                var formattedPrice = parseFloat(item.total_money).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            const yearCell = $('<td>').addClass('text-center').text(item.time);
                            const moneyCell = $('<td>').addClass('text-center').text(formattedPrice);
                            return $('<tr>').append(yearCell, moneyCell);
                        });
                            table.append(rows);
                        }else {
                            var head = " <thead>\n" +
                                "<tr><th class=\"text-center\">Ngày</th>\n" +
                                "<th class=\"text-center\">Tổng số tiền</th>\n" +
                                "</tr></thead>";
                            table.append(head);
                            const rows = respone.map(item => {
                                var formattedPrice = parseFloat(item.total_money).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                            const yearCell = $('<td>').addClass('text-center').text(item.time);
                            const moneyCell = $('<td>').addClass('text-center').text(formattedPrice);
                            return $('<tr>').append(yearCell, moneyCell);
                        });
                            table.append(rows);
                        }
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                }
            });
        });

    })
</script>
</body>
</html>