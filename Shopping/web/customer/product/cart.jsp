<%-- 
    Document   : cart
    Created on : Jul 6, 2020, 2:21:16 PM
    Author     : NhienHT
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Clothes Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link rel="stylesheet" href="Style/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="Style/css/animate.css">
        <link rel="stylesheet" href="Style/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Style/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="Style/css/magnific-popup.css">
        <link rel="stylesheet" href="Style/css/aos.css">
        <link rel="stylesheet" href="Style/css/ionicons.min.css">
        <link rel="stylesheet" href="Style/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="Style/css/jquery.timepicker.css">
        <link rel="stylesheet" href="Style/css/flaticon.css">
        <link rel="stylesheet" href="Style/css/icomoon.css">
        <link rel="stylesheet" href="Style/css/style.css">
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
            .title{
                font-size: 25px;
                text-align: center;
            }
            .price{
                font-size: 20px;
                text-align: center;
                color: #000;
                font: bold;

            }
        </style>
    </head>
    <body class="goto-here">
        <jsp:include page="../../header/header.jsp" ></jsp:include>

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
                            <a href="LogoutController"  title="Login" class="nav-link">
                                Logout
                            </a>                       
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>

        <div class="hero-wrap hero-bread" style="background-image: url('Style/images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="./../../home.jsp">Home</a></span> <span>Cart</span></p>
                        <h1 class="mb-0 bread">My Wishlist</h1>	
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div>
                            <p class="title">LIST CART<p>
                            <table class="table">

                                <%
                                    HashMap<Integer, Integer> listCart = (HashMap<Integer, Integer>) session.getAttribute("listCart");
                                    String rm = request.getParameter("rm");
                                    double total = 0.0;
                                    if (rm != null) {
                                        listCart.remove(Integer.parseInt(rm));
                                    }
                                    if (listCart != null) {
                                        out.print(" <thead class='thead-primary'>"
                                                + " <tr class='text-center'>"
                                                + "<th>No.</th>"
                                                + " <th>Product</th>"
                                                + " <th>Price</th>"
                                                + " <th>Discount</th>"
                                                + " <th>Quantity</th>"
                                                + "<th></th>"
                                                + "</tr>"
                                                + "   </thead>"
                                        );
                                        ProductsDAO pDao = new ProductsDAO();
                                        int stt = 0;
                                        for (Integer i : listCart.keySet()) {
                                            int quantity = listCart.get(i);
                                            Products p = pDao.getProduct(i);
                                            out.print("<tr>");
                                            out.print("<td>" + ++stt + "</td>");
                                            out.print("<td><a href='productDetail.jsp?pID=" + i + "'>" + p.getpName() + "</a></td>");
                                            out.print("<td>" + p.getPrice() + "</td>");
                                            out.print("<td>" + p.getDiscount() + "</td>");
                                            out.print("<td>" + quantity + "</td>");
                                            total += (double)(p.getPrice() - p.getDiscount()*p.getPrice());
                                            out.print("<td><a href='?rm=" + i + "'>Remove</a></td>");
                                            out.print("</tr>");

                                        }
                                    } else {
                                        out.print("<h2>You have no items in your shopping cart !</h2>");
                                    }
                                %>

                            </table>
                        </div>
                    </div>
                </div>



                <div class="row justify-content-start">
                    <div class="col-6 col-sm-4 mt-5 col-lg-4"> 
                        <p class="text-center"><a href="list.jsp" class="btn btn-primary py-3 px-4">Buy Continue</a></p>
                    </div>
                    <div class="col-6 col-sm-4 mt-5 cart-wrap ftco-animate col-lg-4 ">
                        <span>
                            <p class="title">CART TOTAL</p>
                            <p class="price"><%= total%></p>
                        </span>
                    </div>
                    <div class="col-6 col-sm-4 mt-5 col-lg-4">
                        <p class="text-center"><a href="order.jsp?total=<%= total%>" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <script src="Style/js/jquery.min.js"></script>
    <script src="Style/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="Style/js/popper.min.js"></script>
    <script src="Style/js/bootstrap.min.js"></script>
    <script src="Style/js/jquery.easing.1.3.js"></script>
    <script src="Style/js/jquery.waypoints.min.js"></script>
    <script src="Style/js/jquery.stellar.min.js"></script>
    <script src="Style/js/owl.carousel.min.js"></script>
    <script src="Style/js/jquery.magnific-popup.min.js"></script>
    <script src="Style/js/aos.js"></script>
    <script src="Style/js/jquery.animateNumber.min.js"></script>
    <script src="Style/js/bootstrap-datepicker.js"></script>
    <script src="Style/js/scrollax.min.js"></script>
    <script src="Style/js/google-map.js"></script>
    <script src="Style/js/main.js"></script>
</body>
</html>
