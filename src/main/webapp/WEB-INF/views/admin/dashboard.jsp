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
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid w-75 m-auto" style="padding-top: 100px">
                <div class="card shadow" style="height: 74vh;">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Đổi mật khẩu</p>
                    </div>
                    <div class="card-body">
                        <div class="m-auto text-center w-50 fw-semibold text-primary" style="font-size: 20px;padding-bottom: 10px;">
                            Xin chào ${display_name}, bạn muốn thay đổi mật khẩu, xin hay điền đầy đủ các thông tin dưới đây
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>
</body>
</html>
