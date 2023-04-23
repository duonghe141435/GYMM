<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <title>Điểm danh lớp học</title>
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <style>

        th{
            background-color:#f0fcfc !important;
        }
        select{
            box-shadow: 1px 3px;
        }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        button {
            margin-bottom: 2%;
        }

    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/trainer/header.jsp" %>
            <div style="margin-left: 13%;">
                <div style="text-align: center">
                    <label style="font-weight: bold; font-size: 35px; color: blue;">Bảng điểm danh của lớp</label>
                    <p style="display: none" id="class_id">7</p>
                </div>
                <%--<div class="card-body">--%>

                <%--<select id="date" name="date">--%>
                <%--<option value="">17/4</option>--%>
                <%--<option value="">18/4</option>--%>
                <%--<option value="" selected>Hôm nay</option>--%>
                <%--<option value="">20/4</option>--%>
                <%--<option value="">21/4</option>--%>
                <%--</select>--%>

                <%--</div>--%>
            </div>

            <table border="1" class="table table-responsive " id="class_table"  style=" margin-left: 13%; text-align: center; width: 74%;">
                <thead>
                <tr>
                    <th>STT</th>
                    <th id="0">Ảnh</th>
                    <th id="1">Email</th>
                    <th id="2">Tên học viên</th>
                    <th id="3">Điểm danh</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty list_user_of_class}">
                    <c:forEach varStatus="index" items="${list_user_of_class}" var="list_user_of_class">
                        <tr>
                            <td class="text-center">
                                <count></count>
                                    <%--${index.count}--%>
                            </td>
                            <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="${list_user_of_class.u_img}"></td>
                            <td>${list_user_of_class.u_email}</td>
                            <td>${list_user_of_class.u_full_name}</td>
                            <td><input type="checkbox" class="a"></td>
                            <p style="display: none" id="userID${index.count}">${list_user_of_class.u_id}</p>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>


            <div class="center">
                <button style="width: 70px; color: white; background-color: #20c9a6" class="btn-primary" id="saveBtn" onclick="save()">Lưu lại</button>
                <%--<button style="margin-left: 10%; width: 70px;"  class="btn-danger" id="editBtn" onclick="edit()" hidden>edit</button>--%>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <%@include file="/WEB-INF/views/layouts/trainer/footer.jsp" %>
            </div>
        </footer>
    </div>
</div>
</body>
<script>

    // $(document).on('click', 'input.a', function() {
    //     if ($(this).prop('checked')) {
    //
    //         console.log("checked");
    //     } else {
    //         console.log("no");
    //     }
    // });


    function save() {
        var token = $("meta[name='_csrf']").attr("content");
        var checkboxes = document.querySelectorAll("input.a");

        var attendence = [];
        var classId = document.getElementById("class_id").innerText;
        console.log("classId: " + classId);
        for (var i = 0; i < checkboxes.length; i++) {
            var id = "userID" + (i + 1);
            var user_id = document.getElementById(id).innerText;

            if (!checkboxes[i].checked) {
                var data = {
                    "_user_id" : user_id,
                    "_class_id" : classId,
                    "_status" : 0
                };
                attendence.push(data);
            }
            if (checkboxes[i].checked) {

                var data = {
                    "_user_id" : user_id,
                    "_class_id" : classId,
                    "_status" : 1
                };
                attendence.push(data);
            }

            // checkboxes[i].addEventListener('click', function() {
            //     if (this.checked) {
            //         console.log('Checkbox chọn' + i);
            //     } else {
            //         console.log('Checkbox bị bỏ chọn' + i);
            //     }
            // });
        }
        var data = {
            'attendence': JSON.stringify(attendence),
            _csrf: token
        };
        console.log(data);
        $.ajax({

            url: '/trainerApi/attendanceClass',
            type: 'POST',
            data: data,
            success: function(response) {
                Swal.fire('Bạn đã điểm danh thành công', '', 'success');
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }
    function edit() {
        var checkboxes = document.getElementsByClassName("a");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].removeAttribute('disabled');
        }
    }
</script>
</html>
