<%-- 
    Document   : listproducts
    Created on : Jul 5, 2020, 9:50:45 AM
    Author     : 
--%>

<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
            html ,body {
                width: 100%;
                height: 100%;
                font-family: 'Balsamiq Sans';   
                font-size: 17px;
                color: #222;
                background: url('./../../images/vin.jpg') fixed;
            }
            .navbar{
                background-color: #F5A9BC !important;
            }
            .navbar li a {
                color: #f8f2f2!important ;

            }
            .navbar li a:hover {
                color: #000000 !important ;

            }
            .container-fluid
            {
                padding-top: 8em;
            }


            .overlay {
                position: absolute; 
                bottom: 0; 
                background: rgb(0, 0, 0);
                background: rgba(0, 0, 0, 0.5); /* Black see-through */
                color: #f1f1f1; 
                width: 100%;
                transition: .5s ease;
                opacity:0;
                color: white;
                font-size: 20px;
                padding: 20px;
                text-align: center;
            }
            .container-fluid:hover .overlay {
                opacity: 1;
            }
            .nav-item{
                padding-right: 20px;
                font-size: 25px;
            }
            .fotter{
                background-color: black;
                color: white;
            }
            table{
                font-family: 'Pangolin', cursive;
                width: 100%;
                text-align: center;
                background-color: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }
            th{
                border-style: solid;
            }

            .table{
                padding : 20px;
                padding-top: 100px;

            }
            .insert{
                padding: 10px;
                background: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }
            .container{
                align-items: center;
                justify-content: center;
                width: 100%;
                padding-left: 550px;
                padding-top: 30px;
            }



        </style>
    </head>
    <body>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

            <a class="navbar-branch" href="index.jsp">
                <img src="./../../images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                    <li class="nav-item">
                        <a href="./../../home.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="./../bill/listbill.jsp" class="nav-link ">Bill</a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            if (request.getParameter("id") != null) {
                int pId = Integer.parseInt(request.getParameter("id"));
                ProductsDAO pDao = new ProductsDAO();
                int kq = pDao.delete(pId);
                if (kq > 0) {
                    out.println("<script> alert('Xoa thanh cong');</script>");
                } else {
                    out.println("<script>alert('Xoa that bai');</script>");
                }
                out.println("<script>location.href='listproducts.jsp';</script>");
            }
        %>

    <body id="page-top" class="">

        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1 fas" href="#">
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
                        <a class="dropdown-item" href="#">Logout</a>
                    </div>
                </li>
            </ul>

        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="nav-item ">
                    <a class="nav-link" href="../customer/listcustomer.jsp">
                        <i class="fas fa-fw fa-user"></i>
                        <span>Account</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="../customer/listcustomer.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>List Customer</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="../product/listproducts.jsp" id="pagesDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-box-open"></i>
                        <span>Product</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <a class="dropdown-item" href="../product/listproducts.jsp">List Products</a>
                        <a class="dropdown-item" href="../product/updateProduct.jsp">Update Products</a>
                        <a class="dropdown-item" href="typesProduct.jsp">List Types Product</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="suppliers.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Suppliers</span></a>
                </li>

                <li class="nav-item ">
                    <a class="nav-link" href="feedback.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Feedbacks</span></a>
                </li>


            </ul>

            <div id="content-wrapper">

                <div class="container-fluid">

                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Orders</li>

                    </ol>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-user"></i>
                            List Orders</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="dataTables_length" id="dataTable_length"><label>Show <select
                                                        name="dataTable_length" aria-controls="dataTable"
                                                        class="custom-select custom-select-sm form-control form-control-sm">
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select> entries</label></div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div id="dataTable_filter" class="dataTables_filter"><label>Search:<input
                                                        type="search" class="form-control form-control-sm" placeholder=""
                                                        aria-controls="dataTable"></label></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table class="table table-bordered dataTable" id="dataTable" width="100%"
                                                   cellspacing="0" role="grid" aria-describedby="dataTable_info"
                                                   style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th>ID Products</th>
                                                        <th>Status Product</th>
                                                        <th>Brand Products</th>
                                                        <th>Type Products</th>
                                                        <th>Supplier </th>
                                                        <th>Product's name</th>
                                                        <th>Saleprice</th>
                                                        <th>Price</th>
                                                        <th>Describle</th>
                                                        <th>Date</th>
                                                        <th>Size </th>
                                                        <th>Material</th>
                                                        <th>Update</th>
                                                        <th>Clothing</th>
                                                        <th>Image</th>
                                                        <th>Gender</th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <%
                                                        ProductsDAO pDao = new ProductsDAO();
                                                        ResultSet rs = pDao.getAll();
                                                        while (rs.next()) {
                                                           

                                                            out.print("<tr>");
                                                            out.print("<td>" + rs.getInt("pID") + "</td>");
                                                            out.print("<td>" + rs.getInt("status") + "</td>");
                                                            out.print("<td>" + rs.getInt("brID") + "</td>");
                                                            out.print("<td>" + rs.getInt("tID") + "</td>");
                                                            out.print("<td>" + rs.getInt("supID") + "</td>");
                                                            out.print("<td>" + rs.getString("pName") + "</td>");
                                                            out.print("<td>" + rs.getInt("sellingPrice") + "</td>");
                                                            out.print("<td>" + rs.getInt("price") + "</td>");
                                                            out.print("<td>" + rs.getString("describle") + "</td>");
                                                            out.print("<td>" + rs.getDate("pDate") + "</td>");
                                                            out.print("<td>" + rs.getInt("size") + "</td>");
                                                            out.print("<td>" + rs.getString("material") + "</td>");
                                                            out.print("<td>" + rs.getString("gender") + "</td>");
                                                            ImageDAO iDao = new ImageDAO();
                                                            ResultSet rsImg = iDao.getImage(rs.getInt("pID"));
                                                            while (rsImg.next()) {
                                                                out.print("<td><img src='../../data/" + rsImg.getString(3) + "' height='100px' width='100px' /></td>");
                                                                break;
                                                            }

                                                            out.print("<td><a href='updateProduct.jsp?id=" + rs.getInt("pID") + "'>Update</a></td>");
                                                            out.print("<td><a href='?id=" + rs.getInt("pID") + "'>Delete</a></td>");

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

