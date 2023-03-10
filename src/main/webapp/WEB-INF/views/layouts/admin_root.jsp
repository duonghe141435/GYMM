<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/7/2023
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><dec:title default="Master-Layout" /></title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
</head>

<body id="page-top">
<div id="wrapper">

    <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>

    <div class="d-flex flex-column" id="content-wrapper">

        <div id="content">

            <%@include file="/WEB-INF/views/layouts/admin/menu.jsp" %>

            <div class="container-fluid">
            <dec:body/>
            </div>

        </div>

        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
</body>

</html>
