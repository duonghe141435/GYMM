<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Thông tin người dùng</title>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div class="container-fluid" style="padding-top: 80px">
                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">Thông tin người</p>
                    </div>

                    <div class="card-body"><c:url value="/customer/your-profile/update?{_csrf.parameterName}=${_csrf.token}" var="updateUserUrl"/>
                        <form:form method="POST" modelAttribute="user" enctype="multipart/form-data" action="${updateUserUrl}" >
                            <div class="container">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-center">
                                            <img src="${user.u_img}"
                                                 class="rounded-circle" width="150" height="150">
                                            <div class="mt-2">
                                                <label class="btn btn-primary">
                                                    Change Photo
                                                    <input id="profile-image" type="file" name="file-up" hidden>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="mb-3" style="margin-top: 37px;">
                                            <label class="form-label"
                                                   for="gender"><strong>Giới tính</strong></label>
                                            <form:select path="u_gender" class="form-select" id="gender" name="gender" required="required">
                                                <option value="" selected>Chọn giới tính</option>
                                                <form:option value="1">Nam</form:option>
                                                <form:option value="2">Nữ</form:option>
                                                <form:option value="3">Khác</form:option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label"
                                                   for="role_name"><strong>Chức vụ</strong></label>
                                            <%--<form:input class="form-control" type="number" id="role_name"--%>
                                                        <%--value="Huấn luyện viên" name="full-name"--%>
                                                        <%--path="u_id" readonly="true" />--%>
                                            <input id="role_name" class="form-control" value="Huyến luyện viên" readonly>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <div class="mb-3" style="display:none;">
                                            <label class="form-label" for="user-id"><strong>#</strong></label>
                                            <form:input class="form-control" type="number" id="user-id"
                                                        placeholder="Enter your full name" name="full-name"
                                                        path="u_id" readonly="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="full-name"><strong>Tên đầy đủ</strong></label>
                                            <form:input class="form-control" type="text" id="full-name"
                                                        placeholder="Enter your full name" name="full-name"
                                                        path="u_full_name" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label"
                                                   for="email"><strong>Email</strong></label>
                                            <form:input class="form-control" type="email" id="email"
                                                        placeholder="Nhập địa chỉ email của bạn"
                                                        path="u_email" name="email" required="required" readonly="true"/>
                                            <div class="invalid-feedback email-error">
                                                Vui lòng nhập địa chỉ email hợp lệ.
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label"
                                                   for="phone-number"><strong>Số điện thoại</strong></label>
                                            <form:input class="form-control" type="text"
                                                        id="phone-number"
                                                        placeholder="Enter your phone number"
                                                        path="u_phone_number" name="phone-number" required="required" />
                                            <div class="invalid-feedback phone-error">
                                                Xin vui lòng nhập một số điện thoại hợp lệ.
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label"
                                                   for="date-of-birth"><strong>Ngày sinh</strong></label>
                                            <form:input class="form-control" type="date"
                                                        path="u_dob" id="date-of-birth" name="date-of-birth" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label"
                                                   for="address"><strong>Địa chỉ</strong></label>
                                            <form:input class="form-control" type="text" id="address"
                                                        placeholder="Enter your address" name="address"
                                                        path="u_address" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="cccd"><strong>CCCD</strong></label>
                                            <form:input class="form-control" type="text" id="cccd"
                                                        placeholder="Nhập số CCCD" name="full-name"
                                                        path="u_identity_card" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <button class="btn btn-primary" type="submit"
                                                    id="save-btn" disabled>Cập nhập</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Brand 2023</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
</body>
<script>

    $(document).ready(function () {

        // Sử dụng biểu thức chính quy để kiểm tra số điện thoại
        var regex = /^(03|05|07|08|09)+([0-9]{8})$/;
        // Xác định định dạng email của Google
        var googleEmailRegex = /^[a-zA-Z0-9._%+-]+@(gmail|googlemail)\.com$/;

        $("#role").on("change", function () {
            // Nếu giá trị được chọn là "Male"
            if ($(this).val() === "3") {
                // Tạo một thẻ input mới với id là "male-info" và thêm nó vào sau gender-select
                $('<label class="form-label" for="extra-info"><strong>Kinh nhiệm trainer</strong></label><input class="form-control" type="text" id="extra-info" placeholder="Số năm kinh nhiệm" name="extra-info">').insertAfter($(this));
            } else {
                // Nếu giá trị được chọn không phải là "Male", xoá thẻ input có id là "male-info" nếu nó đã tồn tại
                $("#male-info").remove();
            }
        });

        // Lắng nghe sự kiện khi người dùng thay đổi giá trị trong thẻ input
        $("#phone-number").on("input", function () {
            // Lấy giá trị trong thẻ input
            var phone = $(this).val();
            // Kiểm tra nếu số điện thoại hợp lệ thì bỏ qua, ngược lại thì hiển thị thông báo lỗi
            if (regex.test(phone)) {
                $(this).removeClass("is-invalid");
                $(this).addClass("is-valid");
                $("#phone-error").hide();
                $("#submit-btn").prop("disabled", false);
            } else {
                $(this).removeClass("is-valid");
                $(this).addClass("is-invalid");
                $("#phone-error").show();
                $("#submit-btn").prop("disabled", true);
            }
        });


        $('#profile-image').change(function () {
            var fileExtension = ['png', 'jpg', 'jpeg'];
            if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                $('#save-btn').prop('disabled', true);
            } else {
                // Đọc tệp ảnh và chuyển đổi nó thành chuỗi base64
                var reader = new FileReader();
                reader.onload = function (e) {
                    // Cập nhật giá trị của thuộc tính src của thẻ img
                    $('img').attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
                $('#save-btn').prop('disabled', false);
            }
        });
    });


</script>
</html>