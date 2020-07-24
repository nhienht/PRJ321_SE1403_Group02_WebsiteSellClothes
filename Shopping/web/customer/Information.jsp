<%-- 
    Document   : Information
    Created on : Jul 13, 2020, 3:44:23 PM
    Author     : Dat
--%>
<%@page import="model.DAO.BillDetailDAO"%>
<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.BillDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="model.entity.Customer"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        


        <title>Information</title>
    </head>
    <style>
        body {

            background-size: cover;
            height: 100%;
            background-color: #F5A9BC;
        }

        *[role="form"] {
            max-width: 530px;
            padding: 15px;
            margin: 0 auto;
            border-radius: 0.3em;
            background-color: #f2f2f2;
        }

        *[role="form"] h2 { 
            font-family: 'Open Sans' , sans-serif;
            font-size: 40px;
            font-weight: 600;
            color: #000000;
            margin-top: 5%;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 4px;
            .Sex{
                font-family: 'Open Sans' , sans-serif; 
                font-size: 40px;
                font-weight: 600;
                width: 200px;
                color: red;
            }
        }
        .input-group{
            padding-bottom: 30px;
        }
        html {
            position: relative;
            min-height: 100%;
        }



        #wrapper {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
        }

        #wrapper #content-wrapper {
            overflow-x: hidden;
            width: 100%;
            padding-top: 1rem;
            padding-bottom: 80px;
        }

        body.fixed-nav #content-wrapper {
            margin-top: 56px;
            padding-left: 90px;
        }

        body.fixed-nav.sidebar-toggled #content-wrapper {
            padding-left: 0;
        }

        @media (min-width: 768px) {
            body.fixed-nav #content-wrapper {
                padding-left: 225px;
            }

            body.fixed-nav.sidebar-toggled #content-wrapper {
                padding-left: 90px;
            }



            a{

                text-decoration: none;
                color: #000;
            }
            .input-group{
                padding-bottom: 30px;
            }
            #p{
                font-size: 25px;
                padding: 5px
            }
            .table-danger td{
                background: #D8D8D8;
                border-radius: 7px;
            }
            button:hover{
                opacity: 0.7;

            }
            .dropdown
            {
                float:  right;
                padding-left: 20px;
            }
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
        <body>
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
                            <a href="../auth/about.jsp" class="nav-link">About us</a>
                        </li>
                        <li class="nav-item">
                            <a href="../auth/contact.jsp" class="nav-link">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a href="../customer/product/cart.jsp" class="nav-link">Cart</a>
                        </li>




                    </ul>
                </div>
            </nav>
            <%
                Cookie[] cookies = request.getCookies();
                int id = 0;
                for (Cookie c : cookies) {
                    if (c.getName().equals("idCustomer")) {
                        id = Integer.parseInt(c.getValue());
                    }
                }
                CustomerDAO cDao = new CustomerDAO();
                Customer c = cDao.getCustomer(id);
                BillDAO bDao = new BillDAO();
                ResultSet bill = bDao.getBillbyCustomer(id);
            %>

            <h1 style="text-align: center"> Information </h1>
            <div class="container">
                <form action="./../ChangeInforCustomer" method="POST">
                    <table class="col-sm-10 table table-bordered table-danger table-hover">
                        <tr>
                            <td>Full name</td>
                            <td class="text"><%= c.getcName()%></td>
                        </tr>
                        <tr>
                            <td>User name</td>
                            <td><%= c.getcUsername()%></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td><%= c.getPhonenumber()%></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><%= c.getAddress()%> </td>
                        </tr>   
                        <tr>
                            <td>BirthDay</td>
                            <td> <%= c.getBirthday()%> </td>
                        </tr>   
                        <tr>
                            <td>Email</td>
                            <td>  <%= c.getEmail()%>  </td>
                        </tr> 
                        <tr>
                            <td>Gender</td>
                            <td>  <%= c.getGender()%> </td>
                        </tr> 
                    </table>
                    <div class="row" style="position: relative ; left: 12px;" >
                        <button style=" background: #f2f2f2; " type="button" class="btn btn-outline-danger mr-md-3"><a style="text-decoration: none" target="_blank" href="changeInfo.jsp">Change Information</a></button>   
                        <button style=" background: #f2f2f2;" type="button" class="btn btn-outline-danger mr-md-3"><a style="text-decoration: none" target="_blank" href="changePassword.jsp">Change password</a></button> 
                    </div>
                </form> 
                <hr>

                <h1 style="text-align: center"> List bill </h1>
                <div>
                    <table class="table table-hover border-primary">
                        <tr>
                            <th>No.</th>
                            <th>Receiver</th> 
                            <th>Date of purchase</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>List product</th>
                            <th>Total</th>
                            <th>Note</th>
                        </tr>
                        <%
                            int i = 1;
                            while (bill.next()) {
                                out.print("<tr>");
                                out.print("<td> " + i++ + "</td>");
                                out.print("<td> " + bill.getString(4) + "</td>");
                                out.print("<td> " + bill.getDate(5) + "</td>");
                                out.print("<td> " + bill.getString(6) + "</td>");
                                out.print("<td> " + bill.getString(7) + "</td>");
                                out.print("<td> " + bill.getString(3) + "</td>");
                                out.print("<td>");
                                BillDetailDAO bdDao = new BillDetailDAO();
                                ResultSet billDetail = bdDao.getBillDetail(bill.getInt(1));
                                ProductsDAO pDao = new ProductsDAO();
                                while (billDetail.next()) {
                                    Products p = pDao.getProduct(billDetail.getInt(2));
                                    out.print("<p> - " + p.getpName() + "<b> #SL:" + billDetail.getInt(3) + "</b>" + "</p>");

                                }
                                out.print("</td>");
                                out.print("<td> " + bill.getString(9) + "</td>");
                                out.print("<td> " + bill.getString(8) + "</td>");
                                out.print("</tr>");
                            }
                        %>
                    </table>

                </div>

        </body>
       
    </html>