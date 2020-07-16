<%-- 
    Document   : listproducts
    Created on : Jul 5, 2020, 9:50:45 AM
    Author     : 
--%>

<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
        <title>List Products </title>
        <style>
            @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
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
            table{
                font-family: 'Pangolin', cursive;
                width: 100%;
                text-align: center;
                background-color: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }
            th{
                border-style: solid;
            }

            .table{
                padding : 20px;
                padding-top: 100px;

            }
            .insert{
                padding: 10px;
                background: #f8f2f2;
                border-style: solid;
                opacity: 0.9;
            }
            .container{
                align-items: center;
                justify-content: center;
                width: 100%;
                padding-left: 550px;
                padding-top: 30px;
            }



        </style>
    </head>
    <body>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

            <a class="navbar-branch" href="index.jsp">
                <img src="./../../images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                    <li class="nav-item">
                        <a href="./../../home.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="./../bill/listbill.jsp" class="nav-link ">Bill</a>
                    </li>
                    <li class="nav-item">
                        <a href="./../customer/listcustomer.jsp" class="nav-link ">Customer</a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            if (request.getParameter("id") != null) {
                int pId = Integer.parseInt(request.getParameter("id"));
                ProductsDAO pDao = new ProductsDAO();
                int kq = pDao.delete(pId);
                if (kq > 0) {
                    out.println("<script> alert('Xoa thanh cong');</script>");
                } else {
                    out.println("<script>alert('Xoa that bai');</script>");
                }
                out.println("<script>location.href='listproducts.jsp';</script>");
            }
        %>
    </div>
    <div class="container">
        <a href="./insertProduct.jsp" class="insert">Insert</a>   
    </div>
    <div class="table">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>ID Products</th>
                <th>Status Product</th>
                <th>Brand Products</th>
                <th>Type Products</th>
                <th>Supplier </th>
                <th>Product's name</th>
                <th>Saleprice</th>
                <th>Price</th>
                <th>Describle</th>
                <th>Date</th>
                <th>Size </th>
                <th>Material</th>
                <th>Update</th>
                <th>Clothing</th>
                <th>Image</th>
                <th>Gender</th>


            </tr>
            <%
                ProductsDAO pDao = new ProductsDAO();
                ResultSet rs = pDao.getAll();
                ImageDAO iDao = new ImageDAO();
                while (rs.next()) {

                    out.print("<tr>");
                    out.print("<td>" + rs.getInt("pID") + "</td>");
                    out.print("<td>" + rs.getInt("status") + "</td>");
                    out.print("<td>" + rs.getInt("brID") + "</td>");
                    out.print("<td>" + rs.getInt("tID") + "</td>");
                    out.print("<td>" + rs.getInt("supID") + "</td>");
                    out.print("<td>" + rs.getString("pName") + "</td>");
                    out.print("<td>" + rs.getInt("sellingPrice") + "</td>");
                    out.print("<td>" + rs.getInt("price") + "</td>");
                    out.print("<td>" + rs.getString("describle") + "</td>");
                    out.print("<td>" + rs.getDate("pDate") + "</td>");
                    out.print("<td>" + rs.getInt("size") + "</td>");
                    out.print("<td>" + rs.getString("material") + "</td>");
                    out.print("<td>" + rs.getString("gender") + "</td>");
                    ResultSet rsImg = iDao.getImage(rs.getInt("pID"));
                    while (rsImg.next()) {
                        out.print("<td><img src='../../data/" + rsImg.getString(3) + "' height='100px' width='100px' /></td>");
                        break;
                    }
                   
                    out.print("<td><a href='updateProduct.jsp?id=" + rs.getInt("pID") + "'>Update</a></td>");
                    out.print("<td><a href='?id=" + rs.getInt("pID") + "'>Delete</a></td>");

                    out.print("</tr>");
                }
            %>

        </table>


</body>

</html>
