<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Thông tin lớp học</title>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div class="container-fluid min-vh-100">
                <div style="margin-right: 20%;">
                    <div style="text-align: center">
                        <label style="font-weight: bold; font-size: 35px; color: blue;">Bảng danh sách học viên</label>
                    </div>
                    <div class="card-body">

                        <select id="date" name="date">
                            <option value="">17/4</option>
                            <option value="">18/4</option>
                            <option value="" selected>Hôm nay</option>
                            <option value="">20/4</option>
                            <option value="">21/4</option>
                        </select>

                    </div>
                </div>

                <table border="1" class="table table-responsive" id="time_book_table"  style=" margin-left: 1%; text-align: center; width: 74%;margin-bottom: 100px; float: left;">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th id="0">Ảnh</th>
                        <th id="1">Mã học viên</th>
                        <th id="2">Tên học viên</th>
                        <th id="3">Điểm danh</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>1</td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"></td>
                        <td>111</td>
                        <td>Nguyen Van A</td>
                        <td style="color: red;">Vắng</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"></td>
                        <td>222</td>
                        <td>Nguyen Van A</td>
                        <td style="color: blue;">Có mặt</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"></td>
                        <td>333</td>
                        <td>Nguyen Van A</td>
                        <td style="color: blue;">Có mặt</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"></td>
                        <td>444</td>
                        <td>Nguyen Van A</td>
                        <td style="color: blue;">Có mặt</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"></td>
                        <td>555</td>
                        <td>Nguyen Van A</td>
                        <td style="color: red;">Vắng</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="https://kenh14cdn.com/thumb_w/620/2020/7/17/brvn-15950048783381206275371.jpg"></td>
                        <td>666</td>
                        <td>Nguyen Van A</td>
                        <td style="color: red;">Vắng</td>
                    </tr>

                    </tbody>
                </table>
                <label style="font-weight: bold; font-size: 25px; color: blue; margin-left: 5%;">Thông tin lớp học</label>
                <label style="border: 2px solid #000; width: 22%; float: right; margin-right: 1%; margin-top: 20px; height: 400px;">
                    </br>
                    <div style="margin-left: 1%;">
                        <p style="font-weight: bold; display: inline-block;">- Tên lớp:&nbsp;</p><p style="display: inline-block; color: blue;"> Boxing</p></br>
                        <p style="font-weight: bold; display: inline-block;">- Huấn luện viên:&nbsp;</p><p style="display: inline-block; color: blue;"> Nguyễn Văn A</p></br>
                        <p style="font-weight: bold; display: inline-block;">- Ngày bắt đầu:&nbsp;</p><p style="display: inline-block; color: blue;"> 18-4-2023</p></br>
                        <p style="font-weight: bold; display: inline-block;">- Ngày kết thúc:&nbsp;<p style="display: inline-block; color: blue;">20-5-2023</p></br>
                        <p style="font-weight: bold; display: inline-block;">- Số lượng thành viên tối đa:&nbsp;</p><p style="display: inline-block; color: blue;"> 10</p></br>
                        <p style="font-weight: bold; display: inline-block;">- Thành viên đã đăng ký:&nbsp;</p><p style="display: inline-block; color: blue;"> 6/10</p></br>
                    </div>
                </label>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/trainer/footer.jsp" %>
    </div>
</div>
</body>
</html>
