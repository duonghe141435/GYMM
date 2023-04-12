$(document).ready(function () {
    var today = moment().format('YYYY-MM-DD');

    var list_trainer = [];
    var list_class = [];

    var ticket_door_table = $("#ticket-door-table");
    var ticket_trainer_table = $("#ticket-trainer-table");
    var ticket_class_table = $("#ticket-class-table");
    var trainer_table = $("#trainer-table");
    var class_table = $("#class-table");

    var btn_add_ticket_door = $("#add-ticket-door");
    var btn_add_ticket_trainer = $("#add-ticket-trainer");
    var btn_add_ticket_class = $("#add-ticket-class");

    var btn_add_trainer = $("#add-trainer");
    var btn_add_class = $("#add-class");


    var name = $("#ticket-name");
    var price = $("#ticket-price");
    var day = $("#ticket-day");
    var day_other = $("#day-other");
    var day_value = $("#day-value");
    var close_ticket_door = $("#close-ticket-door");

    var trainer_select = $("#trainer-select");
    var time_select = $("#time-select");
    var max_member = $("#max-member");
    var start_date = $("#date-start");
    var state_class = $("#state-class");

    var price_error = $(".price-error");
    var day_error= $(".day-error");

    $('.class-price').each(function () {
        var price = parseFloat($(this).text());
        if (!isNaN(price)) {$(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
    });

    //======================================TICKET_DOOR===============================
    price.on("input", function () {
        var input = $(this).val();
        input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
        if (parseInt(input) < 1000 || parseInt(input) > 50000) {
            price_error.show();
        }else{
            price_error.hide();
        }
        input = input.replace(/(\d)(?=(\d{3})+$)/g, "$1."); // thêm dấu chấm sau mỗi ba số
        $(this).val(input);
    });

    day_value.on("input", function () {
        var input = $(this).val();
        input = input.replace(/\D/g, ""); // loại bỏ tất cả các ký tự không phải số
        if (parseInt(input) < 1 || parseInt(input) > 365) {
            day_error.show();
        }else{
            day_error.hide();
        }
        $(this).val(input);
    });

    day.on("change", function () {
        if ($(this).val() === "-1") {
            day_other.show();
        }else{
            day_other.hide();
        }
    });

    btn_add_ticket_door.click(function (e) {

        var _name = name.val();
        var _price = price.val().replace(/\D/g, "");
        var _day = day.val();
        var _day_other = day_value.val();
        var token = $("meta[name='_csrf']").attr("content");

        if($.trim(_name) === '' || $.trim(_price) === '' || (parseInt(_price) < 1000 || parseInt(_price) > 50000)
            || ((_day === '-1') && (parseInt(_day_other) < 1 || parseInt(_day_other) > 365))){
            Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
        }else{
            var data = {'_name' : _name, '_price' : _price, '_day' : _day, '_day_other' : _day_other, _csrf: token};

            Swal.fire({
                title:'Thêm vé mới?',
                text:'Bạn muôn thêm vé này',
                icon:'question',
                showCancelButton: true,
                confirmButtonText: 'Đúng vậy',
                cancelButtonText: 'Không',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: 'http://localhost:8080/admin/ticket-management/add-ticket-door',
                    data: data,
                    success: function (respone) {
                        Swal.fire('Thêm vé thành công', '', 'info');
                        var showday;
                        var formattedPrice = parseFloat(_price).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                        if(_day === '-1'){showday = _day_other;}else{showday = _day;}
                        var newrow = $("<tr>");
                        newrow.append(
                            '<td class="text-center"><count></count></td>' +
                            '<td class="ticket_id" hidden aria-readonly="true">'+respone+'</td>'+
                            '<td class="text-center">'+_name+'</td>' +
                            '<td class="text-center">'+formattedPrice+'</td>' +
                            '<td class="text-center"><span>'+showday+'</span> ngày</td>' +
                            '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                            '<td class="text-center">'+today+'</td>' +
                            '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                            '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                        );
                        ticket_door_table.append(newrow);
                        name.val('');
                        price.val('');
                        day_value('');
                        close_ticket_door.click();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            } else {
                Swal.fire({
                    title:'Ngừng thao tác',
                    text:'Không thêm vé mới này',
                    icon:'info',
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        })
        }
    });

    ticket_door_table.on('click', '.ticket-delete', function () {
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
                    Swal.fire('Xóa thành công!', 'Vé đã được xóa', 'success')
                },
                error: function (error) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    console.log(error);
                }
            });
        }else if (result.isDenied) {
            Swal.fire('Hành động của bạn đã được thu hồi', '', 'info')
        }
        })
    });

    ticket_door_table.on('click', '.ticket-view', function () {
        var ids = $(this).parent().siblings('.ticket-id').text();
        window.location.href = 'http://localhost:8080/admin/dashboard/ticket-detail/'+ids;
    });
    //Thực hiện hành động tìm kiếm tại Danh sách người dùng hệ thống
    // btn_search.click(function (e) {
    //     var input_search = $("#input-search").val();
    //     // Thực hiện hành động khi thẻ input thay đổi
    //     if(input_search == ''){
    //         Swal.fire({
    //             title: 'Oops...',
    //             text: 'Bạn cần nhập thông tin vào ô tìm kiếm',
    //             icon: 'error'
    //         })
    //     }else if(input_search.length >= 3){
    //         $.ajax({
    //             url: 'http://localhost:8080/admin/user-management/search',
    //             method: 'GET',
    //             data: {query: input_search},
    //             success: function(response) {
    //                 // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
    //                 alert("Ok")
    //             },
    //             error: function(xhr, status, error) {
    //                 console.log(error);
    //             }
    //         });
    //     }else {
    //         Swal.fire({
    //             title: 'Oops...',
    //             text: 'Hãy nhập tối thiểu 3 ký tự vào ô input',
    //             icon: 'error'
    //         })
    //     }
    // });
    //

    //======================================TICKET_TRAINER===============================

    btn_add_trainer.click(function (e) {
        e.preventDefault();

        var _price = price.val().replace(/\D/g, "");

        var data = {
            '_id' : trainer_select.val(),
            '_price' : parseFloat(_price)

        };
        var trainer_name = trainer_select.find(':selected').text();
        var formattedPrice = parseFloat(_price).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

        list_class.push(data);

        var newrow = $("<tr>");
        newrow.append(
            '<td>'+trainer_name+'</td>' +
            '<td class="class-price">'+formattedPrice+'</td>' +
            '<td style="text-align: center"><a class="delete-trainer">' +
            '<i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
        );
        trainer_table.append(newrow);
    });

    trainer_table.on('click', '.delete-trainer', function () {
        var row = $(this).closest('tr');
        var _index = $(this).closest('tr').index();
        list_trainer.splice(_index,1);
        row.remove();
    });

    ticket_trainer_table.on('click', '.ticket-view', function () {
        var ids = $(this).parent().siblings('.ticket-id').text();
        window.location.href = 'http://localhost:8080/admin/dashboard/ticket-detail/'+ids;
    });

    btn_add_ticket_trainer.click(function (e) {
        var _name = name.val();
        var _day = day.val();
        var _day_other = day_value.val();
        var token = $("meta[name='_csrf']").attr("content");

        if (list_trainer.length == 0){
            Swal.fire('Bạn cần thêm Huấn luyện viên cho vé này', '', 'warning');
        }else if($.trim(_name) === '' ||
            ((_day === '-1') && (parseInt(_day_other) < 1 || parseInt(_day_other) > 365))){
            Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
        } else {
            var data = {'_name' : _name,'_day' : _day, '_day_other' : _day_other,
                '_list' : JSON.stringify(list_trainer), _csrf: token};
            $.ajax({
                type: "POST",
                url: 'http://localhost:8080/admin/ticket-management/add-ticket-trainer',
                data: data,
                success: function (respone) {
                    Swal.fire('Them ve thanh cong', '', 'info');
                    var showday;

                    var prices = list_trainer.map(function(item) {
                        return item._price;
                    });

                    // Tìm giá trị lớn nhất và giá trị nhỏ nhất trong mảng `prices`
                    var maxPrice = Math.max.apply(null, prices);
                    var minPrice = Math.min.apply(null, prices);

                    var _maxPrice = maxPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                    var _minPrice = minPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                    if(_day === '-1'){showday = _day_other;}else{showday = _day;}
                    var newrow = $("<tr>");
                    newrow.append(
                        '<td class="text-center"><count></count></td>' +
                        '<td class="ticket_id" hidden aria-readonly="true">'+respone+'</td>'+
                        '<td class="text-center">'+_name+'</td>' +
                        '<td class="text-center"><span class="class-price">'+_minPrice+'</span> - <span class="class-price">'+_maxPrice+'</span></td>' +
                        '<td class="text-center"><span>'+showday+'</span> ngày</td>' +
                        '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                        '<td class="text-center">'+today+'</td>' +
                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                    );
                    ticket_trainer_table.append(newrow);
                },
                error: function(xhr, status, error) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    var errorMessage = xhr.status + ': ' + xhr.statusText;
                    console.log('Error - ' + errorMessage);
                }
            });
        }
    });

    //======================================TICKET_CLASS===============================

    btn_add_class.click(function (e) {
        e.preventDefault();

        var input_value = $('#my-input').val();
        var checkbox_values = [];
        $('table input[type="checkbox"]:checked').each(function() {
            checkbox_values.push($(this).attr('id'));
        });

        var _price = price.val().replace(/\D/g, "");
        if(checkbox_values.length == 0){
            Swal.fire('Thiếu lịch tập', 'Bạn quên chưa chọn lịch tập trong tuần rôi', 'warning')
        }else if((parseInt(_price) < 1000 || parseInt(_price) > 50000)){

        }else {
            var data = {
                '_id': trainer_select.val(),
                '_id_time': time_select.val(),
                '_max_member': max_member.val(),
                '_price': parseFloat(_price),
                '_start_date': start_date.val(),
                '_check': JSON.stringify(checkbox_values),
                '_state' : state_class.val()
            };
            var trainer_name = trainer_select.find(':selected').text();
            var time_detail = time_select.find(':selected').text();
            var formattedPrice = parseFloat(_price).toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).replace("₫", " ₫");

            list_class.push(data);

            var newrow = $("<tr>");
            newrow.append(
                '<td>' + trainer_name + '</td>' +
                '<td>' + time_detail + '</td>' +
                '<td class="class-price">' + formattedPrice + '</td>' +
                '<td>' + start_date.val() + '</td>' +
                '<td>' + max_member.val() + '</td>' +
                '<td style="text-align: center"><a class="delete-class">' +
                '<i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
            );
            class_table.append(newrow);
        }
    });

    btn_add_ticket_class.on('click', function() {

        var _name = name.val();
        var _day = day.val();
        var _day_other = day_value.val();
        var token = $("meta[name='_csrf']").attr("content");


        if($.trim(_name) === '' || ((_day === '-1') && (parseInt(_day_other) < 1 || parseInt(_day_other) > 365))){
            Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
        }else {

            var data = {'_name' : _name, '_day' : _day, '_day_other' : _day_other,
                '_list' : JSON.stringify(list_class),_csrf: token};

            $.ajax({
                type: "POST",
                url: 'http://localhost:8080/admin/ticket-management/add-ticket-class',
                data: data,
                success: function (respone) {
                    Swal.fire('Them ve thanh cong', '', 'info');
                    var showday;
                    var prices = list_class.map(function(item) {
                        return item._price;
                    });
                    // Tìm giá trị lớn nhất và giá trị nhỏ nhất trong mảng `prices`
                    var maxPrice = Math.max.apply(null, prices);
                    var minPrice = Math.min.apply(null, prices);

                    var _maxPrice = maxPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");
                    var _minPrice = minPrice.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

                    if(_day === '-1'){showday = _day_other;}else{showday = _day;}

                    var newrow = $("<tr>");
                    newrow.append(
                        '<td class="text-center"><count></count></td>' +
                        '<td class="ticket_id" hidden aria-readonly="true">'+respone+'</td>'+
                        '<td class="text-center">'+_name+'</td>' +
                        '<td class="text-center"><span class="class-price">'+_minPrice+'</span> - <span class="class-price">'+_maxPrice+'</span></td>' +
                        '<td class="text-center"><span>'+showday+'</span> ngày</td>' +
                        '<td class="status text-center"><span class="active">Đang bán</span></td>' +
                        '<td class="text-center">'+today+'</td>' +
                        '<td class="text-center"><a class="ticket-view"><i class="fas fa-eye fa-lg fa-fw me-2 text-info" title="Xóa vé"></i></a>' +
                        '<a class="ticket-delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td>'
                    );
                    ticket_trainer_table.append(newrow);
                },
                error: function(xhr, status, error) {
                    Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    var errorMessage = xhr.status + ': ' + xhr.statusText;
                    console.log('Error - ' + errorMessage);
                }
            });
        }

    });


    class_table.on('click', '.delete-class', function () {
        var row = $(this).closest('tr');
        var _index = $(this).closest('tr').index();
        list_trainer.splice(_index,1);
        row.remove();
    });

    ticket_class_table.on('click', '.ticket-view', function () {
        var ids = $(this).parent().siblings('.ticket-id').text();
        window.location.href = 'http://localhost:8080/admin/dashboard/ticket-detail/'+ids;
    });

});

