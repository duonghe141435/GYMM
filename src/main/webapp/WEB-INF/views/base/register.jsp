<%--
  Created by IntelliJ IDEA.
  User: hieuhm
  Date: 2/7/2023
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đăng ký</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>

<body class="bg-gradient-primary">
<div class="container">
    <div class="card shadow-lg o-hidden border-0 my-5">
        <div class="card-body p-0">
            <div class="row">
                <div class="col-lg-5 d-none d-lg-flex">
                    <div class="flex-grow-1 bg-register-image" style="background-image:url(
                    <c:url value='/assets/img/dogs/image2.jpeg'/> );"></div>
                </div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h4 class="text-dark mb-4">Tạo tài khoản!</h4>
                        </div>
                        <form:form name="register" id="register" action="/register/create_user" method="POST" modelAttribute="new_users">
                            <small id="title"></small>
                            <div class="form-field">
                                <label for="user-name">Name:</label>
                                <small style="font-size: 15px"></small>
                                <form:input class="form-control form-control-user"
                                            path="u_full_name" type="text" id="user-name"
                                            placeholder="Nhập tên của bạn" name="name" />
                            </div>
                            <div class="form-field">
                                <label for="user-email">Email:</label>
                                <small style="font-size: 15px"></small>
                                <form:input class="form-control form-control-user" type="email"
                                            path="u_email" id="user-email"
                                            placeholder="Nhập địa chỉ email của bạn" name="email" />
                            </div>
                            <div class="form-field">
                                <label for="user-pass">Password:</label>
                                <small style="font-size: 15px"></small>
                                <form:input class="form-control form-control-user"
                                            path="u_password"
                                            type="password" id="user-pass"
                                            placeholder="Nhập mật khẩu của bạn" name="password" />
                            </div>
                            <div class="form-field">
                                <label for="register-pass">Confirm-password:</label>
                                <small style="font-size: 15px"></small>
                                <input class="form-control form-control-user" type="password"
                                       id="register-pass"
                                       placeholder="Nhập lại mật khẩu" name="password_repeat">
                            </div>
                            <button class="btn btn-primary d-block btn-user w-100" id="btn-register" type="submit">Đăng ký tài khoản</button>
                            <%--<hr>--%>
                            <%--<a class="btn btn-primary d-block btn-google btn-user w-100 mb-2" role="button"--%>
                               <%--href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/login-google&response_type=code--%>
    <%--&client_id=183838572195-7pihdf1po39ofnqomot2iohs5ok5dmjf.apps.googleusercontent.com&approval_prompt=force">--%>
                                <%--<i class="fab fa-google"></i>&nbsp; Đăng ký với Google--%>
                            <%--</a>--%>
                            <hr>
                        </form:form>
                        <div class="text-center"><a class="small" href="<c:url value='/forgot-password'/>">Bạn đã quên mật khẩu?</a></div>
                        <div class="text-center"><a class="small" href="<c:url value='/login'/>">Bạn đã có tài khoản rồi? Hay đăng nhập!</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    <c:if test="${not empty message}">
    Swal.fire({icon: 'error', title: 'Oops...', text: '${message}', showConfirmButton: false, timer: 2500});
    </c:if>
</script>
<%--<script src="<c:url value='/assets/js/register-validate.js'/>"></script>--%>
</body>
</html>
