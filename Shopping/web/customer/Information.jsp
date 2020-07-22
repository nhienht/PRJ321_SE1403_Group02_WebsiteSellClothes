<%-- 
    Document   : Information
    Created on : Jul 13, 2020, 3:44:23 PM
    Author     : Dat
--%>
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
            background-color: #F5A9BC;
            background-size: cover;
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

        body {
            height: 100%;
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


        }
        body{
            background-color: #F5A9BC;
        }

        a{

            text-decoration: none;
            color: #000;
        }
        .input-group{
            padding-bottom: 30px;
        }

    </style>
    <body>
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1 fas" href="../home.jsp">
                <h3>Shopping</h3>
            </a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Navbar Search -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

            </form>

            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow mx-1"></li>
                <li class="nav-item dropdown no-arrow mx-1"></li>

                <!-- LOGOUT-->

            </ul>

        </nav>

        ID: 
        <%
            Cookie[] cookies = request.getCookies();
            int id = 0;
            for (Cookie c : cookies) {
                if (c.getName().equals("idCustomer")) {
                    id = Integer.parseInt(c.getValue());
                }
            }
            out.print(id);
            CustomerDAO cDao = new CustomerDAO();
            Customer c = cDao.getCustomer(id);
        %>

        <h1 style="text-align: center"> Information </h1>
        <div class="container">
            <form class="form-horizontal" role="form" action="./../ChangeInforCustomer" method="POST">

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Full Name</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control">  <%= c.getcName()%> </p>
                    </div>
                </div>


                <div class="form-group">
                    <label for="userName" class="col-sm-3 control-label">User Name</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control">  <%= c.getcUsername()%> </p>

                    </div>
                </div>

                <div class="form-group">
                    <label for="PhoneNumer" class="col-sm-3 control-label">Phone</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control"> <%= c.getPhonenumber()%> </p>

                    </div>
                </div>


                <div class="form-group">
                    <label for="Address" class="col-sm-3 control-label">Address</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control">  <%= c.getAddress()%> </p>

                    </div>
                </div>


                <div class="form-group">
                    <label for="PhoneNumer" class="col-sm-3 control-label">Birthday</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control"> <%= c.getBirthday()%> </p>

                    </div>
                </div>


                <div class="form-group">
                    <label for="Email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control">  <%= c.getEmail()%> </p>

                    </div>
                </div>

                <div class="form-group">
                    <label for="Gender" class="col-sm-3 control-label">Gender</label>
                    <div class="col-sm-9">
                        <p  id="fullName" name="supID" required="Please enter your name" placeholder="Full Name" class="form-control">  <%= c.getGender()%> </p>

                    </div>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-outline-danger"><a target="_blank" href="changeInfo.jsp">Change Information</a></button>   
                    <button type="button" class="btn btn-outline-danger"><a target="_blank" href="changePassword.jsp">Change password</a></button> 
                </div>



            </form>
            <sql:setDataSource var="conn"
                               driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/prj321"
                               user="root"
                               password=""
                               />
            <sql:query var="bill" dataSource="${conn}" sql="select * from bill where cID=?">
                <sql:param value="<%= id%>" />
            </sql:query>

    </body>
</html>