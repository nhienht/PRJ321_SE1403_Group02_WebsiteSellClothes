<%-- 
    Document   : contact.jsp
    Created on : Jun 23, 2020, 12:59:38 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        </style>>
        <title>Contact</title>
    </head>

    <body>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">
            <a class="navbar-branch" href="index.jsp">
                <img src="./images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="./index.jsp" class="nav-link active">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="./index.jsp" class="nav-link">News</a>
                    </li>
                    <li class="nav-item">
                        <a href="./about.jsp" class="nav-link">About us</a>
                    </li>
                    <li class="nav-item">
                        <a href="./contact.jsp" class="nav-link">Contact</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid padding">
            <div class="row text-center padding">
                <div class="col-xs-12 col-sm-6">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3925.7741918207425!2d105.7160356147447!3d10.279769692659709!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x310a7ee3f9dbe29f%3A0x2fa63cb27232491f!2zQ2jhu6MgSG_DoCBUaMOgbmg!5e0!3m2!1sen!2s!4v1589561301072!5m2!1sen!2s"
                        width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe>
                </div>
                <div class="col-xs-12 col-sm-6">

                    <ul class="list-infor" style="list-style: none;">
                        <li>
                            <strong>Contact</strong>
                            <hr width="30%" size="10px" align="center" />
                            <p>Contact us</p>

                            <strong>174a/TL , Hoa Thanh , Lai Vung , Dong Thap</strong>

                        </li>
                        <li>
                            <p>Email</p>
                            <strong>
                                dathbce140320@fpt.edu.vn
                            </strong>
                        </li>
                        <li>
                            <p>
                                Phone Number
                            </p>

                            <strong>0776598062</strong>

                        </li>
                        <hr width="30%" size="10px" align="center" />
                        <div class="contact-form">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <div class="input-group">
                                        <input required="" type="text" name="contact[name]" class="form-control"
                                               placeholder="Your name" aria-describedby="basic-addon1">

                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="input-group">
                                        <input required="" type="text" name="contact[email]" class="form-control"
                                               placeholder="Your email address" aria-describedby="basic-addon1">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="input-group">
                                        <input pattern="[0-9]{10,12}" required="" type="text" name="contact[phone]"
                                               class="form-control" placeholder="Your phone number"
                                               aria-describedby="basic-addon1">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xs-12">
                                    <div class="input-group">
                                        <textarea name="contact[body]" placeholder="Content"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xs-12">
                                    <div class="input-group">
                                        <button class="button dark">Send us</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr width="30%" size="10px" align="center" />
                    </ul>
                </div>
            </div>
            <div class="fotter" style="width: 100% ;">
                <div class="container-fluid padding">
                    <div class="row  text-center padding">
                        <div class="col-xs-12 col-sm-6 ">
                            <ul class="icon">
                                <li>
                                    <a id="link" target="_blank" class="footer-link has-icon has-icon facebook"
                                       href="https://www.facebook.com/profile.php?id=100008380879010"><i
                                            style="font-size:24px" class="fa">&#xf230;</i> Facebook</a>
                                </li>
                                <li>
                                    <a id="link" target="_blank" class="footer-link has-icon has-icon instagram"
                                       href="https://www.instagram.com/julis_huyh/"><i style="font-size:24px"
                                                                                    class="fa">&#xf16d;</i>
                                        Instagram</a>
                                </li>
                            </ul>


                        </div>
                        <div class="col-xs-12 col-sm-6 ">
                            <ul class="fotter-contact" style="list-style: none;">
                                <li>
                                    <img class="logo-image" src="./images/logo.jpg" alt="">
                                </li>
                                <li class="Infor">
                                    <span>Tan Long, Hoa Thanh,  Lai Vung , Dong Thap Province</span>
                                </li>
                                <li>
                                    <span>077.659.8062</span>
                                </li>
                                <li>
                                    <span>dathbce140320@fpt.edu.vn</span>
                                </li>
                            </ul>
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