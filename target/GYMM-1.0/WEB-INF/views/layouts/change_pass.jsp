<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/30/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đổi mật khẩu</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top" style="overflow-y: auto">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
            <div class="container-fluid w-75 m-auto" style="padding-top: 100px">
                <div class="card shadow" style="height: 74vh;">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Đổi mật khẩu</p>
                    </div>
                    <div class="card-body">
                        <div class="m-auto text-center w-50 fw-semibold text-primary" style="font-size: 20px;padding-bottom: 10px;">
                            Xin chào ${display_name}, bạn muốn thay đổi mật khẩu, xin hay điền đầy đủ các thông tin dưới đây
                        </div>
                        <form class="user m-auto w-50">
                            <div class="mb-3">
                                <label class="form-label" for="pass-old"><strong>Mật khẩu hiện tại</strong></label>
                                <input class="form-control form-control-user" type="password" id="pass-old"
                                       placeholder="Hãy điền mật khẩu hiện tại" required></div>
                            <div class="mb-3">
                                <label class="form-label" for="pass-new"><strong>Mật khẩu mới</strong></label>
                                <input class="form-control form-control-user" type="password" id="pass-new"
                                       placeholder="Hãy điền mật khẩu mới" required></div>

                            <div class="mb-3">
                                <label class="form-label" for="re-pass-new"><strong>Điền lại mật khẩu mới</strong></label>
                                <input class="form-control form-control-user" type="password" id="re-pass-new"
                                       placeholder="Hãy điền lại mật khẩu mới" required>
                                <div class="invalid-feedback password-error">
                                    Mật khẩu không khớp.
                                </div>
                            </div>

                            <button id="btn-change-pass" class="btn btn-primary d-block btn-user w-100">Đổi mật khẩu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/customer/footer.jsp"%>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var btn_change_pass = $("#btn-change-pass");
        var pass_new = $("#pass-new");
        var re_pass_new = $("#re-pass-new");
        var check = true;

        re_pass_new.on('keyup', function() {
            if (pass_new.val() === re_pass_new.val()) {
                // Mật khẩu mới và nhập lại mật khẩu mới giống nhau
                $('.password-error').hide();
                check = true;
            } else {
                $('.password-error').show();
                // Mật khẩu mới và nhập lại mật khẩu mới không giống nhau
                check = false;
            }
        });

        btn_change_pass.click(function (e) {

            e.preventDefault();

            var pass_old = $("#pass-old").val();
            var token = $("meta[name='_csrf']").attr("content");

            if($.trim(pass_old) === '' || $.trim(pass_new.val()) === '' || $.trim(re_pass_new.val()) === '' || !check){
                Swal.fire('Xin hãy điền đầy đủ thông tin một cách chính xác', '', 'warning');
            }else{
                var data = {'_pass_old': pass_old, '_pass_new': pass_new.val(), _csrf: token};
                $.ajax({
                    type: "POST",
                    url: 'http://localhost:8080/users/user-management/change-pass',
                    data: data,
                    success: function (respone) {
                        Swal.fire(respone, '', 'info');
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire('Oops...', 'Lỗi hệ thống', 'error');
                    }
                });
            }
        })

    });


</script>
</html>
