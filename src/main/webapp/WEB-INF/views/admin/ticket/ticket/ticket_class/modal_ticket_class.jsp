<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="ticket-class" tabindex="-1" role="dialog" aria-hidden="true" style="left: -6%;overflow: hidden">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="min-width: 980px;">
            <div class="modal-header">
                <p class="text-primary m-0 fw-bold text-start">Thêm vé tham gia lớp học</p>
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
                        </div>

                        <div class="col-6">
                            <div class="mb-3">
                                <label class="form-label" for="state-class"><strong>Trạng thái</strong></label>
                                <select id="state-class" class="form-select">
                                    <option value="0">Chưa khai giảng</option>
                                    <option value="1">Đang học</option>
                                    <option value="2">Ngừng học</option>
                                    <option value="3">Đã hủy</option>
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

                        <div class="col-md-8">
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
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <form class="col-md-4" >
                            <div class="form-group">
                                <div class="row d-flex">
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
                                <div class="row d-flex">
                                    <label class="form-label col-sm-3 mt-3 p-0" for="ticket-price">Giá vé:</label>
                                    <div class="col-sm-8 mt-2">
                                        <input class="form-control" type="text" id="ticket-price" placeholder="Nhập giá tiền"/>
                                        <div class="invalid-feedback price-error">
                                            Giá vé nằm trong khoảng từ 1.000vnd đến 50.000vnd
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row d-flex">
                                    <label class="form-label col-sm-3 mt-3 p-0" for="max-member">Member:</label>
                                    <div class="col-sm-8 mt-2">
                                        <select id="max-member" class="form-select" required>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row d-flex">
                                    <label class="form-label col-sm-3 mt-3 p-0" for="time-select">Ca tập:</label>
                                    <div class="col-sm-8 mt-2">
                                        <select id="time-select" class="form-select" required>
                                            <c:forEach items="${times}" var="times">
                                                <option value="${times.id_time}">${times.start_time} - ${times.end_time}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>         <div class="form-group">
                            <div class="row d-flex">
                                <label class="form-label col-sm-3 mt-3 p-0" for="date-start">Ngày bắt đầu:</label>
                                <div class="col-sm-8 mt-2">
                                    <input type="date" class="form-control" id="date-start" required/>
                                </div>
                            </div>
                        </div>
                            <div class="form-group">
                                <div class="row d-flex">
                                    <button style="width: 200px;" id="add-class" class="btn btn-primary">Thêm huấn luyện viên</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <hr/>

                    <div class="mb-3">
                        <button class="btn btn-primary" type="submit" id="add-ticket-class">Tạo mới</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>