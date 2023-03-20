<%--
  Created by IntelliJ IDEA.
  User: HongWung
  Date: 3/7/2023
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Duong
  Date: 21-02-2023
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">

    <style>
        body {
            /* Set "my-sec-counter" to 0 */
            counter-reset: my-sec-counter;
        }
        .containerImg{
            height: 50px;
            width: 200px;
            position: relative;
        }
        .containerImg .wrapper{
            position: relative;
            height: 250px;
            width: 100%;
            border-radius: 10px;
            background: #fff;
            border: 2px dashed #c2cdda;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
        }
        .wrapper.active{
            border: none;
        }
        .wrapper .image{
            position: absolute;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .wrapper img{
            height: 100%;
            width: 100%;
            object-fit: cover;
        }
        .wrapper .icon{
            font-size: 100px;
            color: #9658fe;
        }
        .wrapper .text{
            font-size: 20px;
            font-weight: 500;
            color: #5B5B7B;
        }
        .wrapper #cancel-btn i{
            position: absolute;
            font-size: 20px;
            right: 15px;
            top: 15px;
            color: #FF1493;
            cursor: pointer;
            display: none;
        }
        .wrapper.active:hover #cancel-btn i{
            display: block;
        }
        .wrapper #cancel-btn i:hover{
            color: #FF1493;
        }
        .wrapper .file-name{
            position: absolute;
            bottom: 0px;
            width: 100%;
            padding: 8px 0;
            font-size: 18px;
            color: #fff;
            display: none;
            background: linear-gradient(135deg,#00008B 0%,#00BFFF 100%);
        }
        .wrapper.active:hover .file-name{
            display: block;
        }
        .containerImg #custom-btn{
            margin-top: 30px;
            display: block;
            width: 100%;
            height: 50px;
            border: none;
            outline: none;
            border-radius: 25px;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            background: linear-gradient(135deg,#00008B 0%,#00BFFF 100%);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
        }

        count::before {
            /* Increment "my-sec-counter" by 1 */
            counter-increment: my-sec-counter;
            content: counter(my-sec-counter) ;
        }
        div.modal input,textarea,label,select{margin-top: 13px;}
        div.modal label{margin-left: 185px; margin-top: 22px;}
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <%@include file="/WEB-INF/views/layouts/admin/menu.jsp" %>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid">

                <div class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">Ticket Info</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label
                                        class="form-label">Show&nbsp;<select
                                        class="d-inline-block form-select form-select-sm">
                                    <option value="10" selected="">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label
                                        class="form-label"><input type="search" class="form-control form-control-sm"
                                                                  aria-controls="dataTable"
                                                                  placeholder="Search"></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid"
                             aria-describedby="dataTable_info">
                            <table class="table my-0" id="ticket_table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên</th>
                                    <th>Giá nhập</th>
                                    <th>Giá bán</th>
                                    <th>Ngày thêm</th>
                                    <th>Số lượng</th>
                                    <th>Đơn vị</th>
                                    <th>Mô tả</th>
                                    <th>Trạng thái</th>
                                    <th>Phân loại</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:if test="${not empty productDtos}">

                                    <c:forEach items="${productDtos}" var="productDtos">
                                        <td><count></count></td>
                                        <%--<input type="hidden" class="product_id" name="" value="${tickets.t_id}">--%>
                                        <td class="product_name">${productDtos.p_name}</td>
                                        <td id="money" class="product_price"><span>${productDtos.p_price}</span> </td>
                                        <td id="money1" class="product_oPrice"><span>${productDtos.p_Oprice}</span> </td>
                                        <td class="product_date_add">${productDtos.p_create}</td>
                                        <td class="product_quantity">${productDtos.p_quantity}</td>
                                        <td class="product_unit">${productDtos.p_unit_name}</td>
                                        <td class="product_description">${productDtos.p_description}</td>
                                        <td class="product_status">${productDtos.p_status}</td>
                                        <td class="product_kind">${productDtos.p_kind_name}</td>
                                        <td>
                                            <a id="update_product" class="ticket_view" data-bs-toggle="modal" data-bs-target="#UAModal">
                                                <i class="fas fa-eye fa-lg fa-fw me-2 text-primary"></i>
                                            </a>
                                            <a class="ticket_delete">
                                                <i class="fas fa-trash fa-lg fa-fw me-2 text-danger"
                                                   title="Xóa vé"></i>
                                            </a>
                                        </td>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing
                                    1 to 10 of 27</p>
                            </div>
                            <div class="col-md-6">
                                <%--<nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">--%>
                                <%--<ul class="pagination">--%>
                                <%--<li class="page-item disabled">--%>
                                <%--<a class="page-link" href="#" aria-label="Previous">--%>
                                <%--<span aria-hidden="true">«</span>--%>
                                <%--</a>--%>
                                <%--</li>--%>
                                <%--<li class="page-item active">--%>
                                <%--<a class="page-link" href="#">1</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                                <%--<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span--%>
                                <%--aria-hidden="true">»</span></a></li>--%>
                                <%--</ul>--%>
                                <%--</nav>--%>
                            </div>
                        </div>
                    </div>
                    <button id="add_product" type="button" class="btn btn-primary d-flex justify-content-center"  data-bs-toggle="modal" data-bs-target="#UAModal">
                        Thêm sản phẩm
                    </button>
                </div>
            </div>
        </div>
        <div class="modal fade bd-example-modal-lg" id="UAModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div >
                <div class="modal-dialog modal-lg">
                    <div>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="py-5">
                                <div class="container">
                                    <p id="title_product_form" class="text-dark h2 text-center">Cập nhập sản phẩm</p>
                                    <form class=""action="">
                                        <a onclick="defaultBtnActive()" id="custom-btn">
                                            <div class="containerImg">
                                                <div class="wrapper">
                                                    <div class="image">
                                                        <img  id="image_product" src="">
                                                    </div>
                                                    <div class="content">
                                                        <div class="icon">
                                                            <i  class="fas fa-cloud-upload-alt"></i>
                                                        </div>
                                                        <div class="text">
                                                            Chọn Hình Ảnh
                                                        </div>
                                                    </div>
                                                    <div id="cancel-btn">
                                                        <i class="fas fa-times"></i>
                                                    </div>
                                                    <div class="file-name">
                                                        Tên File
                                                    </div>
                                                </div>
                                                <input id="default-btn" type="file" hidden>
                                            </div>
                                        </a>
                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-4" style="width: 130px;" for="pr_name">Tên:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" required class="form-control" id="pr_name" name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" style="width: 130px;" for="price">Giá bán:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" required min="0" class="form-control" id="price" name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" style="width: 130px;" for="quantityUp">Số lượng:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" required min="1" max="365"  class="form-control" id="quantityUp" name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" style="width: 130px;" for="oPrice">Giá nhập:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" min="0" required class="form-control" id="oPrice" name="">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group" >
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" >Đơn vị:</label>
                                                <div class="col-sm-6">
                                                    <select id="product_unit"  style="width: 320px; float: left;" class="form-select">
                                                        <option value="1">Chai</option>
                                                        <option value="2">Cái</option>
                                                    </select>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#plusModal" style="width: 40px;float: right; margin-top: 13px; text-align: center;">+</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group" >
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2 mt-3" >Phân loại:</label>
                                                <div class="col-sm-6">
                                                    <select id="product_type"  style="width: 320px; float: left;" class="form-select">
                                                        <option value="1">Luyện tập</option>
                                                        <option value="2">Thực phẩm</option>
                                                    </select>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#plusModal" style="width: 40px;float: right; margin-top: 13px; text-align: center;">+</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label1 class="form-label col-sm-2" style="width: 170px; margin-top: 70px;" for="typeoftime">Mô tả sản phẩm:</label1>
                                                <div class="col-sm-6">
                                        <textarea name="txtComment" class="d-flex justify-content-start" style="padding-top: 0px ;width: 450px; font-family: 'Courier New', Courier, monospace;" readonly id="txtComment" rows="5" cols="20">
                                        </textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <button style="width: 200px;" id="btnAdd" value="create" class="btn btn-primary btn-block mt-5">Cập nhập</button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="plusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">+Thêm đơn vị sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2" style="width: 130px;" for="nameUnit">Tên đơn vị:</label>
                                <div class="col-sm-6">
                                    <input type="text" min="0" class="form-control" id="nameUnit" name="">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row d-flex justify-content-center">
                                <label class="form-label col-sm-2" style="width: 130px;" for="typeofprice">Ngày thêm:</label>
                                <div class="col-sm-6">
                                    <input type="date" readonly value="2023-03-10" class="form-control" id="typeofprice" name="">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <a href=""><button type="button" class="btn btn-primary">Có</button></a>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>

</body>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script>

    function required()
    {
        var empt = document.form1.text1.value;
        if (empt === "")
        {
            alert("Please input a Value");
            return false;
        }
        else
        {
            alert('Code has accepted : you can try another');
            return true;
        }
    }

    window.addEventListener('load', function() {
        document.querySelector('input[type="file"]').addEventListener('change', function() {
            if (this.files && this.files[0]) {
                var img = document.getElementById("image_product");
                img.onload = () => {
                    URL.revokeObjectURL(img.src);  // no longer needed, free memory
                }

                img.src = URL.createObjectURL(this.files[0]); // set src to blob url
            }
        });
    });


    // let id_product;

    $("#add_product").click(function () {
        $("#title_product_form").html("Tạo mới sản phẩm")
        $("#product_img").val("");
        $("#product_name").val("");
        $("#product_price").val("");
        $("#product_quantity").val("");
        $("#product_oPrice").val("");
        $("#product_description").val("");
        $("#product_unit").val("");
        $("#btnAdd").html("Thêm mới").prop('value', 'create');
    });


    $("#update_product").click(function () {
        $("#title_product_form").html("Cập nhập sản phẩm");
        $("#product_img").val($(this).parent().siblings('.product_img').text());
        $("#product_name").val($(this).parent().siblings('.pr_name').text());
        $("#product_price").val($(this).parent().siblings('.price').text());
        $("#product_quantity").val($(this).parent().siblings('.quantityUp').text());
        $("#product_oPrice").val($(this).parent().siblings('.oPrice').text());
        $("#product_unit").val($(this).parent().siblings('.product_unit').text());
        $("#product_type").val($(this).parent().siblings('.product_type').text());
        $("#btnAdd").html("Cập nhập").prop('value', 'create');
    });

    //     $("#ticket_table").on('click', '.product_update', function () {
    //         $("#title-form").html("Cập nhập vé tập")
    //         $("#ticke_name").val($(this).parent().siblings('.ticket_name').text());
    //         $("#ticket_price").val($(this).parent().siblings('.ticket_price').text());
    //         $("#ticket_day").val($(this).parent().siblings('.ticket_day').text());
    //         $("#ticket_date").val($(this).parent().siblings('.ticket_date').text());
    //         $("#ticket_type").val($(this).parent().siblings('.ticket_ttids').text())
    //         $("#btnTickets").html("Cập nhập").prop('value', 'update');
    //     });
    // });

    const wrapper = document.querySelector(".wrapper");
    const fileName = document.querySelector(".file-name");
    const defaultBtn = document.querySelector("#default-btn");
    const customBtn = document.querySelector("#custom-btn");
    const cancelBtn = document.querySelector("#cancel-btn i");
    const img = document.querySelector("img");
    let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
    function defaultBtnActive(){
        defaultBtn.click();
    }
    defaultBtn.addEventListener("change", function(){
        const file = this.files[0];
        if(file){
            const reader = new FileReader();
            reader.onload = function(){
                const result = reader.result;
                img.src = result;
                wrapper.classList.add("active");
            }
            cancelBtn.addEventListener("click", function(){
                img.src = "";
                wrapper.classList.remove("active");
            })
            reader.readAsDataURL(file);
        }
        if(this.value){
            let valueStore = this.value.match(regExp);
            fileName.textContent = valueStore;
        }

    });
    const moneyEl = document.getElementById('money');
    const moneyEl1 = document.getElementById('money1');
    // Format money with comma separator and ₫ symbol prefix
    const formattedMoney = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(moneyEl.innerText);

    const formattedMoney1 = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(moneyEl1.innerText);

    // Update the element content with the formatted money
    moneyEl.innerText = formattedMoney;
    moneyEl1.innerText = formattedMoney1;
</script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/assets/js/bs-init.js'/>"></script>
<script src="<c:url value='/assets/js/theme.js'/>"></script>
</html>
