
<%--suppress ALL --%>
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
    <title>Product</title>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/views/layouts/customer/header.jsp" %>
<section class="py-5" style="background-color: #eee;">
    <div class="container py-5">
        <h4 class="text-center mb-5"><strong>Product listing</strong></h4>



        <div class="row d-flex justify-content-center align-items-center">
            <c:if test="${not empty productDtos}">
                <c:forEach items="${productDtos}" var="productDto">
                    <div class="col-lg-4 col-md-12 mb-4">
                        <div class="bg-image hover-zoom ripple shadow-1-strong rounded">
                            <img src="<c:url value="${productDto.p_img}"/> " class="w-100" />
                            <a class="text-decoration-none" href="#" data-bs-toggle="modal" data-bs-target="#productModal" data-name="${productDto.p_name}" data-price="${productDto.p_price}" data-image="${productDto.p_img}"
                               data-description="${productDto.p_description}" data-kind="${productDto.p_kind_name}" data-quantity="${productDto.p_quantity}">
                                <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
                                    <div class="d-flex justify-content-start align-items-start h-30">
                                        <h5><span class="badge bg-light pt-2 ms-3 mt-3 text-dark">${productDto.p_name}</span></h5>
                                        <h5><span class="badge bg-light pt-2 mt-3 text-dark" style="margin-left: 180px">${productDto.p_price}</span></h5>
                                    </div>
                                    <p class="text-light text-center fw-bold">${productDto.p_description}</p>
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

        <!-- Modal -->
        <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="productModalLabel"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Thêm nội dung cho modal -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
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

<script>
    var productModal = document.getElementById('productModal');
    productModal.addEventListener('show.bs.modal', function (event) {
        // Lấy sản phẩm mà người dùng đã nhấp vào
        var button = event.relatedTarget;
        var name = button.getAttribute('data-name');
        var price = button.getAttribute('data-price');
        var image = button.getAttribute('data-image');
        var kindName = button.getAttribute('data-kind');
        var description = button.getAttribute('data-description');
        var quantity = button.getAttribute('data-quantity');

        // Cập nhật nội dung của modal
        var modalTitle = productModal.querySelector('.modal-title');
        var modalBody = productModal.querySelector('.modal-body');
        modalTitle.textContent = 'Chi tiết sản phẩm';

        // Tạo nội dung cho phần thân của modal
        var content = '<div class="row">';
        content += '<div class="col-6"><img src="' + image + '" class="w-100"></div>';
        content += '<div class="col-6">';
        content += '<p><strong>Tên sản phẩm:</strong> ' + name + '</p>';
        content += '<p><strong>Giá:</strong> ' + price + '</p>';
        content += '<p><strong>Loại:</strong> ' + kindName + '</p>';
        content += '<p><strong>Mô tả:</strong> ' + description + '</p>';
        if (quantity == 0) {
            content += '<p>Hàng tạm thời đang hết, đang nhập hàng</p>';
        } else {
            content += '<p><strong>Số lượng:</strong> ' + quantity + '</p>';
        }
        // Thêm nội dung khác nếu cần thiết
        content += '</div></div>';
        modalBody.innerHTML = content;
    });
</script>


<%--<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>--%>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</body>
</html>
