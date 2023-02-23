<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hieuhm
  Date: 2/7/2023
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - Brand</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">--%>
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/loginstyle.css'/> ">
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
                            <h4 class="text-dark mb-4">Create an Account!</h4>
                        </div>
                        <form name="register" id="register" action="">
                            <small id="title"></small>
                            <div class="form-field">
                                <label for="exampleName">Name:</label>
                                <small style="font-size: 15px"></small>
                                <input class="form-control form-control-user"
                                       type="text" id="exampleName"
                                       placeholder="Your Name" name="name">
                            </div>
                            <div class="form-field">
                                <label for="examplePhoneNumber">PhoneNumber:</label>
                                <small style="font-size: 15px"></small>
                                <input class="form-control form-control-user" type="number"
                                       id="examplePhoneNumber" placeholder="Phone Number"
                                       name="phoneNumber">
                            </div>
                            <div class="form-field">
                                <label for="exampleInputEmail">Email:</label>
                                <small style="font-size: 15px"></small>
                                <input class="form-control form-control-user" type="email"
                                       id="exampleInputEmail" aria-describedby="emailHelp"
                                       placeholder="Email Address" name="email">
                            </div>
                            <div class="form-field">
                                <label for="examplePasswordInput">Password:</label>
                                <small style="font-size: 15px"></small>
                                <input class="form-control form-control-user"
                                       type="password" id="examplePasswordInput"
                                       placeholder="Password" name="password">
                            </div>
                            <div class="form-field">
                                <label for="exampleRepeatPasswordInput">Confirm-password:</label>
                                <small style="font-size: 15px"></small>
                                <input class="form-control form-control-user" type="password"
                                       id="exampleRepeatPasswordInput"
                                       placeholder="Confirm Password" name="password_repeat">
                            </div>
                            <button class="btn btn-primary d-block btn-user w-100" id="btn-register" type="submit">Register Account
                            </button>
                            <hr>
                            <a class="btn btn-primary d-block btn-google btn-user w-100 mb-2" role="button"><i
                                    class="fab fa-google"></i>&nbsp; Register with Google</a>
                            <hr>
                        </form>
                        <div class="text-center"><a class="small" href="<c:url value='/quen-mat-khau'/>">Forgot
                            Password?</a></div>
                        <div class="text-center"><a class="small" href="<c:url value='/dang-nhap'/>">Already have an
                            account? Login!</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
<script src="<c:url value='/assets/js/loginValidate.js'/>"></script>
</body>

</html>
