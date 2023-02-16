<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 2/7/2023
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Forgotten Password - Brand</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">--%>
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
</head>

<body class="bg-gradient-primary">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9 col-lg-12 col-xl-10">
            <div class="card shadow-lg o-hidden border-0 my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-flex">
                            <div class="flex-grow-1 bg-password-image"
                                 style="background-image: url(&quot;assets/img/dogs/image1.jpeg&quot;);"></div>
                        </div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-2">Forgot Your Password?</h4>
                                    <p class="mb-4">We get it, stuff happens. Just enter your email address below and
                                        we'll send you a link to reset your password!</p>
                                </div>
                                <form class="user">
                                    <div class="mb-3"><input class="form-control form-control-user" type="email"
                                                             id="exampleInputEmail" aria-describedby="emailHelp"
                                                             placeholder="Enter Email Address..." name="email"></div>
                                    <button class="btn btn-primary d-block btn-user w-100" type="submit">Reset
                                        Password
                                    </button>
                                </form>
                                <div class="text-center">
                                    <hr>
                                    <a class="small" href="register.html">Create an Account!</a>
                                </div>
                                <div class="text-center"><a class="small" href="<c:url value='/dang-nhap'/>">Already
                                    have an account? Login!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>

</html>
