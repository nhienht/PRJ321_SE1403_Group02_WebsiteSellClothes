<%-- 
    Document   : updateCustomer
    Created on : Jul 9, 2020, 11:12:50 PM
    Author     : Dat
--%>

<%@page import="java.util.Date"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page import="model.entity.Customer"%>
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
        <title>JSP Page</title>
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
    </head>
    <body>

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

        <%
            int cID = 0;
            String cUsername = "";
            String cPassword = "";
            String cName = "";
            String phonenumber = "";
            String address = "";
            Date date = null;
            String email = "";
            int status = 0;
            String gender = "";

            if (request.getParameter("id") != null) {
                cID = Integer.parseInt(request.getParameter("id"));
                CustomerDAO cDao = new CustomerDAO();
                Customer c = cDao.getCustomer(cID);
                cUsername = c.getcName();
                cPassword = c.getcPassword();
                cName = c.getcName();
                phonenumber = c.getPhonenumber();
                address = c.getAddress();
                date = c.getBirthday();
                email = c.getEmail();
                status = c.getStatus();
                gender = c.getGender();

            }
        %>
        <div class="container">

            <form action="./../../CustomerController" method="POST">
                <div class="form-group">
                    <input type="hidden" value="<%= cID%>" name="cID"/>
                    <input type="hidden" value="<%= cPassword%>" name="cPassword"/>
                </div>

                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">User Name</label>  
                    <input type="text" name="cUsername" value="<%= cUsername%>" ></br>
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label"> Name</label>  
                    <input type="text" name="cName" value="<%= cName%>" >
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label"> Phone Number</label>  
                    <input type="text" name="phonenumber" value="<%= phonenumber%>" >
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Address</label>  
                    <input type="text" name="address" value="<%= address%>" >
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Birthday</label>  
                    <input type="date" name="birthday" value="<%= date%>" >
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Email</label>  
                    <input type="text" name="email" value="<%= email%>" >
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Status</label>  
                    <input type="text" name="status" value="<%= status%>" >
                </div>
                <div class="form-group">
                    <label for="SupP" class="col-sm-3 control-label">Status</label>  
                    <select name="gender" >
                        <option  value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option  value="Other">Other</option>
                    </select>
                </div>

                <input type="submit" value="UPDATE" name="btnUpdate">
            </form>

        </div>
    </body>
</html>
