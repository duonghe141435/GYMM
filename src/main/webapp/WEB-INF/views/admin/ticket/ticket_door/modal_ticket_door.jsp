<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="ticket-door" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="min-width: 980px;">
            <div class="modal-header">
                <p class="text-primary m-0 fw-bold text-start">Thêm vé vào cửa</p>
                <button id="close-ticket-door" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="ticket-name"><strong>Tên vé</strong></label>
                                <input class="form-control" type="text" id="ticket-name" placeholder="Nhập tên vé" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="ticket-day"><strong>Hạn sử dụng</strong></label>
                                <select id="ticket-day" class="form-select">
                                    <option value="1">1 Ngày</option>
                                    <option value="7">1 Tuần</option>
                                    <option value="30">1 Tháng</option>
                                    <option value="365">1 Năm</option>
                                    <option value="-1">Khác</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="ticket-price"><strong>Giá tiền</strong></label>
                                <input class="form-control" type="text" id="ticket-price" placeholder="Nhập giá tiền của vé"/>
                                <div class="invalid-feedback price-error">
                                    Giá vé nằm trong khoảng từ 1.000vnd đến 50.000vnd
                                </div>
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
                    <div class="mb-3">
                        <button class="btn btn-primary" id="add-ticket-door">Tạo mới</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
