<%-- 
    Document   : order
    Created on : Jul 7, 2020, 1:54:23 PM
    Author     : NhienHT
--%>

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
    <body class="goto-here">
        <div class="py-1 bg-black">
            <div class="container">
                <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                    <div class="col-lg-12 d-block">
                        <div class="row d-flex">
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                                <span class="text">+ 1235 2355 98</span>
                            </div>
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                                <span class="text">DND@gmail.com</span>
                            </div>
                            <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                                <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="./../../home.jsp">Clothes Shop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="./../../home.jsp" class="nav-link">Home</a></li>
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Catalog</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown04">
                                <a class="dropdown-item" href="./../../home.jsp">Shop</a>
                                <a class="dropdown-item" href="cart.jsp">Cart</a>
                                <a class="dropdown-item" href="order.jsp">Checkout</a>
                            </div>
                        </li>
                        <li class="nav-item"><a href="./../../auth/about.jsp" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="./../../auth/contact.jsp" class="nav-link">Contact</a></li>
                        <li class="nav-item cta cta-colored"><a href="cart.jsp" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('Style/images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="./../../home.jsp">Home</a></span> <span>Checkout</span></p>
                        <h1 class="mb-0 bread">Checkout</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10 ftco-animate">
                        <form action="./../../OrderController" class="billing-form" method="post">
                            <h3 class="mb-4 billing-heading">Billing Details</h3>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Your Name</label>
                                        <input type="text" class="form-control" placeholder="Your Name" name="nameCustomer">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="text" class="form-control" placeholder="Your Phone Number" name="phone">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="streetaddress">Street Address</label>
                                        <input type="text" class="form-control" placeholder="House Number and Street Name" name="address">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="towncity">Note</label>
                                        <input type="text" class="form-control" placeholder="Your Note" name="note">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5 pt-3 d-flex">
                                <div class="col-md-6 d-flex">
                                    <div class="cart-detail cart-total bg-light p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Cart Total</h3>
                                        <%
                                            out.print("<p class='d-flex'>");
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
                                        <input type="submit" value="Place An Order" name="btnOrder"/>               
                                    </div>
                                </div>

                            </div>
                        </form><!-- END -->
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section> <!-- .section -->


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
                                    <li><a href="#" class="py-2 d-block">Contact</a></li>
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
