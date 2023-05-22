<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/26/2023
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal" id="create_unit" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="text-primary fw-bold m-0">Thêm mới đơn vị sản phẩm</h6>
                    <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="card-body row">
                    <div class="col-md-8">
                        <table class="table my-0" id="unit_table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên đơn vị</th>
                                <th style="text-align: center">Thao thác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${units}" var="units">
                                <tr>
                                    <td><count></count></td>
                                    <td>${units.un_name}</td>
                                    <td style="text-align: center">
                                        <a class="product_delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <form class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label" for="new_unit"><strong>Tên đơn vị</strong></label>
                            <input class="form-control" type="text" id="new_unit" placeholder="Điền tên đơn vị mới" required="required" />
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary" type="submit" id="add-product-unit">Tạo mới</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="create_type_product" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="text-primary fw-bold m-0">Thêm mới phân loại sản phầm</h6>
                    <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="card-body row">
                    <div class="col-md-8">
                        <table class="table my-0" id="type_table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên phân loại</th>
                                <th style="text-align: center">Thao thác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productType}" var="productType">
                                <tr>
                                    <td><count></count></td>
                                    <td>${productType.name}</td>
                                    <td style="text-align: center">
                                        <a class="product_delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <form class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label" for="new_type_product"><strong>Tên phân loại</strong></label>
                            <input class="form-control" type="text" id="new_type_product" placeholder="Điền phân loại" required="required" />
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary" type="submit" id="add-product-type">Tạo mới</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).ready(function () {

        $('#add-product-type').click(function (e) {
            e.preventDefault();
            var $type = $("#new_type_product").val();
            $.ajax({
                type: "POST",
                url: '<c:url value="/admin/product-management/type?${_csrf.parameterName}=${_csrf.token}" />',
                data: $type,
                dataType: "text",
                contentType: "text/plain",
                success: function (respone) {
                    Swal.fire('Thêm đơn vị thành công', '', 'info');

                    $('#type_table tr:last').after('<tr><td><count></count></td>'+'<td>'+$type+'</td>'+
                        '<td style="text-align: center"><a><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td></tr>');

                    $("#product_kind").append($('<option>', {
                        value: respone,
                        text: $type
                    }));
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Lỗi hệ thống!!', 'Mã lỗi: ' + xhr.status + ', thông điệp lỗi: ' + thrownError, 'error');
                    console.log(xhr);
                }
            });

            $("#new_type_product").val("");
        });

        $('#add-product-unit').click(function (e) {
            e.preventDefault();
            var $unit = $('#new_unit').val();
            $.ajax({
                type: "POST",
                url: '<c:url value="/admin/product-management/unit?${_csrf.parameterName}=${_csrf.token}" />',
                data: $unit,
                dataType: "text",
                contentType: "text/plain",
                success: function (respone) {
                    Swal.fire('Thêm đơn vị thành công', '', 'info');

                    $('#unit_table tr:last').after('<tr><td><count></count></td>'+'<td>'+$unit+'</td>'+
                        '<td style="text-align:center"><a><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a></td></tr>');

                    $("#product_unit").append($('<option>', {
                        value: respone,
                        text: $unit
                    }));
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    Swal.fire('Lỗi hệ thống!!', 'Mã lỗi: ' + xhr.status + ', thông điệp lỗi: ' + thrownError, 'error');
                    console.log(xhr);
                }
            });
            $('#new_unit').val("");
        });
    });

</script>


