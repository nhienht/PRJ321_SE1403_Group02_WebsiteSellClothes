<%-- 
    Document   : updateProduct
    Created on : Jul 5, 2020, 11:35:02 AM
    Author     : NhienHT
--%>


<%@page import="java.util.Date"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
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
        <title>Update Products</title>
    </head>
    <body>
        <style>

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
            .container{
                font-family: 'Pangolin', cursive;
                width: 50%;
                text-align: center;
                background-color: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }




        </style>
        <%
            int id = 0, spID = 0, brID = 0, tID = 0, supID = 0, size = 0, quantity = 0;
            String pName = "", description = "", material = "";
            Double sellingPrice = 0.0, price = 0.0;
            float discount = 0;
            Date pDate = null;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
                ProductsDAO pDao = new ProductsDAO();
                Products p = pDao.getProduct(id);
                spID = p.getSpID();
                brID = p.getBrID();
                tID = p.gettID();
                supID = p.getSupID();
                pName = p.getpName();
                sellingPrice = p.getSellingPrice();
                price = p.getPrice();
                description = p.getDescrible();
                size = p.getSize();
                pDate = p.getpDate();
                material = p.getMaterial();
                quantity = p.getQuantity();
                discount = p.getDiscount();
            }
        %>

        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top" style="">

            <a class="navbar-branch" href="../../index.jsp">
                <img src="./../../images/logo.jpg" height="80px" alt="">
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
                    <label for="ID" class="col-sm-3 control-label">ID</label>
                    <input value="<%= id%>" type="text" name="pID" class="form-control" autofocus required="Please input ID" >
                </div>
                <div class="form-group">
                    <label for="StatusID" class="col-sm-3 control-label">Status product ID</label>
                    <input value="<%= spID%>" type="text" name="spID" class="form-control" autofocus required="Please input" >

                </div>
                <div class="form-group">
                    <label for="BrandID" class="col-sm-3 control-label">Brand product ID</label>
                    <input  value="<%= brID%>"class="form-control" autofocus="" required=" " name="brID" >
                </div>

                <div class="form-group">
                    <label for="TypeP" class="col-sm-3 control-label">Type product ID</label>
                    <input value="<%= tID%>" class="form-control" autofocus="" required=" " name="tID" >
                </div>

                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Supplier product ID</label>
                    <input value="<%= supID%>" class="form-control" autofocus="" required=" " name="supID" >
                </div>

                <div class="form-group">
                    <label for="NameP" class="col-sm-3 control-label">Name product </label>
                    <input value="<%= pName%>" class="form-control" autofocus="" required=" " name="pName" >
                </div>

                <div class="form-group">
                    <label for="priceS" class="col-sm-3 control-label">Price's Sale</label>
                    <input value="<%= sellingPrice%>" class="form-control" autofocus="" required=" " name="sellingPrice" >
                </div>

                <div class="form-group">
                    <label for="Price" class="col-sm-3 control-label">Price</label>
                    <input value="<%= price%>" class="form-control" autofocus="" required=" " name="price" >
                </div>

                <div class="form-group">
                    <label for="Des" class="col-sm-3 control-label">Description</label>
                    <input value="<%= description%>" class="form-control" autofocus="" required=" " name="describle" >
                </div>

                <div class="form-group">
                    <label for="Des" class="col-sm-3 control-label">Date</label>
                    <input value="<%= pDate%>" type="date"class="form-control" autofocus="" required=" " name="pDate" >
                </div>

                <div class="form-group">
                    <label for="Size" class="col-sm-3 control-label">Size product</label>
                    <input value="<%= size%>"  type="text"class="form-control" autofocus="" required=" " name="size" >
                </div>
                <div class="form-group">
                    <label for="Material" class="col-sm-3 control-label">Material</label>
                    <input value="<%= material%>" type="text"class="form-control" autofocus="" required=" " name="material" >
                </div>

                <div class="form-group">
                    <label for="Quantity" class="col-sm-3 control-label">Quantity</label>
                    <input value="<%= quantity%>" type="text"class="form-control" autofocus="" required=" " name="quantity" >
                </div>

                <div class="form-group">
                    <label for="Discount" class="col-sm-3 control-label">Discount</label>
                    <input value="<%= discount%>" type="text"class="form-control" autofocus="" required=" " name="discount" >
                </div>
                <input type="submit" value="UPDATE" name="btnUpdate">
            </form>
        </div>

    </body>
</html>
