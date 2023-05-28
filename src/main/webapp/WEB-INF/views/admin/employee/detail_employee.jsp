<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin chi tiết nhân viên</title>
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
                        <p class="text-primary m-0 fw-bold" style="width:80%">Thông tin của ${user.u_full_name}</p>
                        <a href="<c:url value='/admin/employee/page=1-status=${user.u_enable}'/> " class="btn btn-primary" style="font-weight: 700;">Quay trở lại danh sách</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                         <div class="col-lg-4 card">
                             <table class="table" id="user">
                                 <tr>
                                     <td>Họ và tên</td>
                                     <td>${user.u_full_name}</td>
                                 </tr>
                                 <tr>
                                     <td>Ngày sinh</td>
                                     <td>${user.u_dob}</td>
                                 </tr>
                                 <tr>
                                     <td>Số điện thoại</td>
                                     <td>${user.u_phone_number}</td>
                                 </tr>
                                 <tr>
                                     <td>Ngày bắt đầu làm việc</td>
                                     <td>${user.u_create_date}</td>
                                 </tr>
                                 <tr>
                                     <td>Trạng thái tài khoản</td>
                                     <c:if test="${user.u_enable == -1}">
                                         <td class="status">
                                             <span class="danger">Bị xóa</span></td>
                                     </c:if>
                                     <c:if test="${user.u_enable == 1}">
                                         <td class="status">
                                             <span class="active">Hoạt động</span></td>
                                     </c:if>
                                 </tr>
                                 <c:if test="${user.u_enable == -1}">
                                     <tr>
                                         <td><a class="btn btn-info restore-user">Khôi phục tài khoản</a></td>
                                     </tr>
                                 </c:if>
                                 <c:if test="${user.u_enable == 1}">
                                     <tr>
                                         <td><a class="btn btn-danger delete-user">Xóa nhân viên</a></td>
                                         <td><a class="btn btn-info update-user">Chỉnh sửa thông tin</a></td>
                                     </tr>
                                 </c:if>

                             </table>
                         </div>
                            <div class="col-lg-8">
                                <div class="table-responsive table mt-2" role="grid" style="max-height: 45vh;">
                                    <table class="table my-0" id="list-order">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Mã hóa đơn</th>
                                            <th>Tên khách hàng</th>
                                            <th class="text-center">Ngày thanh toán</th>
                                            <th class="text-center">Tổng số tiền</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody style="display: contents;width: 100%;overflow: auto;">
                                        <c:if test="${not empty orderDtos}">
                                            <c:forEach items="${orderDtos}" var="orderDtos">
                                                <tr>
                                                    <td class="text-center"><count></count></td>
                                                    <td class="order_id" aria-readonly="true" readonly="true" hidden>${orderDtos.order_id}</td>
                                                    <td>${orderDtos.order_code}</td>
                                                    <td>${orderDtos.customer_name}</td>
                                                    <td>${orderDtos.order_date}</td>
                                                    <td class="class-price">${orderDtos.total_price}</td>
                                                    <td class="text-center">
                                                        <a class="order_view">
                                                            <i class="fas fa-eye fa-lg fa-fw me-2 text-info"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
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
<script>
    $(document).ready(function () {
        const Toast = Swal.mixin({
            toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true,
            didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
        })

        var list_order = $("#list-order");
        var user = $("#user");
        list_order.on('click', '.order_view', function () {
            var ids = $(this).parent().siblings('.order_id').text();
            $.ajax({
                url: 'http://localhost:8080/admin/order-management/'+ids,
                method: 'GET',
                dataType : 'json',
                success: function(response) {
                    console.log(response);

                    // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    var tableData = '';
                    tableData += '<table class="table my-0">';
                    tableData += '<tr><th>Tên sản phẩm</th><th>Số lượng</th><th>Đơn giá</th><th>Tổng tiền</th></tr>';

                    response.forEach(function(element){
                        tableData += '<tr>';
                        tableData += '<td>' + element.product_name + '</td>';
                        tableData += '<td>' + element.quantity + '</td>';
                        tableData += '<td class="class-price">' + element.price_sale + '</td>';
                        tableData += '<td class="class-price">' + element.total_price + '</td>';
                        tableData += '</tr>';
                    });
                    tableData += '</table>';
                    Swal.fire({
                        title: 'Chi tiết hóa đơn',
                        html: tableData
                    });
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
        });
    });
        user.on('click', '.delete-user', function () {
            Swal.fire({
                title: 'Bạn muốn xóa tài khoản này?',
                icon: 'question',
                confirmButtonText: 'Đúng vậy',
                showCancelButton: true,
                cancelButtonText: 'Không!'
            }).then((result) => {
                if (result.isConfirmed) {
                $.ajax({
                    type: "GET",
                    url: 'http://localhost:8080/admin/employee-management/delete/'+${user.u_id},
                    success: function (respone) {
                        Toast.fire({icon: 'info', title: 'Tài khoản này đã bị xóa'});
                        setTimeout(function() {
                            window.location.href = "http://localhost:8080/admin/employee/page=1-status=1";
                        }, 3000);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            }else{
                Toast.fire({icon: 'info', title: 'Dừng xóa nhân viên này!'})
            }
        })
        });
        user.on('click', '.restore-user', function () {
            Swal.fire({
                title: 'Bạn muốn khôi phục tài khoản này?',
                icon: 'question',
                confirmButtonText: 'Đúng vậy',
                showCancelButton: true,
                cancelButtonText: 'Không!'
            }).then((result) => {
                if (result.isConfirmed) {
                $.ajax({
                    type: "GET",
                    url: 'http://localhost:8080/admin/employee-management/restore/'+${user.u_id},
                    success: function (respone) {
                        Toast.fire({icon: 'success', title: 'Tài đã được khôi phục'});
                        setTimeout(function() {
                            window.location.href = "http://localhost:8080/admin/employee/page=1-status=1";
                        }, 3000);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            }else{
                Toast.fire({icon: 'info', title: 'Dừng khôi phục tài khoản nhân viên này!'})
            }
        })
        });
        user.on('click', '.update-user', function () {
            window.location.href = "http://localhost:8080/admin/profile-employee/"+${user.u_id};
        });
    })
</script>
</html>
