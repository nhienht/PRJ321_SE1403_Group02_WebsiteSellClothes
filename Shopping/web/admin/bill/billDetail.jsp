<%-- 
    Document   : billDetail
    Created on : Jul 14, 2020, 12:21:08 PM
    Author     : NhienHT
--%>

<%@page import="model.DAO.BillDAO"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="model.DAO.BillDetailDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
        <title>List Bill</title>
        <style>
            html ,body {
                width: 100%;
                height: 100%;
                font-family: 'Balsamiq Sans';   
                font-size: 17px;
                color: #222;
                background: url('../../images/vin.jpg') fixed;
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
            table{
                font-family: 'Pangolin', cursive;
                width: 100%;
                text-align: center;
                background-color: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }
            th{
                font-size: 15px;
                text-align:  center;
            }
        </style>
    </head>
    <body>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top" style="">

            <a class="navbar-branch" href="../../index.jsp">
                <img src="../../images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 900px">
                    <li class="nav-item">
                        <a href="./home.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="./../product/insertProduct.jsp" class="nav-link">Insert</a>
                    </li>
                    <li class="nav-item">
                        <a href="./../product/listproducts.jsp" class="nav-link">Products</a>
                    </li>
                </ul>
            </div>
        </nav>
        <table border="1" cellpadding="0" cellspacing="0">
            <th><strong>Product Name</strong></th>
            <th><strong></strong>Quantity</th>
            <th><strong>Price</strong></th>
            <th><strong>Total</strong></th>

            <%
                BillDetailDAO bdDao = new BillDetailDAO();
                int bId = Integer.parseInt(request.getParameter("id"));
                ResultSet rs = bdDao.getBillDetail(bId);

                while (rs.next()) {
                    int pId = rs.getInt("pId");
                    int quantity = rs.getInt("quantity");

                    ProductsDAO pDao = new ProductsDAO();
                    Products p = pDao.getProduct(pId);
                    String pName = p.getpName();
                    double price = p.getPrice();
                    double total = price * quantity;
                    out.print("<tr>");
                    out.print("<td><img src='../../images/logo.jpg' height='80px' alt=''></td>");
                    out.print("<td>" + pName + "</td>");
                    out.print("<td>" + quantity + "</td>");
                    out.print("<td>" + price + "</td>");
                    out.print("<td>" + total + "</td>");
                    out.print("</tr>");
                }
            %>
        </table>
    </body>
</html>
