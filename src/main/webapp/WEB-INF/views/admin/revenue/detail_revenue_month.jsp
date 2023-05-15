<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết doanh thu của tháng</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width:90%">Chi tiết doanh thu</p>
                        <a href="<c:url value='/admin/revenue/ticket'/> " class="btn btn-primary" style="font-weight: 700;">Quay lại</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table mt-2" role="grid" style="max-height: 60vh;">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>Tên vé</th>
                                    <th>Ngày thanh toán<\th>
                                    <th>Giá tiền</th>
                                </tr>
                                </thead>
                                <tbody style="display: contents;width: 100%;overflow: auto;">
                                    <c:forEach items="${detail}" var="detail">
                                        <tr>
                                            <td class="text-center"><count></count></td>
                                            <td>
                                                ${detail.name}
                                            </td>
                                            <td>
                                                    ${detail.date_Payment}
                                            </td>
                                            <td class="class-price">
                                                    ${detail.value_Cost}
                                            </td>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
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