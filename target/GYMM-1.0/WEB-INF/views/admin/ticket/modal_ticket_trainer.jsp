<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="ticket-trainer" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="min-width: 980px; min-height: 500px">
            <div class="modal-header">
                <p class="text-primary m-0 fw-bold text-start">Thêm huấn luyện viên</p>
                <button id="close-add-trainer" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="trainer-select"><strong>Tên huấn luyện viên</strong></label>
                                <select id="trainer-select" class="form-select">
                                    <c:forEach items="${trainer}" var="trainer">
                                        <option value="${trainer.u_id}">${trainer.u_full_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="trainer-price">Giá thuê</label>
                                <input class="form-control" type="text" id="trainer-price" placeholder="Nhập giá tiền"/>
                                <div class="invalid-feedback price-error">
                                    Giá vé nằm trong khoảng từ 1.000vnd đến 50.000vnd
                                </div>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary" id="btn-add-trainer">Tạo mới</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <table class="table my-0" id="trainer-table">
                            <thead>
                            <tr>
                                <th>Tên Huấn luyện viên</th>
                                <th>Giá vé</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody style="display: contents;width: 100%;overflow: auto;">
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="padding-top: 15px;">
                        <div class="mb-3"><button class="btn btn-primary" id="btn-save-trainer">Lưu</button></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
