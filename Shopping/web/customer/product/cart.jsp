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
    </head>
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
    <body class="goto-here">
        <jsp:include page="../../header/header.jsp" ></jsp:include>
         <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

             <a class="navbar-branch" href="../../index.jsp">
                    <img src="./images/logo.jpg" height="80px" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                        <li class="nav-item">
                            <a href="../../home.jsp" class="nav-link ">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="../../customer/product/list.jsp" class="nav-link ">Products</a>

                        </li>
                        <li class="nav-item">
                            <a href="../../auth/about.jsp" class="nav-link">About us</a>
                        </li>
                        <li class="nav-item">
                            <a href="../../auth/contact.jsp" class="nav-link">Contact</a>
                        </li>

                        <c:if test = "${!isLogin}"> 
                        <li class="nav-item">

                            <a href="../../auth/signin.jsp" title="Login" class="nav-link" >
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
        <!-- END nav -->

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
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>No.</th>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>&nbsp;</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <%
                                    ProductsDAO pDao = new ProductsDAO();

                                    int total = 0;

                                    Enumeration<String> pName = session.getAttributeNames();

                                    while (pName.hasMoreElements()) {
                                        String id = pName.nextElement();
                                        if(id.equals("conn")){
                                            continue;
                                        }
                                        System.out.println(id);
                                        Products p = pDao.getProduct(Integer.parseInt(id));
                                        total += p.getPrice() * Integer.parseInt(session.getAttribute(id).toString());

                                        out.print("<tr>");
                                        out.print("<td>" + id + "</td>");
                                        out.print("<td class=`product-name`>" + p.getpName() + "</td>");
                                        out.print("<td >" + session.getAttribute(id) + "</td>");
                                        out.print("<td class=`price`>$" + p.getPrice() + "</td>");
                                        out.print("<td>&nbsp;</td>");
                                        out.print("<td>$" + p.getPrice() * Integer.parseInt(session.getAttribute(id).toString()) + "</td>");
                                        out.print("</tr>");
                                    }
                                    out.print("<tr>");
                                    out.print("<td>&nbsp;</td>");
                                    out.print("<td>&nbsp;</td>");
                                    out.print("<td>&nbsp;</td>");
                                    out.print("<td>Total</td>");
                                    out.print("<td>&nbsp;</td>");
                                    out.print("<td>$" + total + "</td>");
                                    out.print("</tr>");

                                    getServletContext().setAttribute("total", total);


                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-start">
                    <div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
                        <div class="cart-total mb-3">
                            <h3>Cart Totals</h3>
                            <%                                out.print("<p class='d-flex'>");
                                out.print("<span>Subtotal</span>");
                                out.print("<span>$" + getServletContext().getAttribute("total") + "</span>");
                                out.print("</p>");
                                out.print("<p class='d-flex'>");
                                out.print("<span>Delivery</span>");
                                out.print("<span>$0.00</span>");
                                out.print("</p>");
                                out.print("<p class='d-flex'>");
                                out.print("<span>Discount</span>");
                                out.print("<span>$0.00</span>");
                                out.print("</p>");
                                out.print("<hr>");
                                out.print("<p class='d-flex total-price'>");
                                out.print("<span > Total </span>");
                                out.print("<span>$" + getServletContext().getAttribute("total") + "</span>");
                                out.print("</p>");
                            %>
                        </div>
                        <p class="text-center"><a href="order.jsp" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
                        <p class="text-center"><a href="list.jsp" class="btn btn-primary py-3 px-4">Buy Continue</a></p>
                    </div>
                </div>
            </div>
        </section>


        <footer class="ftco-footer ftco-section">
            <div class="container">
                <div class="row">
                    <div class="mouse">
                        <a href="#" class="mouse-icon">
                            <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
                        </a>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Clothes Shop</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Menu</h2>
                            <ul class="list-unstyled">
                                <li><a href="./../../home.jsp" class="py-2 d-block">Shop</a></li>
                                <li><a href="./../../auth/about.jsp" class="py-2 d-block">About</a></li>
                                <li><a href="./../../auth/contact.jsp" class="py-2 d-block">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Help</h2>
                            <div class="d-flex">
                                <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
                                    <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
                                    <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
                                    <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
                                </ul>
                                <ul class="list-unstyled">
                                    <li><a href="#" class="py-2 d-block">FAQs</a></li>
                                    <li><a href="./../../auth/about.jsp" class="py-2 d-block">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="Style/js/google-map.js"></script>
        <script src="Style/js/main.js"></script>
    </body>
</html>
