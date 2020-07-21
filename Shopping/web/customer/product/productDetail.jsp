<%-- 
    Document   : productDetail
    Created on : Jul 15, 2020, 5:29:00 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style> @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
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
    <body>
        <nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

            <a class="navbar-branch" href="index.jsp">
                <img src="./images/logo.jpg" height="80px" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto" style="padding-left: 600px">
                    <li class="nav-item">
                        <a href="./index.jsp" class="nav-link ">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="./customer/product/list.jsp" class="nav-link ">Products</a>

                    </li>
                    <li class="nav-item">
                        <a href="./auth/about.jsp" class="nav-link">About us</a>
                    </li>
                    <li class="nav-item">
                        <a href="./auth/contact.jsp" class="nav-link">Contact</a>
                    </li>

                    <c:if test = "${!isLogin}"> 
                        <li class="nav-item">

                            <a href="./auth/signin.jsp" title="Login" class="nav-link" >
                                Sign In
                            </a>
                        </li>
                    </c:if>
                    <c:if test = "${isLogin}"> 
                        <li class="nav-item">
                            <a href="LogoutController"  title="Login" class="nav-link">
                                Logout
                            </a>                       
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>

        <%
            int pID = Integer.parseInt(request.getParameter("pID"));
            ProductsDAO pDao = new ProductsDAO();
            Products p = pDao.getProduct(pID);
            int quantity = p.getQuantity();
        %>
        <sql:setDataSource var="conn" scope="session"
                           url="jdbc:mysql://localhost/prj321" 
                           user="root" password="" 
                           driver="com.mysql.jdbc.Driver"/>

        <sql:query var="images" dataSource="${conn}">
            SELECT * FROM image where pID=?
            <sql:param value="${param.pID}"/>
        </sql:query>   
        <main class="">
            <div class="container dark-grey-text ">
                <div class="row wow fadeIn">
                    <div class="col-md-6 mb-4">
                        <c:forEach var="img" items="${images.rows}" begin="0" end="0">
                            <img src="../../${img.imageName}" class="img-fluid img-thumbnail" alt=""/>
                        </c:forEach>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="p-4">
                            <div class="mb-3">
                                <a href="">
                                    <span class="badge purple mr-1"><%= p.gettID()%></span>
                                </a>
                                <p>Status</p>
                                <c:if test="${param.quantity > 0}">
                                    <span class="badge blue mr-1"> Còn hàng</span>     
                                </c:if>
                                <c:if test="${param.quantity==0}">
                                    <span class="badge blue mr-1"> Hết hàng</span>     
                                </c:if>
                            </div>
                            <p>
                                <span> Brand   <%= p.getBrID()%> </span>  
                                <span>- Supplier   <%= p.getSupID()%> </span>        
                            </p>
                            <p class="lead">
                                <span>Price: <%= p.getPrice()%></span> 
                            </p>
                            <p>
                                <span>Discount:  <%= p.getDiscount()%>% </span>                              
                            </p>
                            <p>
                                <span>Gender:   <%= p.getGender()%> </span>                              
                            </p>
                            <p>
                                <span>Size:   <%= p.getSize()%> </span>    
                                <span>- Quantity:   <%= p.getQuantity()%> </span>      
                            </p>                          
                            <p class="lead font-weight-bold"><%= p.getpName()%></p>
                            <form class="d-flex justify-content-left" action="../../CartController"> 
                                <input type="hidden" value="${param.pID}" name="id"/>
                                <input type="number" value="1" aria-label="Search" class="form-control" name="quantity" style="width: 100px">
                                <button class="btn btn-primary btn-md my-0 p" type="submit">Add to cart
                                </button>

                            </form>

                        </div>
                    </div>
                </div>           
                <hr>
                <div class="row d-flex justify-content-center wow fadeIn">
                    <div class="col-md-6 text-center">
                        <h4 class="my-4 h4">Describle</h4>
                        <p><%= p.getDescrible()%> </p>
                    </div>
                </div>
                <div class="contact-form">
                    <div class="row ">
                        <div class="col-lg-4 col-sm-12">

                            <c:forEach var="img" items="${images.rows}">
                                <img src="../../${img.imageName}" class="image"  height="250px" width="250px"  alt=""/>
                            </c:forEach>    
                        </div>                     
                    </div>

                </div>
            </div>
        </main>
    </body>
</html>
