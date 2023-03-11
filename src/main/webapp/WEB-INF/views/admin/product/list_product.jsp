<%--
  Created by IntelliJ IDEA.
  User: Duong
  Date: 21-02-2023
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Create New Ticket</title>
    <!-- <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
    <style>
        div.modal input,textarea{margin-top: 13px;}
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="card shadow">

        <div class="card-body shadow">
            <div style="float:left">
                <div class="col-md-6 text-nowrap">
                    <label class="form-label"/>Sắp xếp:
                        <button type="button" class="btn btn-light">Tên</button>
                </div>
            </div>
            <div style="float:left; margin-left: 20px;">
                <div class="col-md-6 text-nowrap">
                    <button type="button" class="btn btn-light">Số lượng</button>
                </div>
            </div>
            <div style="float:left; margin-left: 20px;">
                <select class="form-select" aria-label="Default select example">
                    <option  disabled selected hidden selected>Giá bán</option>
                    <option value="1">Thấp đến cao</option>
                    <option value="2">Cao đến thấp</option>
                </select>
            </div>
            <div style="float:left; margin-left: 20px;">
                <select class="form-select" aria-label="Default select example">
                    <option  disabled selected hidden selected>Trạng thái</option>
                    <option value="1">Đang bán</option>
                    <option value="2">Ngừng bán</option>
                </select>
            </div>
            <div style="float: right;">
                <a href="" class="edit mx-2" data-toggle="tooltip"><button type="button" class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg></button></a>
            </div>
            <div style="float:right; ">

                <input type="text" min="1" max="365" placeholder="Nhập để tìm kiếm" class="form-control" id="searchValue">
            </div>
            <div class="card-header py-3" style="margin-top: 40px;">
                <p class="text-dark h2 text-center">Bảng các sản phảm</p>
            </div>
            <div class="card-body">
                <div class="table-responsive table mt-2"  id="dataTable" role="grid" aria-describedby="dataTable_info">
                    <table class="table table-bordered"  id="dataTable1">
                        <thead>
                        <tr  style="text-align: center;">
                            <th>#</th>
                            <th>Ảnh</th>
                            <th>Tên</th>
                            <th style="width: 90px;">Giá bán</th>
                            <th style="width: 100px;">Ngày thêm</th>
                            <th style="width: 90px;">Giá nhập</th>
                            <th style="width: 90px;">Số lượng</th>
                            <th style="width: 80px;">Đơn vị</th>
                            <th>Mô tả</th>
                            <th style="width: 100px;">Trạng thái</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr style="text-align: center;">
                                <td>1</td>
                                <td><img style="width: 65px; height: 85px;" src="https://kenh14cdn.com/thumb_w/660/2020/7/17/brvn-15950048783381206275371.jpg"/> </td>
                                <td>Nước lọc</td>
                                <td></td>
                                <td></td>
                                <td></td>

                                <td></td>
                                <td></td>
                                <td>
                               </td>
                                <td>
                                    <button type="button" class="btn btn-danger"><i class="fa fa-lock" aria-hidden="true"></i></button>
                                    <button type="button" class="btn btn-primary"><i class="fa fa-unlock-alt" aria-hidden="true"></i></button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">Cập nhập</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="row">
                    <div class="col-md-6 align-self-center">
                        <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Hiển thị bản ghi số 1 -> 10 trên tổng 27 bản ghi.</p>
                    </div>
                    <div class="col-md-6">
                        <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
                            </ul>
                        </nav>
                        <button type="button" class="btn btn-primary d-flex justify-content-center"  data-bs-toggle="modal" data-bs-target="#addModal">
                            Thêm sản phẩm
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <i class="fa fa-trash"></i>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Xóa sản phảm khỏi danh sách ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <a href=""><button type="button" class="btn btn-primary">Có</button></a>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div >
            <div class="modal-dialog">
                <div>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="py-5">
                            <div class="container">
                                <p class="text-dark h2 text-center">Thêm sản phẩm</p>
                                <form class="action=">
                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-4" style="width: 130px;" for="nameAdd">Tên sản phẩm:</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="nameAdd" name="">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="priceAdd">Giá bán:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="0" class="form-control" id="priceAdd" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="quantityAdd">Số lượng:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="1" max="365"  class="form-control" id="quantityAdd" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="oPriceAdd">Giá nhập:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="0" class="form-control" id="oPriceAdd" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="unitAdd">Đơn vị:</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="unitAdd" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="desAdd">Mô tả sản phẩm:</label>
                                            <div class="col-sm-6">
                                        <textarea name="txtComment" class="d-flex justify-content-start" style="padding-top: 0px ;width: 240px; font-family: 'Courier New', Courier, monospace;" readonly id="desAdd" rows="5" cols="20">
                                        </textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <button style="width: 200px;" type="submit" class="btn btn-primary btn-block mt-5">Thêm</button>
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
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div >
            <div class="modal-dialog">
                <div>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="py-5">
                            <div class="container">
                                <p class="text-dark h2 text-center">Cập nhập sản phẩm</p>
                                <form class="action=">
                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-4" style="width: 130px;" for="typeofticket">Tên:</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="typeofticket" name="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="priceUu">Giá bán:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="0" class="form-control" id="priceUu" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="quantityUp">Số lượng:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="1" max="365"  class="form-control" id="quantityUp" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="typeoftime">Giá nhập:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="0" class="form-control" id="typeoftime" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <select class="form-select" style="width: 170px; margin-left: 130px;" aria-label="Default select example">
                                                <option  disabled selected hidden selected>Đơn vị</option>
                                                <option value="1">Chai</option>
                                                <option value="2">Cái</option>
                                            </select>
                                            <button type="button" data-bs-toggle="modal" data-bs-target="#plusModal" style="width: 40px; text-align: center;" class="btn btn-primary">+</button>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" style="width: 130px;" for="typeoftime">Mô tả sản phẩm:</label>
                                            <div class="col-sm-6">
                                        <textarea name="txtComment" class="d-flex justify-content-start" style="padding-top: 0px ;width: 240px; font-family: 'Courier New', Courier, monospace;" readonly id="txtComment" rows="5" cols="20">
                                        </textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <button style="width: 200px;" type="submit" class="btn btn-primary btn-block mt-5">Cập nhập</button>
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
</div>
    <script>
        function myFunction() {
            const start = Date.now();
            alert(start);
        }
    </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
