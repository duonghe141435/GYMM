<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin khác hàng</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid" style="padding-top: 100px">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">Thông tin người dùng</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <!--Thông tin của khách hàng đó -->
                            <div class="col-7 card">
                                <table>
                                    <tr>
                                        <td>
                                            Tên người dùng
                                        </td>
                                        <td>
                                            Hoàng Đức Lương
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-5">
                                <div class="row">
                                    <div class="col card">
                                        <!--Thông tin lịch sử mua vé -->
                                        <!--hiển thị chi tiết vé -->
                                        <table>
                                            <tr>
                                                <td>
                                                    Tên vé
                                                </td>
                                                <td>
                                                    Vé tháng
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col card">
                                        <tr>
                                            <td>
                                                Mã hóa đơn
                                            </td>
                                            <td>
                                                HD-01
                                            </td>
                                        </tr>
                                        <!--Thông tin lịch sử mua sản phẩm -->
                                        <!--Thông hiển thị chi tiết hóa đơn -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp" %>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>

</script>
</html>