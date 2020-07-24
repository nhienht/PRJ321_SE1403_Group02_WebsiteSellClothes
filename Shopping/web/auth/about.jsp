<!DOCTYPE html>
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
        <title>About Us</title>
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
            .nav-item{
                padding-right: 20px;
                font-size: 25px;
            }
            .map
            {
                padding-top: 4em;
            }
            li p {
                color: #666;
                font-weight: 300;

            }
            p {
                margin: 0 0 10px 0;
                line-height: 21px;
            }
            .fotter{
                background-color: #232323;


            }
            #link{
                color: white;
            }
            .fotter-contact{
                color: white;
                font-family: 'Quicksand', sans-serif!important;
            }
            .logo-image{
                width: 70px;
                padding-bottom: 5px;
            }
            .button.dark {
                background-color: white;
                color: black;
                border: 2px solid #e7e7e7;
                font-size: 20px;
            }
            .button:hover{
                background-color: #666; /* Green */

            }
            .input-group
            {
                padding: 3px;
            }
            .fotter{
                background-color: black;
                color: white;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <%@include file="../header/header.jsp" %>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

            <a class="navbar-branch" href="index.jsp">
                <img src="../images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                    <li class="nav-item">
                        <a href="../home.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="../customer/product/list.jsp" class="nav-link ">Products</a>

                    </li>
                    <li class="nav-item">
                        <a href="about.jsp" class="nav-link">About us</a>
                    </li>
                    <li class="nav-item">
                        <a href="contact.jsp" class="nav-link">Contact</a>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a href="../customer/product/cart.jsp" class="nav-link">Cart</a>
                    </li>

                    <li class="nav-item dropdown no-arrow  ">
                        <a style="color: black;position:relative; top: -20px;" class="nav-link dropdown-toggle " href="#" id="userDropdown" role="button" data-toggle="dropdown"
                           >
                            <h3><i style="color: black;position:relative; top: -1px;" class="fas fa-user-circle fa-fw"></i></h3>
                        </a>
                        <div class="dropdown-menu dropdown-menu-"  >
                            <!--<a class="dropdown-item" href="#">Logout</a>-->

                            <%
                                Cookie[] cookies = request.getCookies();
                                if (cookies.length > 1) {
                                    for (Cookie cookie : cookies) {
                                        if (cookie.getName().equals("user")) { // neu user dang nhap
                                            out.print("<a class='nav-link' style='color: black' href='../customer/Information.jsp'>" + cookie.getValue() + "</a>"); // chuyen vao trang infor user
                                            out.print("<a class='nav-link' style='color: black' href='LogoutController'>Logout</a>");
                                        }
                                    }
                                } else {
                                    out.print("<a class='nav-link' class='color' style='color: black' href='login.jsp'>Login</a>"); // neu user chua dang nhap
                                    out.print("<a class='nav-link' style='color: black' href='signin.jsp'>Sigin</a>");
                                }
                            %>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
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
    </body>

</html>