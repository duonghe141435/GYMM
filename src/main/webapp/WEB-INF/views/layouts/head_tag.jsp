<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">



<script src="<c:url value='/assets/js/jquery-3.2.1.min.js'/>"></script>

<script src="<c:url value='/assets/js/popper.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/assets/bootstrap/bootstrap.min.css'/>">
<script src="<c:url value='/assets/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/assets/font-awesome/font-awesome.min.css'/>">



<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    nav .container img{
        width: 100px;
        height: 50px;
    }
    body {
        /* Set "my-sec-counter" to 0 */
        counter-reset: my-sec-counter;
    }

    count::before {
        /* Increment "my-sec-counter" by 1 */
        counter-increment: my-sec-counter;
        content: counter(my-sec-counter);
    }
</style>
