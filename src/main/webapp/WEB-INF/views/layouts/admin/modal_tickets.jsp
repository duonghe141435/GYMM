<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/16/2023
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--======================================================Create Modal=====================================================--%>
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" id="ticket_btn_close_add" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="py-5">
                <div class="container">
                    <p class="text-dark h2 text-center">Tạo mới vé tập</p>

                    <form id="add_ticket" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2 mt-3" for="ticket_name_add">Tên vé:</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="ticket_name_add" name="ticket_name_add"
                                           required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2 mt-3" for="ticket_type_add">Loại vé:</label>
                                <div class="col-sm-6">
                                    <select id="ticket_type_add" class="form-select" name="ticket_type_add" required>
                                        <c:forEach items="${ticketTypes}" var="ticketTypes">
                                            <option value="${ticketTypes.tt_id}">${ticketTypes.name}</option>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2 mt-3" for="ticket_price_add">Giá vé:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="ticket_price_add" class="form-control"
                                           id="ticket_price_add" required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2 mt-3" for="ticket_day_add">Hạn sử dụng:</label>
                                <div class="col-sm-6">
                                    <input type="number" min="1" max="365"
                                           placeholder="Total day" class="form-control" id="ticket_day_add"
                                           name="ticket_day_add" required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2 mt-3" for="ticket_description_add">Ghi chú:</label>
                                <div class="col-sm-6">
                                           <textarea name="ticket_description_add" class="d-flex justify-content-start"
                                                     style="padding-top: 0px ;width: 450px; font-family: 'Courier New', Courier, monospace;"
                                                     id="ticket_description_add" rows="5" cols="20" required>
                                            </textarea>

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2 mt-3" for="ticket_date_add">Ngày tạo:</label>
                                <div class="col-sm-6">
                                    <input type="date" class="form-control" id="ticket_date_add" name="ticket_date_add"
                                           readonly/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <button style="width: 200px;" id="btnAddTickets" class="btn btn-primary btn-block mt-5">
                                    Tạo vé
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--======================================================Update Modal=====================================================--%>
<div class="modal" id="update_ticket_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" id="ticket_btn_close_update" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="py-5">
                <div class="container">
                    <p class="text-dark h2 text-center">Cập nhập gói tập</p>

                    <div id="addNewTicketForm">
                        <form id="updateTicket" enctype="multipart/form-data">


                            <div class="form-group" style="display: none">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_id_update"></label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="ticket_id_update" name="ticket_id_update"
                                               readonly/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_name_update">Tên vé:</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="ticket_name_update" name="ticket_name_update"
                                               required/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_type_update">Loại vé:</label>
                                    <div class="col-sm-6">
                                        <select id="ticket_type_update" class="form-select" name="ticket_type_update" required>
                                            <c:forEach items="${ticketTypes}" var="ticketTypes">
                                                <option value="${ticketTypes.tt_id}">${ticketTypes.name}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_price_update">Giá vé:</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="ticket_price_update" class="form-control" id="ticket_price_update"
                                               required/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_day_update">Hạn sử dụng:</label>
                                    <div class="col-sm-6">
                                        <input type="number" min="1" max="365"
                                               placeholder="Total day" class="form-control" id="ticket_day_update"
                                               name="ticket_day_update" required/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_description_update">Ghi chú:</label>
                                    <div class="col-sm-6">
                                           <textarea name="ticket_description_update" class="d-flex justify-content-start"
                                                     style="padding-top: 0px ;width: 450px; font-family: 'Courier New', Courier, monospace;"
                                                     id="ticket_description_update" rows="5" cols="20" required>
                                            </textarea>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2 mt-3" for="ticket_date_update">Ngày tạo:</label>
                                    <div class="col-sm-6">
                                        <input type="date" class="form-control" id="ticket_date_update"
                                               name="ticket_date_update" readonly/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <button style="width: 200px;" id="btnUpdateTickets"
                                            class="btn btn-primary btn-block mt-5">Cập nhập vé tập
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let row = "";

    $(document).ready(function() {
        var today = new Date().toISOString().substr(0, 10);
        $('#ticket_date_add').val(today);

        $('.ticket_price').each(function () {
            const price = parseFloat($(this).text());
            if (!isNaN(price)) {
                $(this).text(price.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }));
            }
        });

        $("#btnAddTickets").click(function () {

            event.preventDefault();

            var formdata = {
                't_name' : $('input[name=ticket_name_add]').val(),
                'tt_id' : $('select[name=ticket_type_add]').val(),
                'tt_name' : $("#ticket_type_add option:selected").text(),
                't_price' : $('input[name=ticket_price_add]').val(),
                't_note': $('textarea[name=ticket_description_add]').val(),
                't_total_days': $('input[name=ticket_day_add]').val(),
                'create_date': $('input[name=ticket_date_add]').val()
            };

            $.ajax({
                type: "POST",
                url: '<c:url value="/admin/ticket-management" />',
                data: formdata,
                encode: true,
                success: function (respone) {
                    var price = parseFloat(formdata.t_price);
                    var formattedPrice = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

                    Swal.fire('Thêm Sản phẩm thành công thành công', '', 'info');
                    $("#ticket_btn_close_add").click();

                    $('#ticket_table tr:last').after('<tr>'+

                        '<td> <count></count> </td>'+
                        '<td class="ticket_id" style="display: none">'+respone+'</td>'+
                        '<td class="ticket_name">'+formdata.t_name+'</td>'+
                        '<td class="ticket_ttids">'+formdata.tt_name+'</td>'+
                        '<td class="ticket_note">'+formdata.t_note+'</td>'+
                        '<td class="ticket_price">'+formattedPrice+'</td>'+
                        '<td class="ticket_day">'+formdata.t_total_days+'</td>'+
                        '<td>Đang bán</td>'+
                        '<td class="ticket_date">'+formdata.create_date+'</td>'+
                        '<td><a class="ticket_view" data-bs-toggle="modal" data-bs-target="#exampleModal">\n' +
                        ' <i class="fas fa-eye fa-lg fa-fw me-2 text-primary"></i></a>\n' +
                        '<a class="ticket_delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>\n' +
                        '</td></tr>');
                },
                error: function (error) {
                    Swal.fire('Lỗi hệ thống!!', '', 'error')
                    console.log(error)
                }
            });
        });

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
            ids = $(this).parent().siblings('.ticket_id').text();
            row = $(this).closest('tr');

            $.ajax({
                type: "GET",
                url: "http://localhost:8080/admin/ticket-management/" + ids,
                dataType: 'json',
                contentType: 'application/json',
                success: function (respone) {

                    $("#ticket_id_update").val(respone.t_id)
                    $("#ticket_name_update").val(respone.t_name);
                    $("#ticket_price_update").val(respone.t_price);
                    $("#ticket_day_update").val(respone.t_total_days);
                    $("#ticket_date_update").val(respone.create_date);
                    $("#ticket_type_update").val(respone.tt_id);
                    $("#ticket_description_update").val(respone.t_note);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });

        $("#btnUpdateTickets").click(function () {

            event.preventDefault();

            var formdata = {
                't_id' : $('input[name=ticket_id_update]').val(),
                't_name' : $('input[name=ticket_name_update]').val(),
                'tt_id' : $('select[name=ticket_type_update]').val(),
                'tt_name' : $("#ticket_type_update option:selected").text(),
                't_price' : $('input[name=ticket_price_update]').val(),
                't_note': $('textarea[name=ticket_description_update]').val(),
                't_total_days': $('input[name=ticket_day_update]').val()
            };

            $.ajax({
                type: "PUT",
                data: JSON.stringify(formdata),
                contentType: 'application/json',
                url: '<c:url value="/admin/ticket-management" />',

                success: function (respone) {
                    Swal.fire('Cập nhập sản phẩm thành công thành công', '', 'info');
                    $("#ticket_btn_close_update").click();

                    var price = parseFloat(respone.t_price);
                    var formattedPrice = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}).replace("₫", " ₫");

                    Swal.fire('Sản phẩm cập nhật thành công thành công', '', 'info');

                    row.find('td:nth-child(3)').text(respone.t_name);
                    row.find('td:nth-child(4)').text(respone.tt_name);
                    row.find('td:nth-child(5)').text(respone.t_note);
                    row.find('td:nth-child(6)').text(formattedPrice);
                    row.find('td:nth-child(7)').text(respone.t_total_days + " ngày");
                },

                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Lỗi hệ thống!!', 'Mã lỗi: ' + xhr.status + ', thông điệp lỗi: ' + thrownError, 'error');
                    console.log(xhr);
                }
            });
        })

    });

</script>