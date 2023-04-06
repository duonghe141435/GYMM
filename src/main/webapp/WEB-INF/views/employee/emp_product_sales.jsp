<%--suppress ALL --%>
<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: Hieuhm
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
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .fa-trash {
            color: red;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/layouts/employee/header.jsp" %>
<div class="col-lg-12">
    <div class="row d-flex justify-content-center align-items-center h-100" style="--bs-gutter-x: 0">

        <div class="row">
            <div class="col-lg-8">
                <div class="table-responsive table mt-2" style="height: 50vh; overflow: auto;">
                    <table class="table my-0" id="sales_table">
                        <thead>
                        <tr style="background-color: aquamarine" data-id="${productId}">
                            <th></th>
                            <th>Mã</th>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Giảm giá</th>
                            <th>Giá bán</th>
                            <th>Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="list-product" style="background-color: #eee">
                    <div class="row">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="form-search-box form-group row">
                                <form class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                                    <div class="input-group"><input class="bg-light form-control border-0 small" id="search_product" type="text"
                                                                    placeholder="Tìm kiếm sản phẩm" name="pr_name">
                                        <button class="btn btn-primary py-0" id="btn-search-product" type="button"><i class="fas fa-search"></i></button>
                                    </div>
                                </form>
                            </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination py-2" id="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="d-flex flex-wrap list-product-in" style="height: 320px;" id="product-list">
                            <div class="row">
                                <c:if test="${not empty productDtos}">
                                    <c:forEach items="${productDtos}" var="productDtos">
                                        <div class="col-lg-2 col-md-12 mb-4 mx-3">
                                            <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                                                <img src="<c:url value="${productDtos.p_img}"/> "
                                                     class="w-100" />
                                                <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                                                    <div class="d-flex justify-content-start align-items-start h-30">
                                                        <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark pro_price">${productDtos.p_price}</span></h5>
                                                    </div>
                                                    <p class="text-light text-center fw-bold pro_name">${productDtos.p_name}</p>
                                                    <p class="d-none pro_id">${productDtos.p_id}</p>
                                                </div>
                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">

                <div class="card bg-primary text-white rounded-3">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <span>Lương</span>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                     class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                            </div>
                            <input type="datetime-local" id="date-order" class="fa fa-calendar">
                        </div>

                        <form class="mt-4">
                            <div class="row form-outline form-white mb-4">
                                <div class="col-4">
                                    <label class="form-label mt-2" for="orderCode">Mã hóa đơn:</label>
                                </div>
                                <div class="col-8">
                                    <input type="text" id="orderCode" class="form-control"
                                           placeholder="Mã hóa đơn tự sinh" />
                                </div>
                            </div>

                            <div class="row form-outline form-white mb-4">
                                <div class="col-6">
                                    <label class="form-label mt-3" for="orderPrice">Tổng tiền hàng:</label>
                                    <label class="mx-2 mt-3 bg-white text-dark text-center" style="display: inline-block;
                                                            border-radius: 2px;">0</label>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 float-end" id="orderPrice">0</label>
                                </div>

                            </div>

                            <div class="row form-outline form-white mb-4">
                                <div class="col-4">
                                    <label class="form-label mt-2" for="salePrice">Giảm giá:</label>
                                </div>
                                <div class="col-8">
                                    <div class="row">
                                        <input type="number" id="salePrice" class="form-control"
                                               style="width: 195px;"/>
                                        <label class="text-white mx-1 py-2" style="background-color: #1fa750; height: 37px;
                                                                width: 60px;">VNĐ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-outline form-white mb-4">
                                <div class="col-6">
                                    <label class="form-label mt-3" for="cus_paid">Khách cần trả:</label>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 float-end text-danger" id="cus_paid">0</label>
                                </div>
                            </div>
                            <div class="row form-outline form-white mb-4">
                                <div class="col-4">
                                    <label class="form-label mt-2" for="spendPrice">Khách trả:</label>
                                </div>
                                <div class="col-8">
                                    <div class="row">
                                        <input type="number" id="spendPrice" class="form-control"
                                               style="width: 195px;"/>
                                        <label class="text-white mx-1 py-2" style="background-color: #1fa750; height: 37px;
                                                                width: 60px;">VNĐ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-outline form-white mb-4">
                                <div class="col-6">
                                    <label class="form-label mt-3" for="refunds">Trả lại:</label>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 float-end" id="refunds">0</label>
                                </div>
                            </div>

                        </form>

                        <hr class="my-4">

                        <button type="button" class="btn btn-active btn-block btn-lg" style="background-color: #85ffdb">
                            <div class="d-flex justify-content-between">
                                <span>Tạo hóa đơn <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                            </div>
                        </button>

                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
<script>
    document.getElementById("date-order").readOnly = true;

    var now = new Date();
    var year = now.getFullYear();
    var month = ('0' + (now.getMonth() + 1)).slice(-2);
    var day = ('0' + now.getDate()).slice(-2);
    var hour = ('0' + now.getHours()).slice(-2);
    var minute = ('0' + now.getMinutes()).slice(-2);
    var datetime = year + '-' + month + '-' + day + 'T' + hour + ':' + minute;
    document.getElementById('date-order').value = datetime;

</script>
<script src="<c:url value='/assets/js/product_sales.js'/>"></script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>
</html>

