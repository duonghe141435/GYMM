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
</head>
<body>
<div class="container-fluid">
    <div class="card shadow">
        <div class="card-header py-3">
            <p class="text-dark h2 text-center">List ticket trainer table</p>
        </div>
        <div class="card-body shadow">

            <div style="float:left; margin-left: 20px;">
                <div class="col-md-6 text-nowrap">
                    <label class="form-label"/>Sort by:
                    <button type="button" class="btn btn-light">Vote⭐️</button>
                </div>
            </div>
            <div style="float:left; margin-left: 20px;">
                <select class="form-select" aria-label="Default select example">
                    <option  disabled selected hidden selected>Price</option>
                    <option value="1">Short to hight</option>
                    <option value="2">Hight to short</option>
                </select>
            </div>
            <div style="float:left; margin-left: 20px;">
                <select class="form-select" aria-label="Default select example">
                    <option  disabled selected hidden selected>Status</option>
                    <option value="1">Accept</option>
                    <option value="2">Not Accept</option>
                    <option value="2">Ban</option>
                </select>
            </div>
            <div style="float: right;">
                <a href="" class="edit mx-2" data-toggle="tooltip"><button type="button" class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg></button></a>
            </div>
            <div style="float:right; ">

                <input type="text" min="1" max="365" placeholder="Enter to search" class="form-control" id="searchValue">
            </div>

        </div>
        <div class="table-responsive table mt-2" id="dataTable1" role="grid" aria-describedby="dataTable_info">
            <table class="table my-0" id="dataTable">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Time</th>
                    <th>Price</th>
                    <th>Start date</th>
                    <th>Type</th>
                    <th>Vote</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tk" items="${listTicket}">
                    <tr>
                        <td>1</td>
                        <td>Nguyen Van A</td>
                        <td>1 day</td>
                        <td>1$</td>
                        <td>01/03/2023</td>
                        <th>Group</th>
                        <th>5⭐️</th>
                        <td>Accept</td>
                        <td>
                            <button type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#updateModel">Update</button>
                            <button type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#viewModel"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                            </svg></button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa fa-trash"></i></button>
                        </td>

                    </tr>
                </c:forEach>
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
                    <button type="button" class="btn btn-primary d-flex justify-content-center"  data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Add new
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" style="height: 100%;" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div style="max-width: 800px; ">
        <div class="modal-dialog">
            <div style="width: 900px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="py-5">
                        <div class="container">
                            <p class="text-dark h2 text-center">Add new ticket trainer</p>
                            <div class="py-5">
                                <div class="container">
                                    <form class="" action="">
                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="trainerNameModal">Trainer name:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" placeholder="Enter name" class="form-control" id="trainerNameModal" name="">
                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="priceModal">Price:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" min="0" placeholder="Enter price" class="form-control" id="priceModal" name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="timeModal">Time:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" min="1" max="365" placeholder="Enter total of day training" class="form-control" id="timeModal" name="">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="trainerType">Trainer type:</label>
                                                <div class="col-sm-6">
                                                    <select name="typeofpt" id="trainerType" class="form-select form-select-lg mb-3 dropdown-toggle">
                                                        <option value="indi">Individual</option>
                                                        <option value="address">Group</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="typeofstart">Start date:</label>
                                                <div class="col-sm-6">
                                                    <input type="date" class="form-control" id="typeofstart" name="">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <button style="width: 200px;" type="submit" class="btn btn-primary btn-block mt-5">Create</button>
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
    </div>
</div>
<div class="modal fade" style="height: 100%;" id="updateModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div style="max-width: 800px; ">
        <div class="modal-dialog">
            <div style="width: 900px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="py-5">
                        <div class="container">
                            <p class="text-dark h2 text-center">Update ticket trainer</p>
                            <div class="py-5">
                                <div class="container">
                                    <form class="" action="">
                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="trainerName">Trainer name:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" placeholder="Enter name" class="form-control" id="trainerName" name="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="price">Price:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" min="0" placeholder="Enter price" class="form-control" id="price" name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="timeModel">Time:</label>
                                                <div class="col-sm-6">
                                                    <input type="number" min="1" max="365" placeholder="Enter total of day training" class="form-control" id="timeModel" name="">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="trainerTypeModel">Trainer type:</label>
                                                <div class="col-sm-6">
                                                    <select name="ptModel" id="trainerTypeModel" class="form-select form-select-lg mb-3 dropdown-toggle">
                                                        <option value="">Individual</option>
                                                        <option value="">Group</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="timeModel2">Start date:</label>
                                                <div class="col-sm-6">
                                                    <input type="date" class="form-control" id="timeModel2" name="">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <button style="width: 200px;" type="submit" class="btn btn-primary btn-block mt-5">Update</button>
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
    </div>
</div>
<div class="modal fade" style="height: 100%;" id="viewModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div style="max-width: 800px; ">
        <div class="modal-dialog">
            <div style="width: 900px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="py-5">
                        <div class="container">
                            <p class="text-dark h2 text-center">Trainer Informatin</p>
                            <div class="py-5">
                                <div class="container">
                                    <form class="" action="">
                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="typeoftrainer">Trainer name:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="typeoftrainer" value="Nguyen Van A" readonly name="">
                                                </div>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="priceModel2">Price:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control" id="priceModel2" value="1$" readonly name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="timeModel3">Time:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" readonly value="1 day" class="form-control" id="timeModel3" name="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="typeoftime">Trainer type:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" readonly value="Group" class="form-control" id="typeoftime" name="">
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <div class="row d-flex justify-content-center">
                                                <label class="form-label col-sm-2" for="timeModel4">Start date:</label>
                                                <div class="col-sm-6">
                                                    <input type="text" readonly value="01/03/2023" class="form-control" id="timeModel4" name="">
                                                </div>
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
                Are you sure delete this ticket trainer!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <a href=""><button type="button" class="btn btn-primary">Yes</button></a>
            </div>
        </div>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
