<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 3/31/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
    <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
        <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
        <div class="sidebar-brand-text mx-3"><span>Brand</span></div>
    </a>
        <hr class="sidebar-divider my-0">
        <ul class="navbar-nav text-light" id="accordionSidebar">
            <li class="nav-item"><a class="nav-link" href="index.html"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a>
            </li>
            <li class="nav-item"><a class="nav-link active" href="/admin/dashboard/users">
                <i class="fas fa-table"></i><span>Users</span></a>
                <ul>
                    <li>Quản lý nhân viên</li>
                    <li>Quản lý PT</li>
                </ul>
            </li>
            <li class="nav-item"><a class="nav-link active" href="/admin/dashboard/tickets">
                <i class="fas fa-table"></i><span>Tickets</span></a>
                <ul>
                    <li>Quản lý vé vào cửa</li>
                    <li>Quản lý PT cá nhân</li>
                    <li>Quản lý lớp học</li>
                </ul>
            </li>
            <li class="nav-item"><a class="nav-link active" href="/admin/dashboard/products">
                <i class="fas fa-table"></i><span>Product</span></a>
                <ul>
                    <li>Quản lý sản phẩm</li>
                </ul>
            </li>
        </ul>
        <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
    </div>
</nav>