<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Doanh thu sản phẩm</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 95px">

                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Doanh thu từ bán vé</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Năm&nbsp;
                                        <select class="d-inline-block form-select form-select-sm">
                                            <c:forEach items="${year}" var="year">
                                                <option selected="" value="${year}">${year}</option>
                                            </c:forEach>
                                        </select>&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-4">
                                <div class="card shadow border-start-primary py-2">
                                    <div class="card-body">
                                        <div class="row align-items-center no-gutters">
                                            <div class="col me-2">
                                                <div class="text-uppercase text-primary fw-bold text-xs mb-1"><span>Doanh thu cả năm</span></div>
                                                <div class="text-dark fw-bold h5 mb-0"><span class="class-price">${total_year}</span></div>
                                            </div>
                                            <div class="col-auto"><i class="fas fa-calendar fa-2x text-gray-300"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-10 table-responsive table mt-2" role="grid" style="max-height: 55vh;">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Tháng</th>
                                        <th class="text-center">Tổng số tiền</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody style="display: contents;width: 100%;overflow: auto;">
                                    <c:forEach items="${revenues}" var="revenues">
                                        <tr>
                                            <td class="text-center">Tháng ${revenues.month}</td>
                                            <td class="class-price text-center"> ${revenues.total_money}</td>
                                            <c:if test="${revenues.year != null}">
                                                <td class="text-center">
                                                    <a href="/admin/revenue/ticket/${revenues.year}-${revenues.month}">Xem chi tiết</a>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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