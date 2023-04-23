<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quên mật khẩu</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>

<body class="bg-gradient-primary">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9 col-lg-12 col-xl-10">
            <div class="card shadow-lg o-hidden border-0 my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-flex">
                            <div class="flex-grow-1 bg-password-image" style="background-image: url(&quot;assets/img/dogs/image1.jpeg&quot;);"></div>
                        </div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-2">Bạn đã quên mật khẩu?</h4>
                                    <p class="mb-4">Chúng tôi rất lấy làm tiếc, xin hãy nhập email của vào form bên dưới để Reset mật khẩu</p>
                                    <p class="mb-4">Một mật khẩu mới sẽ được gửi đến hộp thư của bạn</p>
                                </div>
                                <form class="user">
                                    <div class="mb-3">
                                        <input class="form-control form-control-user" type="email" id="email-reset" aria-describedby="emailHelp" placeholder="Nhập địa chỉ email của bạn" name="email">
                                    </div><button class="btn btn-primary d-block btn-user w-100" id="reset-btn">Gửi mật khẩu mới</button>
                                </form>
                                <div class="text-center">
                                    <hr><a class="small" href="<c:url value='/register'/>">Tạo một tài khoản</a>
                                </div>
                                <div class="text-center"><a class="small" href="<c:url value='/login'/>">Bạn đã có tài khoản rồi? Hay đăng nhập!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var email = $("#email-reset");
        var btn_reset = $("#reset-btn");

        btn_reset.click(function (e) {
            e.preventDefault();
            var _email = email.val();
            var token = $("meta[name='_csrf']").attr("content");
            var data = {'email' : _email, _csrf: token};

            $.ajax({
                type: "POST",
                url: '<c:url value="/reset-pass" />',
                data: data,
                success: function (respone) {
                    const respone_return = respone.split('-');
                    if(respone_return[0] === 'success'){
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
        });


    })
</script>
</html>
