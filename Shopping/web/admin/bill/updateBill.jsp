<%-- 
    Document   : updateBill
    Created on : Jul 14, 2020, 12:20:56 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Bill"%>
<%@page import="model.DAO.BillDAO"%>
<%@page import="java.sql.Date"%>
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
        <title>Update Bill</title>
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
            label, h3{
                font-family: 'Pangolin', cursive;
                text-align: center;
                background-color: #f8f2f2;
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
        <%
            int bID = 0;
            int cID = 0;
            String bStatus = "";
            String customerName = "";
            Date bDate = null;
            String address = "";
            String phone = "";
            String note = "";
            double total = 0;
            if (request.getParameter("id") != null) {
                bID = Integer.parseInt(request.getParameter("id"));
                BillDAO bDao = new BillDAO();
                Bill b = bDao.getBill(bID);
                cID = b.getcID();
                bStatus = b.getbStatus();
                customerName = b.getCustomerName();
                bDate = b.getDate();
                address = b.getAddress();
                phone = b.getPhone();
                note = b.getNote();
                total = b.getTotal();
            }
        %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10 ftco-animate">
                        <form action="./../../BillController" class="billing-form" method="post">
                            <input type="hidden" value="<%= bID%>" name="bID"/>
                            <input type="hidden" value="<%= cID%>" name="cID"/>
                            <h3 class="mb-4 billing-heading">Billing Details</h3>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Your Name</label>
                                        <input type="text" class="form-control" placeholder="Your Name" name="customerName" value="<%= customerName%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="text" class="form-control" placeholder="Your Phone Number" name="phone" value="<%= phone%>">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="streetaddress">Street Address</label>
                                        <input type="text" class="form-control" placeholder="House Number and Street Name" name="address" value="<%= address%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="date">Bill Date</label>
                                        <input type="date" class="form-control" placeholder="Date Of Bill" name="pDate" value="<%= bDate %>">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="note">Note</label>
                                        <input type="text" class="form-control" placeholder="Your Note" name="note" value="<%= note%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <input type="text" class="form-control" placeholder="Status Of Bill" name="bStatus" value="<%= bStatus%>">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-3">
                                    <div class="form-group" >
                                        <label for="status">Total</label>
                                        <input type="input" class="form-control" name="total" value="<%= total %>">/
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-3">
                                    <div class="form-group" >
                                        <input type="submit" class="form-control" name="btnUpdate" value="Update">/
                                    </div>
                                </div>
                            </div>
                        </form><!-- END -->
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section>
    </body>
</html>