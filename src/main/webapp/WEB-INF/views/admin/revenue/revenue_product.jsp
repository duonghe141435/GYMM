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
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Doanh thu từ việc bán sản phẩm</p>
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
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                            <div class="col-md-6 text-nowrap">
                                <div class="text-md-end w-25 float-end">
                                    <label class="form-label d-flex">
                                        <input type="search" class="form-control form-control-sm" placeholder="Search" id="input-search">
                                        <button id="btn-search-user" type="button" style="background: none; border: none"><i class="fa fa-search"></i></button>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">Tháng</th>
                                    <th>Doanh thu</th>
                                    <th>Lợi nhuận</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody style="display: contents;width: 100%;overflow: auto;">
                                <c:if test="${not empty users}">
                                    <c:forEach items="${users}" var="users">

                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
<script>

    $(document).ready(function () {
        var btn_search = $("#btn-search-user");
        var input_search = $("#input-search");
        // Thực hiện hành động tìm kiếm tại Danh sách người dùng hệ thống
        input_search.on("input", function (){
            var input = $(this).val();
            if(input.length >=5 ){
                $.ajax({
                    url: 'http://localhost:8080/admin/user-management/search',
                    method: 'GET',
                    data: {query: input},
                    dataType : 'json',
                    success: function(response) {
                        $('#dataTable tbody').remove();
                        console.log(response);
                        var tbody = $('<tbody>');
                        $('#dataTable').append(tbody);
                        $('#dataTable tbody').css({
                            'display': 'contents',
                            'width': '100%',
                            'overflow': 'auto'
                        });
                        $.each(response, function(index, users) {
                            var newrow = $("<tr>");
                            var row = '<td class="text-center"><count></count></td><td class="d-flex align-items-center" style="border: none;">\n' +
                                '<div class="img" style="background-image: url(http://localhost:8080'+users.u_img+')"></div>\n' +
                                '<div class="pl-3 email"><span>'+users.u_email+'</span><span>Added:'+users.u_create_date+'</span>\n' +
                                '</div></td><td>'+users.u_full_name+'</td><td class="text-center">'+users.u_phone_number+'</td>';

                            if(users.u_enable === -1){
                                row += ' <td class="status text-center"><span class="waiting">Chưa kích hoạt</span></td>';
                            }
                            if(users.u_enable === 0){
                                row += '<td class="status text-center"><span class="danger">Khóa</span></td>';
                            }
                            if(users.u_enable === 1){
                                row += '<td class="status text-center"><span class="active">Hoạt động</span></td>';
                            }
                            row += '<td class="text-center"><a class="user_view" data-bs-toggle="modal" data-bs-target="#vew_user_modal">\n' +
                                '<i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>\n' +
                                '<a class="ticket_update"><i class="fas fa-edit fa-lg fa-fw me-2 text-primary" title="Cập nhập vé"></i></a>\n' +
                                '<a class="ticket_delete"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>\n' +
                                '</td>';
                            newrow.append(row);
                            $('#dataTable tbody').append(newrow);
                        });

                        // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                    }
                });
            }
        });
        btn_search.click(function (e) {
            var input = input_search.val();
            // Thực hiện hành động khi thẻ input thay đổi
            if(input === ''){
                Swal.fire({
                    title: 'Oops...',
                    text: 'Bạn cần nhập thông tin vào ô tìm kiếm',
                    icon: 'error'
                })
            }else if(input.length >= 5){
                $.ajax({
                    url: 'http://localhost:8080/admin/user-management/search',
                    method: 'GET',
                    data: {query: input},
                    success: function(response) {
                        window.location.href = "http://localhost:8080/admin/dashboard/users/search/"+input;
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                    }
                });
            }else {
                Swal.fire({
                    title: 'Oops...',
                    text: 'Hãy nhập tối thiểu 5 ký tự vào ô input',
                    icon: 'error'
                })
            }
        });
    });

</script>
</html>