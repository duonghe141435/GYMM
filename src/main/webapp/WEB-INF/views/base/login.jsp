<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 9999; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal content */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            text-align: center;
        }

        /* Loader */
        .loader {
            border: 10px solid #f3f3f3; /* Light grey */
            border-top: 10px solid #3498db; /* Blue */
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 2s linear infinite;
            margin: 0 auto;
        }

        /* Spinner animation */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

    </style>
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
                                    <div class="mb-3"><input class="form-control form-control-user" id="username"
                                                             type="email" placeholder="Hãy nhập địa chỉ email của bạn..." name="email" required></div>
                                    <div class="mb-3"><input class="form-control form-control-user" id="password"
                                                             type="password" placeholder="Hãy điền mật khẩu" name="password" required></div>
                                    <div class="mb-3">
                                        <div class="custom-control custom-checkbox small">
                                            <div class="form-check">
                                                <input class="form-check-input custom-control-input" type="checkbox" name="remember-me" id="formCheck">
                                                <label class="form-check-label custom-control-label" for="formCheck">Remember Me</label>
                                            </div>
                                        </div>
                                    </div><button class="btn btn-primary d-block btn-user w-100" id="btn-login" type="submit">Đăng nhập</button>
                                    <hr><a class="btn btn-primary d-block btn-google btn-user w-100 mb-2" role="button"><i class="fab fa-google"></i>&nbsp; Đăng nhập với Google</a>
                                    <hr>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                                <div class="text-center"><a class="small" href="<c:url value="/forgot-password'"/>">Bạn đã quên mật khẩu?</a></div>
                                <div class="text-center"><a class="small" href="<c:url value='/register'/>">Tạo một tài khoản</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/assets/js/bs-init.js"/>"></script>
</body>
<script>
<c:if test="${not empty message}">
    <c:choose>
        <c:when test="${message eq 'multi'}">

        </c:when>
    </c:choose>
</c:if>
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
