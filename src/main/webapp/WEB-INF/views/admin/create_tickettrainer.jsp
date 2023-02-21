<%--
  Created by IntelliJ IDEA.
  User: Duong
  Date: 21-02-2023
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Create New Trainer Ticket</title>
    <!-- <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="assets/bootstrap/css/createTiketStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="py-5 crtTicket">
    <div class="container">
        <p class="text-dark h2 text-center">Add new trainer ticket</p>
        <form class="action="">
        <div class="form-group">
            <div class="row d-flex justify-content-center">
                <label class="form-label col-sm-2" for="typeoftrainer">Trainer name:</label>
                <div class="col-sm-6">
                    <input type="text" placeholder="Enter name" class="form-control" id="typeoftrainer" name="">
                </div>
            </div>
        </div>



        <div class="form-group">
            <div class="row d-flex justify-content-center">
                <label class="form-label col-sm-2" for="typeofprice">Price:</label>
                <div class="col-sm-6">
                    <input type="number" placeholder="Enter price" class="form-control" id="typeofprice" name="">
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row d-flex justify-content-center">
                <label class="form-label col-sm-2" for="typeoftime">Time:</label>
                <div class="col-sm-6">
                    <input type="number" placeholder="Enter total of day training" class="form-control" id="typeoftime" name="">
                </div>
            </div>
        </div>


        <div class="form-group">
            <div class="row d-flex justify-content-center">
                <label class="form-label col-sm-2" for="typeofpt">Trainer type:</label>
                <div class="col-sm-6">
                    <select name="typeofpt" id="typeofpt" style="width: 550px;" class="form-select form-select-lg mb-3 dropdown-toggle">
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

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
