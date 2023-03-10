<%--
  Created by IntelliJ IDEA.
  User: Duong
  Date: 21-02-2023
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - Brand</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/fonts/fontawesome-all.min.css">
</head>

<body>
<div class="container-fluid">
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-dark h2 text-center">List ticket trainer table</p>
        </div>
        <div class="card-body shadow">

            <div style="float:left; margin-left: 10px;">
                <div class="col-md-6 text-nowrap">
                    <label class="form-label"/>Sắp xếp theo:
                        <button type="button" class="btn btn-light">Tên</button>
                </div>
            </div>

            <div style="float:left; margin-left: 10px;">
                <div class="col-md-6 text-nowrap">
                    <button type="button" class="btn btn-light">Kinh nghiệm</button>
                </div>
            </div>

            <div style="float:left; margin-left: 10px;">
                <select class="form-select" aria-label="Default select example">
                    <option  disabled selected hidden selected>Giá</option>
                    <option value="1">Thấp đến cao</option>
                    <option value="2">Cao đến thấp</option>
                </select>
            </div>

            <div style="float:left; margin-left: 10px;">
                <select class="form-select" aria-label="Default select example">
                    <option  disabled selected hidden selected>Kiểu HLV</option>
                    <option value="1">Cá nhân</option>
                    <option value="2">Nhóm</option>
                </select>
            </div>

            <div style="float: right;">
                <a href="" class="edit mx-2" data-toggle="tooltip"><button type="button" class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg></button></a>
            </div>
            <div style="float:right; ">

                <input type="text" min="1" max="365" placeholder="Enter to search" class="form-control" id="searchValue"/>
            </div>
        </div>
        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
            <table class="table my-0" id="dataTable0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Ảnh</th>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>SDT</th>
                        <th>Kiểu HLV</th>
                        <th>Thời gian dạy</th>
                        <th>Kinh nghiệm</th>
                        <th>Giá</th>
                    </tr>
                </thead>
                <tbody>
                <tr>

                    <td>1</td>
                    <td><img src="aa" ></td>
                    <td>Nguễn Văn A</td>
                    <td>avannguyen@gmail</td>
                    <th>0123456789</th>
                    <td>Cá nhân</td>
                    <td>1 ngày</td>
                    <th>5 năm</th>
                    <td>100000</td>
                    <td>
                        <button type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#updateModel">Update</button>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa fa-trash" title="Xóa HLV"></i></button>
                    </td>

                </tr>
            </tbody>

        </table>
    </div>
    <div class="row">
        <div class="col-md-6 align-self-center">
            <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>
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
            <div style="padding-bottom: 30px;">
                <button type="button" class="btn btn-primary d-flex justify-content-center"  data-bs-toggle="modal" data-bs-target="#addModal">
                    Thêm mới
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-5">
                <div class="container">
                    <p class="text-dark h2 text-center">Thêm một HLV mới</p>
                    <div class="py-5">
                        <div class="container">
                            <form class="" action = "">
                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="priceAdd">Giá:</label>
                                    <div class="col-sm-6">
                                        <input type="number" min="0" placeholder="Nhập giá thuê HLV" class="form-control" id="priceAdd" name=""/>
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
<div class="modal fade bd-example-modal-lg" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="py-5">
                <div class="container">
                    <p class="text-dark h2 text-center">Cập nhập thông tin HLV</p>
                    <div class="py-5">
                        <div class="container">
                            <form class="" action="">
                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="nameUp">Tên:</label>
                                    <div class="col-sm-6">
                                        <input type="text" value="Nguyễn Văn A" placeholder="Nhập tên của HLV" class="form-control" id="nameUp" name="">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="timeUp">Thời gian:</label>
                                    <div class="col-sm-6">
                                        <input type="number" value="1 ngày" min="1" max="365" placeholder="Nhập thời gian dạy mỗi khóa học của HLV" class="form-control" id="timeUp" name="">
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="typeHLVUp">Kiểu HLV:</label>
                                    <div class="col-sm-6">
                                        <select name="typeofpt" id="typeHLVUp" class="form-select">
                                            <option value="indi">Cá nhân</option>
                                            <option value="address">Nhóm</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="emailUp">Email:</label>
                                    <div class="col-sm-6">
                                        <input type="number" min="1" max="365" placeholder="Nhập Email của HLV" class="form-control" id="emailUp" name="">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="sdtUp">SDT:</label>
                                    <div class="col-sm-6">
                                        <input type="number" placeholder="Nhập SDT của HLV" value="0123456789" class="form-control" id="sdtUp" name="">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="expUp">Kinh nghiệm:</label>
                                    <div class="col-sm-6">
                                        <input type="number" value="10" min="0" max="15" placeholder="Nhập kinh nghiệm của HLV(tính bằng năm)" class="form-control" id="expUp" name="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row d-flex justify-content-center">
                                    <label class="form-label col-sm-2" for="priceUp">Giá:</label>
                                    <div class="col-sm-6">
                                        <input type="number" min="0" placeholder="Nhập giá thuê HLV" class="form-control" id="priceUp" name="">
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
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-trash"></i></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Xác nhận xóa HLV khỏi danh sách ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <a href=""><button type="button" class="btn btn-primary">Yes</button></a>
            </div>
        </div>
    </div>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
