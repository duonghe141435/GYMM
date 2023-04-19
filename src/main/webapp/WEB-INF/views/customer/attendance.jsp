<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/19/2023
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <%@include file="/WEB-INF/views/layouts/head_tag.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><dec:title default="Master-Layout" />Lớp học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
<body>
<div style="margin-left: 13%;">
    <div style="text-align: center">
        <label style="font-weight: bold; font-size: 35px; color: blue;">Bảng điểm danh của lớp</label>
        <p style="display: none" id="class_id"> 7 </p>
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
                            <%--<count></count>--%>
                            ${index.count}
                        </td>
                        <td style="width: 75px;"><img style="width: 70px;height: 90px;" src="${list_user_of_class.u_img}"></td>
                        <td>${list_user_of_class.u_email}</td>
                        <td>${list_user_of_class.u_full_name}</td>
                        <td><input type="checkbox" class="a"></td>
                        <td style="display: none" id="userID">${list_user_of_class.u_id}</td>
                    </tr>
                </c:forEach>
        </c:if>
    </tbody>
</table>


<div class="center">
    <button style="width: 70px;" class="btn-primary" id="saveBtn" onclick="save()">Lưu lại</button>
    <%--<button style="margin-left: 10%; width: 70px;"  class="btn-danger" id="editBtn" onclick="edit()" hidden>edit</button>--%>
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
        for (var i = 0; i < checkboxes.length; i++) {
            var id = document.getElementById("userID").innerText;
            if (!checkboxes[i].checked) {

                console.log("classid: " + id);
                // var data = {
                //     "_user_id" : 1,
                //     "_class_id" : 7,
                //     "_status" : 1,
                //     "_attendance_date" : "4-18-2023"
                // };
                // attendence.push(data);
            }
            if (checkboxes[i].checked) {
                console.log("classid: " + id);
                // var data = {
                //             "_user_id" : 1,
                //             "_class_id" : 7,
                //             "_status" : 1,
                //             "_attendance_date" : "4-18-2023"
                // };
                // attendence.push(data);
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

    }
    function edit() {
        var checkboxes = document.getElementsByClassName("a");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].removeAttribute('disabled');
        }
    }
</script>

<%--<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>--%>
</html>

