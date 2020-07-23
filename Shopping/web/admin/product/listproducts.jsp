<%-- 
    Document   : listproducts
    Created on : Jul 5, 2020, 9:50:45 AM
    Author     : 
--%>

<%@page import="model.DAO.SupplierDAO"%>
<%@page import="model.DAO.BrandDao"%>
<%@page import="model.DAO.TypeDAO"%>
<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
        <title>List Products </title>
        <style>
            html {
                position: relative;
                min-height: 100%;
            }

            body {
                height: 100%;
            }

            #wrapper {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
            }

            #wrapper #content-wrapper {
                overflow-x: hidden;
                width: 100%;
                padding-top: 1rem;
                padding-bottom: 80px;

            }

            body.fixed-nav #content-wrapper {
                margin-top: 56px;
                padding-left: 90px;
            }

            body.fixed-nav.sidebar-toggled #content-wrapper {
                padding-left: 0;
            }

            @media (min-width: 768px) {
                body.fixed-nav #content-wrapper {
                    padding-left: 225px;
                }

                body.fixed-nav.sidebar-toggled #content-wrapper {
                    padding-left: 90px;
                }
            }

            .scroll-to-top {
                position: fixed;
                right: 15px;
                bottom: 15px;
                display: none;
                width: 50px;
                height: 50px;
                text-align: center;
                color: #fff;
                background: #F5A9BC;
                line-height: 46px;
            }

            .scroll-to-top:focus,
            .scroll-to-top:hover {
                color: white;
            }

            .scroll-to-top:hover {
                background: #F5A9BC;
            }

            .scroll-to-top i {
                font-weight: 800;
            }

            .smaller {
                font-size: 0.7rem;
            }

            .o-hidden {
                overflow: hidden !important;
            }

            .z-0 {
                z-index: 0;
            }

            .z-1 {
                z-index: 1;
            }

            .navbar-nav .form-inline .input-group {
                width: 100%;
            }

            .navbar-nav .nav-item.active .nav-link {
                color: #fff;
            }

            .navbar-nav .nav-item.dropdown .dropdown-toggle::after {
                width: 1rem;
                text-align: center;
                float: right;
                vertical-align: 0;
                border: 0;
                font-weight: 900;
                content: '\f105';
                font-family: 'Font Awesome 5 Free';
            }

            .navbar-nav .nav-item.dropdown.show .dropdown-toggle::after {
                content: '\f107';
            }

            .navbar-nav .nav-item.dropdown.no-arrow .dropdown-toggle::after {
                display: none;
            }

            .navbar-nav .nav-item .nav-link:focus {
                outline: none;
            }

            .navbar-nav .nav-item .nav-link .badge {
                position: absolute;
                margin-left: 0.75rem;
                top: 0.3rem;
                font-weight: 400;
                font-size: 0.5rem;
            }

            @media (min-width: 768px) {
                .navbar-nav .form-inline .input-group {
                    width: auto;
                }
            }

            .sidebar {
                width: 90px !important;
                background-color: #F5A9BC;
                min-height: calc(100vh - 56px);
            }

            .sidebar .nav-item:last-child {
                margin-bottom: 1rem;
            }

            .sidebar .nav-item .nav-link {
                text-align: center;
                padding: 0.75rem 1rem;
                width: 90px;
            }

            .sidebar .nav-item .nav-link span {
                font-size: 0.65rem;
                display: block;
            }

            .sidebar .nav-item .dropdown-menu {
                position: absolute !important;
                -webkit-transform: none !important;
                transform: none !important;
                left: calc(90px + 0.5rem) !important;
                margin: 0;
            }

            .sidebar .nav-item .dropdown-menu.dropup {
                bottom: 0;
                top: auto !important;
            }

            .sidebar .nav-item.dropdown .dropdown-toggle::after {
                display: none;
            }

            .sidebar .nav-item .nav-link {
                color:#212529;
            }

            .sidebar .nav-item .nav-link:active,
            .sidebar .nav-item .nav-link:focus,
            .sidebar .nav-item .nav-link:hover {
                color: #cccccc;
            }

            .sidebar.toggled {
                width: 0 !important;
                overflow: hidden;
            }

            @media (min-width: 768px) {
                .sidebar {
                    width: 225px !important;
                }

                .sidebar .nav-item .nav-link {
                    display: block;
                    width: 100%;
                    text-align: left;
                    padding: 1rem;
                    width: 225px;
                }

                .sidebar .nav-item .nav-link span {
                    font-size: 1rem;
                    display: inline;
                }

                .sidebar .nav-item .dropdown-menu {
                    position: static !important;
                    margin: 0 1rem;
                    top: 0;
                }

                .sidebar .nav-item.dropdown .dropdown-toggle::after {
                    display: block;
                }

                .sidebar.toggled {
                    overflow: visible;
                    width: 90px !important;
                }

                .sidebar.toggled .nav-item:last-child {
                    margin-bottom: 1rem;
                }

                .sidebar.toggled .nav-item .nav-link {
                    text-align: center;
                    padding: 0.75rem 1rem;
                    width: 90px;
                }

                .sidebar.toggled .nav-item .nav-link span {
                    font-size: 0.65rem;
                    display: block;
                }

                .sidebar.toggled .nav-item .dropdown-menu {
                    position: absolute !important;
                    -webkit-transform: none !important;
                    transform: none !important;
                    left: calc(90px + 0.5rem) !important;
                    margin: 0;
                }

                .sidebar.toggled .nav-item .dropdown-menu.dropup {
                    bottom: 0;
                    top: auto !important;
                }

                .sidebar.toggled .nav-item.dropdown .dropdown-toggle::after {
                    display: none;
                }
            }
            .searchbar{
                margin-bottom: auto;
                margin-top: auto;
                height: 60px;
                background-color: #F5A9BC;
                border-radius: 30px;
                padding: 10px;
            }

            .search_input{
                color: white;
                border: 0;
                outline: 0;
                background: none;
                width: 0;
                caret-color:transparent;
                line-height: 40px;
                transition: width 0.4s linear;
            }

            .searchbar:hover > .search_input{
                padding: 0 10px;
                width: 450px;
                caret-color:red;
                transition: width 0.4s linear;
            }

            .searchbar:hover > .search_icon{
                background: white;
                color: #e74c3c;
            }

            .search_icon{
                height: 40px;
                width: 40px;
                float: right;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                color:white;
                text-decoration:none;
            }

            .sidebar.fixed-top {
                top: 56px;
                height: calc(100vh - 56px);
                overflow-y: auto;
            }

            .card-body-icon {
                position: absolute;
                z-index: 0;
                top: -1.25rem;
                right: -1rem;
                opacity: 0.4;
                font-size: 5rem;
                -webkit-transform: rotate(15deg);
                transform: rotate(15deg);
            }

            @media (min-width: 576px) {
                .card-columns {
                    -webkit-column-count: 1;
                    column-count: 1;
                }
            }

            @media (min-width: 768px) {
                .card-columns {
                    -webkit-column-count: 2;
                    column-count: 2;
                }
                .bg-dark {
                    background-color: #343a40!important;
                }
                .zoom:hover{
                    transform: scale(3);
                }
            </style>
        </head>
        <body id="page-top" class="">
            <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
                <a class="navbar-brand mr-1 fas" href="../../home.jsp">
                    <h3>Clothing</h3>
                </a>

                <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Navbar Search -->
                <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

                </form>

                <!-- Navbar -->
                <ul class="navbar-nav ml-auto ml-md-0">
                    <li class="nav-item dropdown no-arrow mx-1"></li>
                    <li class="nav-item dropdown no-arrow mx-1"></li>

                    <!-- LOGOUT-->
                    <li class="nav-item dropdown no-arrow  ">
                        <a class="nav-link dropdown-toggle " href="#" id="userDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <h3><i class="fas fa-user-circle fa-fw"></i></h3>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="../../AdminLogoutController">Logout</a>
                        </div>
                    </li>
                </ul>

            </nav>

            <div id="wrapper">
                <ul class="sidebar navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../dashboard.jsp">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li class="nav-item ">
                        <a class="nav-link" href="../bill/listbill.jsp">
                            <i class="fas fa-fw fa-user"></i>
                            <span>Bill</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="../customer/listcustomer.jsp">
                            <i class="fas fa-fw fa-book"></i>
                            <span>List Customer</span></a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="../product/listproducts.jsp" id="pagesDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-fw fa-box-open"></i>
                            <span>Product</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                            <a class="dropdown-item" href="../product/listproducts.jsp">List Products</a>
                            <a class="dropdown-item" href="../product/insertProduct.jsp">Insert Products</a>
                        </div>
                    </li>
                </ul>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.jsp">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">Products</li>

                        </ol>

                        <!-- DataTables Example -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-user"></i>
                                List Products</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                        <div class="row">                                     
                                            <div class="col-sm-12 col-md-6">
                                                <div class="container h-100">
                                                    <div class="d-flex justify-content-center h-100">
                                                        <div class="searchbar">
                                                            <input class="search_input" type="text" name="" placeholder="Search...">
                                                            <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table class="table table-bordered dataTable" id="dataTable" width="100%"
                                                       cellspacing="0" role="grid" aria-describedby="dataTable_info"
                                                       style="width: 100%;">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 20px">ID</th>
                                                            <th style="width: 40px">Product's name</th>
                                                            <th>Image</th>
                                                            <th>Brand Products</th>
                                                            <th>Type Products</th>
                                                            <th>Supplier </th>
                                                            <th>Saleprice</th>
                                                            <th>Price</th>
                                                            <th>Describle</th>
                                                            <th>Date</th>
                                                            <th>Size </th>
                                                            <th>Material</th>
                                                            <th>Quantity</th>
                                                            <th>Discount</th>
                                                            <th>Gender</th>                                                         
                                                            <th>Status Product</th>
                                                            <th>Update</th>
                                                            <th>Change Status</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>

                                                        <%
                                                            ProductsDAO pDao = new ProductsDAO();
                                                            ResultSet rs = pDao.getAll();
                                                            while (rs.next()) {

                                                                out.print("<tr>");
                                                                out.print("<td>" + rs.getInt("pID") + "</td>");
                                                                out.print("<td>" + rs.getString("pName") + "</td>");
                                                                ImageDAO iDao = new ImageDAO();
                                                                ResultSet rsImg = iDao.getImage(rs.getInt("pID"));
                                                                out.print("<td>");
                                                                while(rsImg.next()){
                                                                      out.print("<img class='zoom' src='../../" + rsImg.getString("imageName") + "' height='100px' width='100px' />");
                                                                }
                                                              out.print("</td>");
                                                                BrandDao brDao = new BrandDao();
                                                                String brand = brDao.getBrand(rs.getInt("brID"));
                                                                out.print("<td>" + brand + "</td>");
                                                                TypeDAO tDao = new TypeDAO();
                                                                String type = tDao.getType(rs.getInt("tID"));
                                                                out.print("<td>" + type + "</td>");
                                                                SupplierDAO supDao = new SupplierDAO();
                                                                String sup = supDao.getSupplier(rs.getInt("supID"));
                                                                out.print("<td>" + sup + "</td>");
                                                                out.print("<td>" + rs.getInt("sellingPrice") + "</td>");
                                                                out.print("<td>" + rs.getInt("price") + "</td>");
                                                                out.print("<td>" + rs.getString("describle") + "</td>");
                                                                out.print("<td>" + rs.getDate("pDate") + "</td>");
                                                                int size = rs.getInt("size");
                                                                String s = "";
                                                                if (size == 0) {
                                                                    s = "S";
                                                                } else if (size == 1) {
                                                                    s = "M";
                                                                } else if (size == 2) {
                                                                    s = "L";
                                                                } else if (size == 3) {
                                                                    s = "XL";
                                                                } else {
                                                                    s = "XXL";
                                                                }
                                                                out.print("<td>" + s + "</td>");
                                                                out.print("<td>" + rs.getString("material") + "</td>");
                                                                out.print("<td>" + rs.getString("quantity") + "</td>");
                                                                out.print("<td>" + rs.getString("discount") + "</td>");
                                                                out.print("<td>" + rs.getString("gender") + "</td>");

                                                                if (rs.getInt("status") == 1) {
                                                                    out.println("<td style='color:green; font-weight: bold;' >Valid</td> ");
                                                                } else {
                                                                    out.println("<td style='color:red;font-weight: bold; '>Invalid</td> ");
                                                                }
                                                                out.print("<td><a href='updateProduct.jsp?id=" + rs.getInt("pID") + "'>Update</a></td>");
                                                                out.print("<td><a href='../../Change?pID=" + rs.getInt("pID") + "' + '>Change</a></td>");

                                                                out.print("</tr>");
                                                            }
                                                        %>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-5">
                                                <div class="dataTables_info" id="dataTable_info" role="status"
                                                     aria-live="polite">Showing 1 to 1 of 1 entries</div>
                                            </div>
                                            <div class="col-sm-12 col-md-7">
                                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                                    <ul class="pagination">
                                                        <li class="paginate_button page-item previous disabled"
                                                            id="dataTable_previous"><a href="#" aria-controls="dataTable"
                                                                                   data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                                        </li>
                                                        <li class="paginate_button page-item active"><a href="#"
                                                                                                        aria-controls="dataTable" data-dt-idx="1" tabindex="0"
                                                                                                        class="page-link">1</a></li>
                                                        <li class="paginate_button page-item next disabled" id="dataTable_next">
                                                            <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0"
                                                               class="page-link">Next</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>










        </body>


    </html>

