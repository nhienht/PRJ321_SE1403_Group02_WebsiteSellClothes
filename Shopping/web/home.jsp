<%-- 
    Document   : home
    Created on : Jul 14, 2020, 12:35:43 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Customer"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="model.entity.Admin"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

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

        <title>Clothing </title>
        <style>
            @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
            .dropdown
            {
                float:  right;
                padding-left: 20px;
            }
            html ,body {
                width: 100%;
                height: 100%;
                font-family: 'Balsamiq Sans';   
                font-size: 17px;
                color: #222;
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
        </style>
    </head>
    <body>
        <%@include  file="header/header.jsp" %>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

            <a class="navbar-branch" href="index.jsp">
                <img src="./images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                    <li class="nav-item">
                        <a href="./index.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="./customer/product/list.jsp" class="nav-link ">Products</a>

                    </li>
                    <li class="nav-item">
                        <a href="./auth/about.jsp" class="nav-link">About us</a>
                    </li>
                    <li class="nav-item">
                        <a href="./auth/contact.jsp" class="nav-link">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a href="customer/product/cart.jsp" class="nav-link">Cart</a>
                    </li>


                    <li class="nav-item dropdown no-arrow  ">
                        <a style="color: black;position:relative; top: -20px;" class="nav-link dropdown-toggle " href="#" id="userDropdown" role="button" data-toggle="dropdown"
                           >
                            <h3><i style="color: black;position:relative; top: -1px;" class="fas fa-user-circle fa-fw"></i></h3>
                        </a>
                        <div class="dropdown-menu dropdown-menu- bg-dark text-white "  >
                            <!--<a class="dropdown-item" href="#">Logout</a>-->

                            <%
                                Cookie[] cookies = request.getCookies();
                                if (cookies.length > 1) {
                                    for (Cookie cookie : cookies) {
                                        if (cookie.getName().equals("user")) {
                                            out.print("<a class='nav-link dropdown-item bg-dark' style='color: white; font-size:20px;' href='customer/Information.jsp'>" + cookie.getValue() + "</a>");
                                            out.print("<a class='nav-link dropdown-item bg-dark' style='color: white; font-size:20px;' href='LogoutController'>Logout</a>");
                                        } else if (cookie.getName().equals("admin")) {
                                            RequestDispatcher disp = request.getRequestDispatcher("dashboard.jsp");
                                            disp.forward(request, response);
                                        }
                                    }
                                } else {
                                    out.print("<a class='nav-link' style='color: black' href='auth/login.jsp'>Login</a>");
                                    out.print("<a class='nav-link' style='color: black' href='auth/signin.jsp'>Sigin</a>");
                                }
                            %>
                        </div>
                    </li>

                </ul>
            </div>
        </nav>

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./images/bia2.jpg" class="d-block w-100" alt="..." >
                </div>
                <div class="carousel-item">
                    <img src="./images/bia3.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./images/bia01.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container-fluid padding">
            <div class="row text-center padding">
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/product1.jpg" alt="" style="height:300px;" class="image">
                    <div class="overlay">
                        Pink Long Sleeve
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/product2.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Saffron-Colored Vest
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/product3.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Blue-Jacket Gucci
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/product4.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Red-Long Vest Gucci
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/pro1.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Wool jersey jumpsuit
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/pro2.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Silk organdy jacket
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/pro3.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Blue - Cotton jacket
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                    <img src="./images/pro4.jpg" alt="" style="height: 300px;" class="image">
                    <div class="overlay">
                        Cotton viscose faille jacket
                    </div>
                </div>

            </div>

        </div>
        <div class="fotter">
            <div class="footer-copyright text-center py-3">
                © 2020 !997 Clothing ®
            </div>
        </div>
    </body>

</html>
