<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="ticket-door" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="min-width: 980px;">
            <div class="modal-header">
                <p class="text-primary m-0 fw-bold text-start">Thêm vé vào cửa</p>
                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="ticket-name"><strong>Tên vé</strong></label>
                                <input class="form-control" type="text" id="ticket-name"
                                       placeholder="Nhập tên vé" path="t_name" required="required" />
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="ticket_day"><strong>Tổng số ngày</strong></label>
                                <input class="form-control" type="number" id="ticket_day"
                                       placeholder="Nhập tổng số ngày của vé"
                                       path="t_total_days" required="required" />
                            </div>
                            <div class="mb-3" id="t_price_input">
                                <label class="form-label" for="ticket_price"><strong>Giá tiền</strong></label>
                                <input class="form-control" type="number" id="ticket_price"
                                       placeholder="Nhập giá tiền của vé"
                                       path="t_price" required="required" />
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <button class="btn btn-primary" type="submit" id="add-ticket-door">Tạo mới</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

        $("#add-ticket-door").click(function (e) {
            var data = {
                'ticket_name' : $('#ticket-name').val(),
                'ticket_price' : $('#ticket_price').val(),
                'ticket_day' : $('#ticket_day').val()
            };

            $.ajax({
                type: "POST",
                url: '<c:url value="/admin/ticket-management/add-ticket-door?${_csrf.parameterName}=${_csrf.token}" />',
                data: data,
                success: function (respone) {
                    Swal.fire('Them ve thanh cong', '', 'info');
                    window.location.href = "http://localhost:8080/admin/dashboard/ticket-door";
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Lỗi hệ thống!!', 'Mã lỗi: ' + xhr.status + ', thông điệp lỗi: ' + thrownError, 'error');
                    console.log(xhr);
                }
            });
        });

        $("#add-ticket-btn").click(function (e) {
            e.preventDefault();

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
                Swal.fire({
                    title:'Thành công',
                    text:'Bạn đã thêm vé thành công',
                    icon:'success',
                    showConfirmButton: false,
                    timer: 2000,
                    willClose: () => {
                    $("#add-ticket").submit();
            }
            })
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
        });
    })
</script>
