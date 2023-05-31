<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Thêm lớp học</title>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 80%;text-align: left;margin-top: auto;margin-bottom: auto;">Thêm mới lớp học</p>
                        <a href="<c:url value='/admin/class'/> " class="btn btn-primary" style="font-weight: 700;">Trở lại danh sách lớp học</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4">
                                <div class="mb-3">
                                    <label class="form-label" for="class-name"><strong>Tên lớp</strong></label>
                                    <input class="form-control" type="text" id="class-name" placeholder="Nhập tên lớp học" />
                                </div>
                                <div class="mb-3">
                                    <label  class="form-label" for="ticket-select">Danh sách vé:</label>
                                    <select id="ticket-select" class="form-select" required>
                                        <c:forEach items="${tickets}" var="tickets">
                                            <option value="${tickets.t_id}">${tickets.t_name} - <span class="total-day">${tickets.t_total_days}</span> ngày</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="max-member"><strong>Member:</strong></label>
                                    <select id="max-member" class="form-select" required>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="mb-3">
                                    <div class="mb-3">
                                        <label class="form-label" for="trainer-class"><strong>Tên huấn luyện viên</strong></label>
                                        <select id="trainer-class" class="form-select">
                                            <c:forEach items="${trainer}" var="trainer">
                                                <option value="${trainer.u_id}">${trainer.u_full_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <label  class="form-label" for="time-select">Ca tập:</label>
                                    <select id="time-select" class="form-select" required>
                                        <c:forEach items="${times}" var="times">
                                            <option value="${times.id_time}">${times.start_time} - ${times.end_time}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="mb-3">
                                    <label class="form-label" for="date-start">Ngày bắt đầu:</label>
                                    <input type="date" class="form-control" id="date-start" required/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="class-price"><strong>Giá tham gia lớp học / 1 người</strong></label>
                                    <input class="form-control" type="text" id="class-price" placeholder="Nhập giá tiền"/>
                                    <div class="invalid-feedback price-error">
                                        Giá vé nằm trong khoảng từ 1.000vnd đến 20.000.000vnd
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-center" style="padding: 10px">
                                <label class="form-label"><strong>Lịch tập</strong></label>
                                <table id="schedule">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Thứ 2</th>
                                        <th class="text-center">Thứ 3</th>
                                        <th class="text-center">Thứ 4</th>
                                        <th class="text-center">Thứ 5</th>
                                        <th class="text-center">Thứ 6</th>
                                        <th class="text-center">Thứ 7</th>
                                        <th class="text-center">Chủ nhật</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-center"><input  type="checkbox" name="1" id="1"></td>
                                        <td class="text-center"><input  type="checkbox" name="1" id="2"></td>
                                        <td class="text-center"><input  type="checkbox" name="1" id="3"></td>
                                        <td class="text-center"><input  type="checkbox" name="1" id="4"></td>
                                        <td class="text-center"><input  type="checkbox" name="1" id="5"></td>
                                        <td class="text-center"><input  type="checkbox" name="1" id="6"></td>
                                        <td class="text-center"><input  type="checkbox" name="1" id="7"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <hr/>
                            <button style="width: 200px;"  class="btn btn-primary" id="btn-add-class">Thêm lớp học</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>


    $(document).ready(function () {
        var count = 0;
        var class_name = $("#class-name");
        var trainer_class = $("#trainer-class");
        var time_class = $("#time-select");
        var class_price = $("#class-price");
        var ticket_class = $("#ticket-select");
        var start_date_class = $("#date-start");
        var member = $("#max-member");

        var btn_add_class = $("#btn-add-class");


        var totalDay = ticket_class.find('option:selected').text();
        const optionArr = totalDay.split(' - ');
        const text_arr = optionArr[1].split(' ');
        var firstChar = text_arr[0];
        var maxSelect = parseInt(firstChar);

        class_price.on("input", function () {
            var input = $(this).val();
            input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
            if (parseInt(input) < 1000 || parseInt(input) > 20000000) {
                // price_error.show();
            } else {
                // price_error.hide();
                input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
                $(this).val(input);
            }
        });

        ticket_class.change(function() {
            var totalDay = $(this).find('option:selected').text();
            const optionArr = totalDay.split(' - ');
            const text_arr = optionArr[1].split(' ');
            firstChar = text_arr[0];
            maxSelect = 7;
            if(maxSelect >= parseInt(firstChar)){
                maxSelect = parseInt(firstChar);
            }else{
                maxSelect = parseInt(firstChar);
            }
            count = 0;
            $("input[type='checkbox']").prop("checked", false);
            $("input[type='checkbox']").prop("disabled", false);
            start_date_class.val("");
        });

        start_date_class.change(function () {
            var selectedDate = moment(this.value);
            var id;
            // Lấy thứ của ngày đã chọn
            $("input[type='checkbox']").prop("checked", false);
            $("input[type='checkbox']").prop("disabled", false);

            var dayOfWeek = selectedDate.format("dddd");
            if(dayOfWeek === 'Sunday'){
                id = $('#7');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
            if(dayOfWeek === 'Friday'){
                id = $('#5');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
            if(dayOfWeek === 'Monday'){
                id = $('#1');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
            if(dayOfWeek === 'Tuesday'){
                id = $('#2');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
            if(dayOfWeek === 'Wednesday'){
                id = $('#3');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
            if(dayOfWeek === 'Thursday'){
                id = $('#4');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
            if(dayOfWeek === 'Saturday'){
                id = $('#6');
                id.prop("checked", true);
                id.prop('disabled', true);
            }
        });

        // Số lượng tối đa các ngày có thể chọn
        $("#schedule input[type='checkbox']").change(function() {
            count = $("#schedule input[type='checkbox']:checked").length;
            if (count > maxSelect) {
                this.checked = false;
            }
        });

        btn_add_class.click(function () {
            var schedule = [];
            var currentDate = new Date();
            var selectedDaysOfWeek = []; // Thứ 2, thứ 5, thứ 6
            var _name = class_name.val();
            var _trainer = trainer_class.val();
            var _time = time_class.val();
            var _ticket = ticket_class.val();
            var _price = class_price.val().replace(/\D/g, "");
            var _date = start_date_class.val();
            var _max_member = member.val();
            var token = $("meta[name='_csrf']").attr("content");

            $('#schedule input[type="checkbox"]').each(function() {
                if ($(this).prop('checked')) {
                    schedule.push(1);
                    selectedDaysOfWeek.push(parseInt($(this).attr('id')) - 1)
                } else {
                    schedule.push(0);
                }
            });

            // Khởi tạo ngày bắt đầu và danh sách ngày trong tuần được chọn
            var startDate = moment(_date);

            var count = 0;
            var nextSelectedDate = startDate.clone();
            while (count < parseInt(firstChar) - 1) {
                if (selectedDaysOfWeek.includes(nextSelectedDate.day())) {
                    count++;
                }
                nextSelectedDate.add(1, 'days');
            }

            if($.trim(_name) === ''){
                Swal.fire({ title: 'Lớp chưa có tên', text:"Bạn cần nhập tên vé của lớp này", icon: 'warning'});
            }else if($.trim(_date) === ''){
                Swal.fire({ title: 'Lớp chưa có ngày bắt đầu', text:"Bạn cần chọn ngày bắt đầu cho lớp", icon: 'warning'});
            }else if(currentDate >= new Date(_date)){
                Swal.fire({ title: 'Ngày bắt đầu không hợp lệ', text:"Bạn cần chọn ngày bắt đầu cho lớp lớn hơn ngày hiện tại", icon: 'warning'});
            }else if($.trim(_price) === ''){
                Swal.fire({ title: 'Lớp chưa có giá tiền', text:"Bạn cần nhập giá tiền cho lớp này", icon: 'warning'});
            }else if((parseInt(_price) <= 10000 || parseInt(_price) >= 20000000)){
                Swal.fire({ title: 'Giá tiền không hợp lệ', text:"Giá tiền của lớp tối thiểu làm 10.000₫ và tối đa là 20.000.000₫", icon: 'warning'});
            }else {
                var data = {
                    '_name' : _name,
                    '_trainer' : _trainer,
                    '_ticket' : _ticket,
                    '_time' : _time,
                    '_price' : _price,
                    '_date' : _date,
                    '_max_menber' : _max_member,
                    'end_date' : nextSelectedDate.format('YYYY-MM-DD'),
                    'schedule' : JSON.stringify(schedule),
                    _csrf: token
                };

                $.ajax({
                    type: "POST",
                    url: 'http://localhost:8080/admin/class-management/check-class-exist',
                    data: data,
                    success: function (respone) {
                        const respone_return = respone.split('-');
                        if(respone_return[0] === 'true'){
                            Swal.fire({ title: respone_return[1], text:"", icon: 'info'});
                            <%--window.location.href = '<c:url value="/admin/dashboard/class" />';--%>
                        }else {
                            Swal.fire({ title: respone_return[1], text:"", icon: 'error'});
                        }

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });


            }
        })
    })


</script>
</html>
