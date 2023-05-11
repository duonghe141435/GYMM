<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/24/2023
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Danh sách lớp học</title>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <%--<div class="container-fluid min-vh-100" style="padding-top: 100px">--%>
            <%--<%@include file="/WEB-INF/views/trainer/list_ticket.jsp" %>--%>
            <%--&lt;%&ndash;<%@include file="/WEB-INF/views/customer/list_trainer.jsp" %>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<%@include file="/WEB-INF/views/customer/list_personal.jsp" %>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<%@include file="/WEB-INF/views/customer/list_class.jsp" %>&ndash;%&gt;--%>
            <%--</div>--%>
            <div class="container-fluid min-vh-100">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách lớp học</p>
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
                        </div>
                        <div class="table-responsive table mt-2">
                            <table class="table my-0" id="class-table">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Tên lớp</th>
                                    <th class="text-center">Giá</th>
                                    <th class="text-center">Số hội viên</th>
                                    <th class="text-center">Thời gian</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th class="text-center">Điểm danh</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty class_list}">
                                    <c:forEach items="${class_list}" var="class_list">
                                        <tr>
                                            <td class="text-center">
                                                <count></count>
                                            </td>
                                            <td class="class-id" style="display: none" aria-readonly="true">${class_list.class_id}</td>
                                            <td class="text-center">${class_list.c_name}</td>
                                            <td class="class-price">${class_list.c_price}</td>
                                            <td class="text-center">${class_list.total_attendees} / ${class_list.max_member}</td>
                                            <td class="text-center">${class_list.c_start_date} - ${class_list.c_end_date}</td>
                                            <td class="text-center">
                                                <c:if test="${class_list.c_status == 0}">
                                                    Chưa bắt đầu
                                                </c:if>
                                                <c:if test="${class_list.c_status == 1}">
                                                    Đang diễn ra
                                                </c:if>
                                                <c:if test="${class_list.c_status == -1}">
                                                    Kế thúc
                                                </c:if>
                                            </td>
                                            <td>
                                                <%--href="<c:url value="/trainer/attendance-an-class/${class_list.class_id}"/>"--%>
                                                <a class="class-attendance" style="cursor: pointer">Điểm danh</a>
                                            </td>
                                            <td class="text-center">
                                                <a class="class-view" style="cursor: pointer"><i class="fas fa-eye fa-lg fa-fw me-2 text-success"></i></a>
                                                <a class="class-delete" style="cursor: pointer"><i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                            <td class="CStatus" style="display: none">${class_list.c_status}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing
                                    1 to 10 of 27</p></div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/trainer/footer.jsp" %>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var class_table = $("#class-table");

        class_table.on('click', '.class-attendance', function () {
            var class_id = $(this).parent().siblings('.class-id').text();
            var CStatus = $(this).parent().siblings('.CStatus').text();

            var token = $("meta[name='_csrf']").attr("content");
            var data = {'_classID' : class_id, _csrf: token};

            if (CStatus === "0"){
                Swal.fire("Không thể điểm danh", 'Lớp Chưa bắt đầu', 'info');
            }
            if (CStatus === "1"){
                $.ajax({
                    url: '/trainer/checkAttendance',
                    type: "GET",
                    data: data,
                    success: function (respone) {

                        if (respone === "YES") {
                            window.location.href = '<c:url value="/trainer/attendance-an-class/" />'+ class_id
                        }else if (respone === "NO"){
                            Swal.fire("Hôm nay lớp không có lịch tập", '', 'info');
                        } else if (respone === "False"){
                            Swal.fire("Hôm nay lớp chưa bắt đầu hoặc đã kết thúc", '', 'info');
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Lỗi hệ thống!!', 'Mã lỗi: ' + xhr.status + ', thông điệp lỗi: ' + thrownError, 'error');
                        console.log(xhr);
                    }
                });
            }
            if (CStatus === "-1"){
                Swal.fire("Không thể điểm danh", 'Lớp đã kết thúc', 'info');
            }



            <%--window.location.href = '<c:url value="/trainer/attendance-an-class/" />'+ class_id--%>
        });

        class_table.on('click', '.class-view', function () {
            var ids = $(this).parent().siblings('.class-id').text();
            window.location.href = '<c:url value="/trainer/class/" />'+ids
        });

        class_table.on('click', '.class-delete', function () {
            console.log("view")
        });
    })
</script>
</html>
