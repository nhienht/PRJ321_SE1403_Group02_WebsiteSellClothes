<%-- 
    Document   : insertProduct.jsp
    Created on : Jul 5, 2020, 10:18:24 AM
    Author     : NhienHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
        <title>Insert Products</title>
        <style>

            html ,body {
                width: 100%;
                height: 100%;
                font-family: 'Balsamiq Sans';   
                font-size: 17px;
                color: #222;
                background: url(../../images/vin.jpg) fixed;
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
            .container{
                font-family: 'Pangolin', cursive;
                width: 50%;
                text-align: center;
                background-color: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }




        </style>
    </head>
    <body>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top" style="">

            <a class="navbar-branch" href="index.jsp">
                <img src="./images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 900px">
                    <li class="nav-item">
                        <a href="./../../home.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="./insertProduct.jsp" class="nav-link">Insert</a>
                    </li>
                    <li class="nav-item">
                        <a href="./listproducts.jsp" class="nav-link">Products</a>
                    </li>






                </ul>
            </div>
        </nav>
        <div class="container">
            <form action="./../../ProductController" method="POST">
                <div class="form-group">
                    <label for="StatusID" class="col-sm-3 control-label">Status product </label>
                    <input type="text" name="status" class="form-control" autofocus required="Please input" >

                </div>

                <div class="form-group">
                    <label for="BrandID" class="col-sm-3 control-label">Brand product ID</label>
                    <input class="form-control" autofocus="" required=" " name="brID" >
                </div>

                <div class="form-group">
                    <label for="TypeP" class="col-sm-3 control-label">Type product ID</label> 
                    <select name="tID" class="form-control" autofocus="">
                            <option  value=1>T-shirt</option>
                            <option value=2>Short</option>
                            <option  value=3>Skirt</option>
                            <option  value=4>Dress</option>
                            <option value=5>Pants</option>
                            <option  value=6>Jacket</option>
                            <option  value=7>Jeans</option>
                            <option value=8>Shirt</option>
                            <option  value=9>Sweater</option>
                        </select>  
                </div>

                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Supplier product ID</label>
                    <input class="form-control" autofocus="" required=" " name="supID" >
                </div>

                <div class="form-group">
                    <label for="NameP" class="col-sm-3 control-label">Name product </label>
                    <input class="form-control" autofocus="" required=" " name="pName" >
                </div>

                <div class="form-group">
                    <label for="priceS" class="col-sm-3 control-label">Price's Sale</label>
                    <input class="form-control" autofocus="" required=" " name="sellingPrice" >
                </div>

                <div class="form-group">
                    <label for="Price" class="col-sm-3 control-label">Price</label>
                    <input class="form-control" autofocus="" required=" " name="price" >
                </div>

                <div class="form-group">
                    <label for="Des" class="col-sm-3 control-label">Description</label>
                    <input class="form-control" autofocus="" required=" " name="describle" >
                </div>

                <div class="form-group">
                    <label for="Des" class="col-sm-3 control-label">Date</label>
                    <input  type="date"class="form-control" autofocus="" required=" " name="pDate" >
                </div>

                <div class="form-group">
                    <label for="Size" class="col-sm-3 control-label">Size product</label>
                    <input  type="text"class="form-control" autofocus="" required=" " name="size" >
                </div>
                <div class="form-group">
                    <label for="Material" class="col-sm-3 control-label">Material</label>
                    <input  type="text"class="form-control" autofocus="" required=" " name="material" >
                </div>
                <div class="form-group">
                    <label for="Material" class="col-sm-3 control-label">Quantity</label>
                    <input  type="text"class="form-control" autofocus="" required=" " name="quantity" >
                </div>

                <div class="form-group">
                    <label for="Material" class="col-sm-3 control-label">Discount</label>
                    <input  type="text"class="form-control" autofocus="" required=" " name="discount" >
                </div>
                <div class="form-group">
                    <label for="Material" class="col-sm-3 control-label">Gender</label>
                <select name="gender" >
                            <option  value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option  value="Unisex">Unisex</option>
                        </select>   
                </div>
                
                 <div class="form-group">
                    <label for="Material" class="col-sm-3 control-label">Img</label>
                    <input  type="file"class="form-control" autofocus="" required=" " name="img" multiple >
                </div>
                
                <input type="submit" value="INSERT">
            </form>
        </div>

    </body>
</html>
