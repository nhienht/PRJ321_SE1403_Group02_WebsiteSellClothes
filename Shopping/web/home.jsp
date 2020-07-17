<%-- 
    Document   : home
    Created on : Jul 14, 2020, 12:35:43 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Admin"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
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

        <title>Clothing </title>
        <style>
            @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
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
        <%
            boolean isLogin;
            // Admin ad = (Admin) session.getAttribute("checkLogin");
//            if (ad != null) {
//                isLogin = true;
//
//            } else {
//                isLogin = false;
//
//            }

        %>
    </head>

    <body>
        <jsp:include page="header/header.jsp" ></jsp:include>


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

                        <c:if test = "${!isLogin}"> 
                        <li class="nav-item">

                            <a href="./auth/signin.jsp" title="Login" class="nav-link" >
                                Sign In
                            </a>
                        </li>
                    </c:if>
                    <c:if test = "${isLogin}"> 
                        <li class="nav-item">
                            <a href="./auth/login.jsp?logout=1" title="Login" class="nav-link">
                                Logout
                            </a>
                        </li>
                    </c:if>
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
                    <img src="./images/Capture.PNG" class="d-block w-100" alt="..." >
                </div>
                <div class="carousel-item">
                    <img src="./images/pic3.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./images/pic22.jpg" class="d-block w-100" alt="...">
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
                © 2020 1997 Clothing ®
            </div>
        </div>
    </body>

</html>
