<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tạo tài khoản nhân viên mới</title>
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
                        <p class="text-primary m-0 fw-bold">Thêm mới người dùng</p>
                    </div>
                    <div class="card-body">
                        <c:url value="/admin/dashboard/users/save?${_csrf.parameterName}=${_csrf.token}" var="saveUserUrl" />
                        <form:form method="POST" modelAttribute="user" enctype="multipart/form-data" action="${saveUserUrl}">
                            <div class="container">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="text-center">
                                            <img src="https://via.placeholder.com/150" class="rounded-circle" width="150" height="150">
                                            <div class="mt-2">
                                                <label class="btn btn-primary">
                                                    Change Photo
                                                    <input id="profile-image" type="file" name="file-up" hidden>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="mb-3" style="margin-top: 37px;">
                                            <label class="form-label" for="gender"><strong>Giới tính</strong></label>
                                            <form:select path="u_gender" class="form-select" id="gender" name="gender"
                                                         required="required">
                                                <option value="" selected>Chọn giới tính</option>
                                                <form:option value="1">Nam</form:option>
                                                <form:option value="2">Nữ</form:option>
                                                <form:option value="3">Khác</form:option>
                                            </form:select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="role"><strong>Chức vụ</strong></label>
                                            <form:select path="r_id" class="form-select" id="role" name="role" required="required">
                                                <option value="0" selected>Chọn chức vụ người dùng</option>
                                                <c:forEach items="${roles}" var="roles">
                                                    <form:option value="${roles.r_id}">${roles.r_description}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <div class="row">
                                            <div class="col-6">
                                                <form:input style="display:none;" class="form-control" type="number" id="user-id"
                                                            path="u_id" readonly="true" />
                                                <div class="mb-3">
                                                    <label class="form-label" for="full-name"><strong>Tên đầy đủ</strong></label>
                                                    <form:input class="form-control" type="text" id="full-name"
                                                                placeholder="Nhập tên người dùng" name="full-name" path="u_full_name"
                                                                required="required" />
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label class="form-label" for="email"><strong>Email</strong></label>
                                                    <form:input class="form-control" type="email" id="email"
                                                                placeholder="Nhập địa chỉ email người dùng" path="u_email" name="email"
                                                                required="required" />
                                                    <div class="invalid-feedback email-error">
                                                        Vui lòng nhập địa chỉ email hợp lệ.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label class="form-label" for="phone-number"><strong>Số điện thoại</strong></label>
                                                    <form:input class="form-control" type="text" id="phone-number"
                                                                placeholder="Nhập số điện thoại người dùng" path="u_phone_number" required="required" />
                                                    <div class="invalid-feedback phone-error">
                                                        Xin vui lòng nhập một số điện thoại hợp lệ.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label class="form-label" for="cccd"><strong>CCCD</strong></label>
                                                    <form:input class="form-control" type="text" id="cccd" placeholder="Nhập số CCCD"
                                                                name="full-name" path="u_identity_card" required="required" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="password"><strong>Mật khẩu</strong></label>
                                            <form:input class="form-control" type="password" id="password"
                                                        placeholder="Nhập mật khẩu người dùng" path="u_password" name="email" required="required" />
                                            <div class="invalid-feedback password-error">
                                                Vui lòng nhập mật khẩu hợp lệ.
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label" for="date-of-birth"><strong>Ngày sinh</strong></label>
                                            <form:input class="form-control" type="date" path="u_dob" id="date-of-birth"
                                                        name="date-of-birth" required="required" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="address"><strong>Địa chỉ</strong></label>
                                            <form:input class="form-control" type="text" id="address"
                                                        placeholder="Enter địa chỉ người dùng" name="address" path="u_address" />
                                        </div>

                                        <div class="mb-3">
                                            <button class="btn btn-primary" type="submit" id="save-btn" disabled>Tạo mới</button>
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
                $('<label class="form-label" for="extra-info"><strong>Kinh nhiệm của huấn luyện viên</strong><span>Tính theo năm</span>' +
                    '</label><input class="form-control" type="text" id="extra-info" placeholder="Số năm kinh nhiệm" name="extra-info">').insertAfter($(this));
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

        // Lắng nghe sự kiện khi người dùng nhập email
        $('#email').on('input', function () {
            // Lấy giá trị email từ form
            var email = $(this).val();
            // Kiểm tra email có đúng định dạng của Google hay không
            if (googleEmailRegex.test(email)) {
                // Email hợp lệ, ẩn thông báo lỗi
                $(this).removeClass("is-invalid");
                $(this).addClass("is-valid");
                $('#email-error').hide();
                $("#submit-btn").prop("disabled", false);
            } else {
                // Email không hợp lệ, hiển thị thông báo lỗi
                $(this).removeClass("is-valid");
                $(this).addClass("is-invalid");
                $('#email-error').show();
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
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>

</html>