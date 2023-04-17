<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><dec:title default="Master-Layout" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        tbody tr{
            height: 100px !important;
        }
        .today {
            background-color: lightblue;
        }

        .past {
            background-color: lightgray;
        }

        .future {
            background-color: white;
        }
        /* thead tr{
        } */
        .clicked {
            background-color: red;
            color: white;
        }
        th,td{
            width: 80px !important;
        }
        th{
            background-color:#f0fcfc !important;
        }
        select{
            box-shadow: 1px 3px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        #myBook:hover {
            background-color: yellow;
            border-color: black;
        }

    </style>
</head>
<body>
<div style="text-align: center">
    <label style="font-weight: bold; font-size: 35px; color: blue;">Bảng lịch hẹn huấn luyện</label>
</div>
<div class="card-body">
    <label style="border: 2px solid #000;">Thời gian:&nbsp;</label>
    <select id="week-select"></select>

    <select id="year-select"></select>

</div>
<table class="table-bordered border-collapse table-responsive " id="time_book_table"  style="float: left; text-align: center;margin-left: 1%; width: 74%;margin-bottom: 100px;">
    <thead>
    <tr>
        <th>Thời gian</th>
        <th id="0"></th>
        <th id="1"></th>
        <th id="2"></th>
        <th id="3"></th>
        <th id="4"></th>
        <th id="5"></th>
        <th id="6"></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th>05:00-06:30</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th>06:30-08:00</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th>08:30-10:00</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th>16:00-17:30</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th>17:30-19:00</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th>19:00-20:30</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th>20:30-22:00</th>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    </tbody>
</table>
<div style="text-align: center;font-weight: bold;color: blue;">
    Danh sách lịch hẹn
</div>

<label style="text-align: center; border: 2px solid #000; margin-left: 3%; width: 20%; height: 500px;">
    </br>
    9h-10h: Nguyễn Văn A</br>
    <a href="">Xác nhận</a>--<a href="">Hủy</a>
</label>


</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/assets/js/lsbook_pt.js'/>"></script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</html>
