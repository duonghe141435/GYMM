<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Trang chủ</title>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div class="container-fluid min-vh-100" style="padding-top: 100px">
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <%@include file="/WEB-INF/views/layouts/trainer/footer.jsp" %>
            </div>
        </footer>
    </div>
</div>
</body>
<script>
    $('.price').each(function () {
        var price = parseFloat($(this).text());
        if (!isNaN(price)) {
            $(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
    });

</script>
</html>
