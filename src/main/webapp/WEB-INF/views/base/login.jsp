<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 2/7/2023
  Time: 5:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="https://colorlib.com/etc/lf/Login_v18/images/icons/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/bootstrap/bootstrap.min.css'/> ">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/font-awesome/font-awesome.min.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/icons/icon-font.min.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/animate/animate.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/hamburgers/hamburgers.min.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/animsition/animsition.min.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/select2/select2.min.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/daterangepicker/daterangepicker.css'/>">

    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/util.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/main.css'/>">

    <meta name="robots" content="noindex, follow">
</head>
<body style="background-color: #666666;">
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form">
                        <span class="login100-form-title p-b-43">Login to continue</span>
                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="email" required="required" />
                    <span class="focus-input100"></span>
                    <span class="label-input100">Email</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" name="pass"  required="required" />
                    <span class="focus-input100"></span>
                    <span class="label-input100">Password</span>
                </div>
                <div class="flex-sb-m w-full p-t-3 p-b-32">
                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                        <label class="label-checkbox100" for="ckb1">Remember me</label>
                    </div>
                    <div><a href="#" class="txt1">Forgot Password?</a></div>
                </div>
                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">Login</button>
                </div>
            </form>
            <div class="login100-more" style="background-image: url("<c:url value='/assets/image/login.png'/>");">
            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/assets/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/assets/animsition/animsition.min.js'/>"></script>
<script src="<c:url value='/assets/bootstrap/popper.js'/>"></script>
<script src="<c:url value='/assets/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/select2/select2.min.js'/>"></script>
<script src="<c:url value='/assets/daterangepicker/moment.min.js'/>"></script>
<script src="<c:url value='/assets/daterangepicker/daterangepicker.js'/>"></script>
<script src="<c:url value='/assets/countdowntime/countdowntime.js'/>"></script>
<script src="<c:url value='/assets/js/main.js'/>"></script>
<script src="<c:url value='/assets/js/main.js'/>"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments); }
    gtag('js', new Date());
    gtag('config', 'UA-23581568-13');
</script>
</body>
</html>
