<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="ticket-trainer" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="min-width: 980px;">
            <div class="modal-header">
                <p class="text-primary m-0 fw-bold text-start">Thêm vé thuê Huấn luyện viên</p>
                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="ticket-name"><strong>Tên vé</strong></label>
                                <input class="form-control" type="text" id="ticket-name" placeholder="Nhập tên vé" />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="ticket-day"><strong>Hạn ngày thuê</strong></label>
                                <select id="ticket-day" class="form-select">
                                    <option value="1">1 Ngày</option>
                                    <option value="7">1 Tuần</option>
                                    <option value="30">1 Tháng</option>
                                    <option value="365">1 Năm</option>
                                    <option value="-1">Khác</option>
                                </select>
                            </div>
                            <div class="mb-3" id="day-other" style="display: none">
                                <label class="form-label"><strong>Số ngày mong muốn</strong></label>
                                <input class="form-control" type="text" id="day-value" placeholder="Nhập số ngày"/>
                                <div class="invalid-feedback day-error">
                                    Số ngày tối thiểu của một vé là 1 ngày, tối đa 365 ngày
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-8">
                            <table class="table my-0" id="trainer-table">
                                <thead>
                                <tr>
                                    <th>Tên Huấn luyện viên</th>
                                    <th>Giá vé</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <form class="col-md-4" >
                            <div class="form-group">
                                <div class="mb-3">
                                    <label class="form-label col-sm-3 mt-3 p-0" for="trainer-select">Tên HLV:</label>
                                    <div class="col-sm-8 mt-2">
                                        <select id="trainer-select" class="form-select" required>
                                            <option disabled selected hidden>Chọn HLV</option>
                                            <c:forEach items="${trainer}" var="trainer">
                                                <option value="${trainer.u_id}">${trainer.u_full_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="mb-3">
                                    <label class="form-label col-sm-3 mt-3 p-0" for="ticket-price">Giá thuê</label>
                                    <input class="form-control" type="text" id="ticket-price" placeholder="Nhập giá tiền"/>
                                    <div class="invalid-feedback price-error">
                                        Giá vé nằm trong khoảng từ 1.000vnd đến 50.000vnd
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row d-flex">
                                    <button style="width: 200px;" id="add-trainer" class="btn btn-primary">Thêm huấn luyện viên</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="mb-3">
                        <button class="btn btn-primary" id="add-ticket-trainer">Tạo mới</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

