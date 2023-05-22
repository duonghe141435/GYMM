<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/logo/logo-icon.png'/>"/>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/js/moment-with-locales.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="<c:url value='/assets/css/table-style.css'/>">
<script>
    $(document).ready(function(){
        $('.class-price').each(function () {
            var price = parseFloat($(this).text());
            if (!isNaN(price)) {$(this).text(price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));}
        });
    });
</script>



