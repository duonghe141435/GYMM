<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/23/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="<c:url value='/assets/css/table-admin-style.css'/>">



