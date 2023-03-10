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
            <p class="text-dark h2 text-center">List ticket table</p>
        </div>
        <div class="card-body shadow">
            <div style="float:left">
                <div class="col-md-6 text-nowrap">
                    <label class="form-label"/>Sort by:
                        <button type="button" class="btn btn-light">Hot🔥</button>
                </div>
            </div>
            <div style="float:left; margin-left: 20px;">
                <div class="col-md-6 text-nowrap">
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
            <div style="float: right;">
                <a href="" class="edit mx-2" data-toggle="tooltip"><button type="button" class="btn btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg></button></a>
            </div>
            <div style="float:right; ">

                <input type="text" min="1" max="365" placeholder="Enter to search" class="form-control" id="searchValue">
            </div>
            <div class="card-body">
                <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                    <table class="table my-0" id="dataTable1">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Contents</th>
                            <th>Time</th>
                            <th>Price</th>
                            <th>Start date</th>
                            <th>Stop date</th>
                            <th>Create date</th>
                            <th>Create by</th>
                            <th>Vote</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tk" items="${listTicket}">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">Update</button>
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
                        <button type="button" class="btn btn-primary d-flex justify-content-center"  data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Add new
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="max-width: 950px;">
            <div class="modal-dialog">
                <div style="width: 750px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="py-5">
                            <div class="container">
                                <p class="text-dark h2 text-center">Add new ticket</p>
                                <form class="action=">
                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="ticketName">Ticket name:</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="ticketName" name="">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="ticketPrice">Price:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="0" class="form-control" id="ticketPrice" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="Time">Time:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="1" max="365" placeholder="Total day" class="form-control" id="Time" name="">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="startDate">Start date:</label>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" id="startDate" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="stopDate">Stop date:</label>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" id="stopDate" name="">
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
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="max-width: 950px;">
            <div class="modal-dialog">
                <div style="width: 750px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="py-5">
                            <div class="container">
                                <p class="text-dark h2 text-center">Update ticket</p>
                                <form class="action=">
                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="typeofticket">Ticket name:</label>
                                            <div class="col-sm-6">
                                                <input type="text" value="Day" class="form-control" id="typeofticket" name="">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="typeofprice">Price:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="0" class="form-control" id="typeofprice" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="timeModel">Time:</label>
                                            <div class="col-sm-6">
                                                <input type="number" min="1" max="365" placeholder="Tổng số ngày" class="form-control" id="timeModel" name="">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="startModel">Start date:</label>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" id="startModel" name="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row d-flex justify-content-center">
                                            <label class="form-label col-sm-2" for="stopModel">Stop date:</label>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" id="stopModel" name="">
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
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-trash"></i></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure delete this ticket!
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