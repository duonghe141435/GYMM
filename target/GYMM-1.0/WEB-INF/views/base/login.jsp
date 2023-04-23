<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 2/7/2023
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Đăng nhập</title>
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
                            <div class="flex-grow-1 bg-login-image" style="background-image: url(&quot;assets/img/dogs/image3.jpeg&quot;);"></div>
                        </div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-4">Welcome Back!</h4>
                                </div>
                                <form class="user" id="login-form" action="<c:url value="/j_spring_security_login"/>" method="POST">
                                    <div class="mb-3"><input class="form-control form-control-user" type="email" placeholder="Hãy nhập địa chỉ email của bạn..." name="email" required></div>
                                    <div class="mb-3"><input class="form-control form-control-user" type="password" placeholder="Hãy điền mật khẩu" name="password" required></div>
                                    <div class="mb-3">
                                        <div class="custom-control custom-checkbox small">
                                            <div class="form-check">
                                                <input class="form-check-input custom-control-input" type="checkbox" name="remember-me" id="formCheck">
                                                <label class="form-check-label custom-control-label" for="formCheck">Remember Me</label>
                                            </div>
                                        </div>
                                    </div><button class="btn btn-primary d-block btn-user w-100" type="submit">Đăng nhập</button>
                                    <hr>
                                    <a class="btn btn-primary d-block btn-google btn-user w-100 mb-2" role="button"
                                       href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/login-google&response_type=code
    &client_id=183838572195-7pihdf1po39ofnqomot2iohs5ok5dmjf.apps.googleusercontent.com&approval_prompt=force">
                                        <i class="fab fa-google"></i>&nbsp; Đăng nhập với Google
                                    </a>
                                    <hr>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                                <div class="text-center"><a class="small" href="<c:url value="/forgot-password"/>">Bạn đã quên mật khẩu?</a></div>
                                <div class="text-center"><a class="small" href="<c:url value='/register'/>">Tạo một tài khoản</a></div>
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

    <c:if test="${not empty message}">
    <c:if test="${message eq 'logout'}">
    Swal.fire({icon: 'info', text: 'Đăng xuất thành công!', showConfirmButton: false, timer: 2500});
    </c:if>
    <c:if test="${message ne 'logout'}">
    Swal.fire({icon: 'error', title: 'Oops...', text: '${message}', showConfirmButton: false, timer: 2500});
    </c:if>
    </c:if>

</script>

</html>
