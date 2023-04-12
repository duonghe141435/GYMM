<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="ticket-class" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="min-width: 980px; min-height: 620px">
            <div class="modal-header">
                <p class="text-primary m-0 fw-bold text-start">Thêm lớp</p>
                <button id="close-add-class" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-4">
                            <div class="mb-3">
                                <label class="form-label" for="class-name"><strong>Tên lớp</strong></label>
                                <input class="form-control" type="text" id="class-name" placeholder="Nhập tên lớp học" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="trainer-class"><strong>Tên huấn luyện viên</strong></label>
                                <select id="trainer-class" class="form-select">
                                    <c:forEach items="${trainer}" var="trainer">
                                        <option value="${trainer.u_id}">${trainer.u_full_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <label  class="form-label" for="time-select">Ca tập:</label>
                                <select id="time-select" class="form-select" required>
                                    <c:forEach items="${times}" var="times">
                                        <option value="${times.id_time}">${times.start_time} - ${times.end_time}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="max-member"><strong>Member:</strong></label>
                                <select id="max-member" class="form-select" required>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="mb-3">
                                <label class="form-label" for="date-start">Ngày bắt đầu:</label>
                                <input type="date" class="form-control" id="date-start" required/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="class-price"><strong>Giá tham gia lớp học / 1 người</strong></label>
                                <input class="form-control" type="text" id="class-price" placeholder="Nhập giá tiền"/>
                                <div class="invalid-feedback price-error">
                                    Giá vé nằm trong khoảng từ 1.000vnd đến 50.000vnd
                                </div>
                            </div>
                        </div>
                        <button style="width: 200px;"  class="btn btn-primary" id="btn-add-class">Thêm lớp học</button>
                    </div>
                    <div class="row align-items-center">
                        <label class="form-label"><strong>Lịch tập</strong></label>
                        <table>
                            <thead>
                            <tr>
                                <th class="text-center">Chủ nhật</th>
                                <th class="text-center">Thứ 2</th>
                                <th class="text-center">Thứ 3</th>
                                <th class="text-center">Thứ 4</th>
                                <th class="text-center">Thứ 5</th>
                                <th class="text-center">Thứ 6</th>
                                <th class="text-center">Thứ 7</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="text-center"><input checked type="checkbox" name="1" id="1"></td>
                                <td class="text-center"><input checked type="checkbox" name="1" id="2"></td>
                                <td class="text-center"><input checked type="checkbox" name="1" id="3"></td>
                                <td class="text-center"><input checked type="checkbox" name="1" id="4"></td>
                                <td class="text-center"><input checked type="checkbox" name="1" id="5"></td>
                                <td class="text-center"><input checked type="checkbox" name="1" id="6"></td>
                                <td class="text-center"><input checked type="checkbox" name="1" id="7"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <hr/>
                    <div class="row">
                        <table class="table my-0" id="class-table">
                            <thead>
                            <tr>
                                <th>Huấn luyện viên</th>
                                <th>Ca tập</th>
                                <th>Giá vé</th>
                                <th>Ngày bắt đầu</th>
                                <th>Member</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody style="display: contents;width: 100%;overflow: auto;">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
