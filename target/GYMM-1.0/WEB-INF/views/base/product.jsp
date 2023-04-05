<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 3/30/2023
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Product</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/font-awesome/font-awesome.min.css'/>">
    <script src="<c:url value='/assets/js/jquery-3.2.1.min.js'/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
<section class="py-5" style="background-color: #eee;">
    <div class="container py-5">
        <h4 class="text-center mb-5"><strong>Product listing</strong></h4>

        <div class="row">
            <c:if test="${not empty productDtos}">
                <c:forEach items="${productDtos}" var="productDtos">
                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                            <img src="<c:url value="${productDtos.p_img}"/> "
                                 class="w-100" />
                            <a class="text-decoration-none" href="#!">
                                <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                                    <div class="d-flex justify-content-start align-items-start h-30">
                                        <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">${productDtos.p_price}</span></h5>
                                    </div>
                                    <p class="text-light text-center fw-bold">${productDtos.p_name}</p>
                                </div>
                                <div class="hover-overlay">
                                    <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                </div>
                            </a>
                        </div>
                    </div>

                </c:forEach>
            </c:if>
        </div>



        <nav aria-label="Page navigation">
            <ul class="pagination d-flex justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</section>
<%@include file="/WEB-INF/views/layouts/customer/footer.jsp" %>

<script src="<c:url value='/assets/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>
</html>
