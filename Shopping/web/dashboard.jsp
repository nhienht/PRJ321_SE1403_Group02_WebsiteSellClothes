<%-- 
    Document   : updateBill
    Created on : Jul 9, 2020, 5:12:09 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Bill"%>
<%@page import="model.DAO.BillDAO"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <meta charset="UTF-8">
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Bill</title>

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
                color: #212529;
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
                    background-color: #343a40 !important;
                }
                .input-group{
                    padding-bottom:  30px;
                }


            </style>
        </head>
        <body>

        <body id="page-top" class="">

            <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
                <a class="navbar-brand mr-1 fas" href="../admin/dashboard.jsp">
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
                            <a class="dropdown-item" href="./AdminLogoutController">Logout</a>
                        </div>
                    </li>
                </ul>

            </nav>

            <div id="wrapper">


                <!-- Sidebar -->
                <ul class="sidebar navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="dashboard.jsp">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li class="nav-item ">
                        <a class="nav-link" href="admin/bill/listbill.jsp">
                            <i class="fas fa-fw fa-user"></i>
                            <span> Bill</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="admin/customer/listcustomer.jsp">
                            <i class="fas fa-fw fa-book"></i>
                            <span>List Customer</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="admin/product/listproducts.jsp" id="pagesDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-fw fa-box-open"></i>
                            <span>Product</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                            <a class="dropdown-item" href="admin/product/listproducts.jsp">List Products</a>
                            <a class="dropdown-item" href="admin/product/insertProduct.jsp">Insert Products</a>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin/comment/listcomment.jsp">
                            <i class="fas fa-fw fa-book"></i>
                            <span>List Comment</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin/supplier/supplierlist.jsp">
                            <i class="fas fa-fw fa-book"></i>
                            <span>Supplier</span></a>
                    </li>



                </ul>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="dashboard.jsp">Dashboard</a>
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
                    
                                    
                                    <h1 style="text-align: center"> 1997 Clothing </h1>


                                    <div class="textabouts">
                                        <div class="container-fluid padding">
                                            <div class="row text-ceter padding">
                                                <div class="col-xs-12">
                                                    <p class="text-abouts" style="font-weight: 600;">
                                                        Taken over by a solid, vintage palette, the T-shirts are adorned with planet and rocket graphics
                                                        as
                                                        well as retro fonts. Zodiac signs are stitched all over the shirts, which can then be found on
                                                        the
                                                        inner lining of the hooded coats. </p>
                                                    <br> </br>

                                                    <p style="font-weight: 600;">The label has an unorthodox approach towards the design of the
                                                        retro-futuristic patterns
                                                        throughout
                                                        the clothing collection. </p>
                                                    <br> </br>
                                                    <p style="font-weight: 600;"> The traditional checkered pattern, the skewed fabric of the chest
                                                        pockets disrupts the orderly,
                                                        modernized tartan motif of the long-sleeved shirt, while orange tilted rectangles of various
                                                        sizes
                                                        aligned throughout the button-down, short-sleeved shirt create an illusory effect.Baseball
                                                        jackets also contribute to the space-travel theme, featuring a symmetrical, off white
                                                        explosion graphic which contrasts with the calm, turquoise base color.
                                                    <p>
                                                        <br>
                                                        </br>
                                                    <p style="font-weight: 600;">
                                                        Matching with the heavily-printed tops, rolled-up, stone-washed jeans round off the
                                                        ?50s-inspired
                                                        look.

                                                        Have a flick through the lookbook and together see the our great products bring to you.
                                                    </p>

                                                    <div class="col-xs-12 boder bg-light">
                                                        <span class="image1">
                                                            <img class="image" src="../images/about2.jpg" alt="" style="width:100%">
                                                        </span>
                                                    </div>
                                                    <br></br>
                                                    <div class="col-xs-12 boder bg-light">
                                                        <span class="image1">
                                                            <img class="image" src="../images/about4.jpg" alt="" style="width:100% " style="padding: 50px">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="fotter">
                                        <div class="footer-copyright text-center py-3">
                                            © 2020 1997 Clothing ®
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

</body>
</html>