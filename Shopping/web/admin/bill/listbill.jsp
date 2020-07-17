<%-- 
    Document   : listBill
    Created on : Jul 14, 2020, 12:21:24 PM
    Author     : NhienHT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.BillDAO"%>
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
                        <a href="../../home.jsp" class="nav-link ">Home</a>
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
        <table border="1" cellpadding="0" cellspacing="0" >
            <tr>
                <th><strong># ID Bill</strong></th>
                <th><strong>Customer ID</strong></th>
                <th><strong>Status</strong></th>
                <th><strong>Recipient's name</strong></th>
                <th><strong>Date Of Purchase</strong></th>
                <th><strong>Address</strong></th>
                <th><strong>Phone</strong></th>
                <th><strong>Note</strong></th>             
                <th><strong>Total</strong></th>
                <th><strong>Bill Detail</strong></th>
                <th><strong>Update</strong></th>
                <th><strong>Change Status</strong></th>
                    <%
                        BillDAO bDao = new BillDAO();
                        ResultSet rs = bDao.getAll();
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getInt(1) + "</td>");
                            out.print("<td>" + rs.getInt(2) + "</td>");
                            out.print("<td>" + rs.getString(3) + "</td>");
                            out.print("<td>" + rs.getString(4) + "</td>");
                            out.print("<td>" + rs.getDate(5) + "</td>");
                            out.print("<td>" + rs.getString(6) + "</td>");
                            out.print("<td>" + rs.getString(7) + "</td>");
                            out.print("<td>" + rs.getString(8) + "</td>");
                            out.print("<td>" + rs.getDouble(9) + "</td>");
                            out.print("<td><a href='billDetail.jsp?id=" + rs.getInt("bID") + "'>Xem chi tiet hoa don</a></td>");
                             out.print("<td><a href='updateBill.jsp?id=" + rs.getInt("bID") + "'>Cap nhat</a></td>");
                            out.print("</tr>");
                        }
                    %>
            </tr>
        </table>
    </body>
</html>
