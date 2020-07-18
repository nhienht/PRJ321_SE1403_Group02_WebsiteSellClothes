<%-- 
    Document   : products
    Created on : Jul 5, 2020, 9:22:47 AM
    Author     : HP
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
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

        <title>Clothing </title>
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
    </head>
    <%
        boolean isLogin = false;
        // Admin ad = (Admin) session.getAttribute("checkLogin");
//            if (ad != null) {
//                isLogin = true;
//
//            } else {
//                isLogin = false;
//
//            }
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie: cookies){
            if(cookie.getName().equals("idCustomer") && !cookie.getValue().equals("0")){
                isLogin = true;
            }
        }

    %>
    <body>

        <%@include file="../../header/header.jsp" %>

        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top" style="">

            <a class="navbar-branch" href="../../home.jsp">
                <img src="./images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                    <li class="nav-item">
                        <a href="./../../index.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="list.jsp" class="nav-link ">Products</a>

                    </li>
                    <li class="nav-item">
                        <a href="../../auth/about.jsp" class="nav-link">About us</a>
                    </li>
                    <li class="nav-item">
                        <a href="../../auth/contact.jsp" class="nav-link">Contact</a>
                    </li>

                    <c:if test = "${!isLogin}"> 
                        <li class="nav-item">

                            <a href="../../auth/signin.jsp" title="Login" class="nav-link" >
                                Sign In
                            </a>
                        </li>
                    </c:if>
                    <c:if test = "${isLogin}"> 
                        <li class="nav-item">
                            <a href="./auth/login.jsp?logout=1" title="Login" class="nav-link">
                                Logout
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <sql:setDataSource var="conn" scope="session"
                           url="jdbc:mysql://localhost/prj321"
                           user="root" password=""
                           driver="com.mysql.jdbc.Driver"/>
        <sql:query var="p" dataSource="${conn}">	
            SELECT * FROM products	
        </sql:query>	

        <sql:query dataSource="${conn}" var="i"	
                   sql="select * from image where pID=?">		
            <sql:param value="${row.pID}"/>	
        </sql:query>

        <div class="container-fluid padding">
            <div class="row text-center padding">   
                <c:forEach var="row" items="${p.rows}">	
                    <sql:query dataSource="${conn}" var="i"	
                               sql="select * from image where pID=?">	

                        <sql:param value="${row.pID}"/>	
                    </sql:query>	

                    <div class="col-xs-12 col-sm-6 col-md-3 boder bg-light">
                        <!--                             <img src="../../data/hihi.jpg" height="150px" width="150px" class="image" alt="Error"/>	-->

                        <c:forEach var="img" items="${i.rows}" begin="0" end="0">
                            <a href="productDetail.jsp">
                                <img src="../../data/${img.imageName}" height="150px" width="150px" class="image" alt="Error"/>	

                            </a>

                        </c:forEach>
                        <div >
                            <c:out value="${row.pName}"/>                     
                        </div>
                        <div>
                            Price:   <c:out value="${row.sellingPrice}" />
                        </div>
                        <div class="overlay">
                            <a href="./../../CartController?id=${row.pID}" class="btn btn-info btn-lg">
                                
                                <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
                            </a>
                        </div>
                    </div>  



                </c:forEach>
            </div>
        </div>

    </body>
</html>