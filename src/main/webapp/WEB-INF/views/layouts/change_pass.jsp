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
    <title>Quản lý vé tham gia lớp học</title>
    <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="stylesheet" href="<c:url value='/assets/css/table-admin-style.css'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top" style="overflow-y: auto">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid w-75 m-auto" style="padding-top: 100px">
                <div class="card shadow" style="height: 74vh;">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Đổi mật khẩu</p>
                    </div>
                    <div class="card-body">
                        <div class="m-auto text-center w-50 fw-semibold text-primary" style="font-size: 20px;padding-bottom: 10px;">
                            Xin chào Vương Hạ, bạn muốn thay đổi mật khẩu, xin hay điền đầy đủ các thông tin dưới đây
                        </div>
                        <form class="user m-auto w-50" id="login-form" action="<c:url value="/j_spring_security_login"/>" method="POST">
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
                                       placeholder="Hãy điền lại mật khẩu mới" required></div>

                            <button class="btn btn-primary d-block btn-user w-100" type="submit">Đổi mật khẩu</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
</html>
