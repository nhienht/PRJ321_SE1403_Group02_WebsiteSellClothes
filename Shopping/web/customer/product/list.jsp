<%-- 
    Document   : home
    Created on : Jul 6, 2020, 2:15:36 PM
    Author     : NhienHT
--%>

<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    </head>
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
 
      .main-font
      {
          background-color: #F5A9BC;
          padding-left: 25px;
          text-align: center;
          padding-right:  25px;
          
      }
      .main-font:hover
      {
           background-color: #F5A9BC;
      }
      .btn-group{
          padding-left: 50px;
          padding-top: 50px;
      }
      .collection{
          color:  #f1f1f1;
          font-size:  25px;
      }
      span{
           font-size:  25px;
      }
     


    </style>

    <body>
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
                        <a href="./product/listproducts.jsp" class="nav-link ">Products</a>

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
                            <a href="./auth/login.jsp?logout=1" title="Login" class="nav-link">
                                Logout
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./images/Capture.PNG" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./images/pic3.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./images/pic22.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <%--
        Dung tim kiem
        --%>

        <div class="block-filter onshop-block-filter-1" class="row">
            <div class="filter-left">
                <div class="btn-group">
                    <a class="btn btn-primary dropdown-toggle main-font" data-toggle="dropdown" href="#">
                        <span class="text">Bộ sưu tập</span>
                    
                    </a>
                    <ul class="dropdown-menu main-font collection">
                        <li><a href="https://clothes.onshop.asia/san-pham">Tất cả</a></li>
                        <li><a href="https://clothes.onshop.asia/san-pham/d-col-san-pham-khuyen-mai">Sản phẩm khuyến mại</a></li>
                        <li><a href="https://clothes.onshop.asia/san-pham/d-col-san-pham-hot">Sản phẩm hot</a></li>
                        <li><a href="https://clothes.onshop.asia/san-pham/d-col-san-pham-moi">Sản phẩm mới</a></li>
                        <li><a href="https://clothes.onshop.asia/san-pham/d-col-hang-ngay">Hàng ngày</a></li>
                    </ul>
                </div>
                <div class="btn-group">
                    <a class="btn btn-primary dropdown-toggle main-font" data-toggle="dropdown" href="#">
                        <span class="text">Loại sản phẩm</span>

                    </a>
                    <ul class="dropdown-menu main-font">
                        <li><a href="https://clothes.onshop.asia/san-pham">Tất cả</a></li>
                        <div id="category-filter">
                            <div class="menu-side menu-product" id="menu-product" style="-webkit-overflow-scrolling: touch;">
                                <ul class="sub-menu">
                                    <li class="nav-item sub-menu-1 ">
                                        <a class="a-normal" title="Dép sandal"
                                           href="https://clothes.onshop.asia/san-pham/d-cat-dep-sandal">Dép sandal</a>
                                        <ul class="sub-menu sub-menu-2">
                                        </ul>
                                    </li>
                                    <li class="nav-item sub-menu-1 ">
                                        <a class="a-normal" title="Giày cao gót"
                                           href="https://clothes.onshop.asia/san-pham/d-cat-giay-cao-got">Giày cao gót</a>
                                        <ul class="sub-menu sub-menu-2">
                                        </ul>
                                    </li>
                                    <li class="nav-item sub-menu-1 ">
                                        <a class="a-normal" title="Giày cổ điển"
                                           href="https://clothes.onshop.asia/san-pham/d-cat-giay-co-dien">Giày cổ điển</a>
                                        <ul class="sub-menu sub-menu-2">
                                        </ul>
                                    </li>
                                    <li class="nav-item sub-menu-1 ">
                                        <a class="a-normal" title="Giày đúp" href="https://clothes.onshop.asia/san-pham/d-cat-giay-dup">Giày
                                            đúp</a>
                                        <ul class="sub-menu sub-menu-2">
                                        </ul>
                                    </li>
                                    <li class="nav-item sub-menu-1 ">
                                        <a class="a-normal" title="Giày sandal"
                                           href="https://clothes.onshop.asia/san-pham/d-cat-giay-sandal">Giày sandal</a>
                                        <ul class="sub-menu sub-menu-2">
                                        </ul>
                                    </li>
                                    <li class="nav-item sub-menu-1 ">
                                        <a class="a-normal" title="Giày valen"
                                           href="https://clothes.onshop.asia/san-pham/d-cat-giay-valen">Giày valen</a>
                                        <ul class="sub-menu sub-menu-2">
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>


                    </ul>
                </div>
                <div class="btn-group">
                    <a class="btn btn-primary dropdown-toggle main-font" data-toggle="dropdown" href="#">
                        <span class="text">Nhà cung cấp</span>

                    </a>
                    <ul class="dropdown-menu main-font manufacturer">
                        <li><a href="https://clothes.onshop.asia/san-pham">Tất cả</a></li>
                    </ul>
                </div>
                <div class="btn-group">
                    <a class="btn btn-primary dropdown-toggle main-font" data-toggle="dropdown" href="#">
                        <span class="text">Giá sản phẩm</span>

                    </a>
                    <ul class="dropdown-menu main-font">
                        <div class="change-price">
                            <p>Vui lòng chọn khoảng giá</p>
                            <div id="slider-range" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                                <div class="ui-slider-range ui-corner-all ui-widget-header" style="width: 100%; left: 0%;"></div><span
                                    tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span><span
                                    tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>
                            </div>
                            <div class="range-slider">
                                <label for="amount">Từ </label>
                                <input type="text" id="amount" readonly="">
                            </div>
                        </div>
                    </ul>
                </div>
                <div class="btn-group">
                    <a class="btn btn-primary dropdown-toggle main-font" data-toggle="dropdown" href="#" aria-expanded="false">
                        <span class="text">TAGS</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">

                        </svg>
                    </a>
                    <ul class="dropdown-menu main-font manufacturer" x-placement="bottom-start"
                        style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 31px, 0px);">
                        <li><a href="https://clothes.onshop.asia/san-pham">Tất cả</a></li>
                    </ul>
                </div>
            </div>
            <div class="filter-right main-font">

            </div>
        </div>

        <%-- End--%>
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>

                <th>Trang thai san pham</th>
                <th>Brand</th>
                <th>Type</th>
                <th>nha san xuat </th>
                <th>Name</th>
                <th>Price</th>
                <th>Describe</th>
                <th>Date import</th>
                <th>Size </th>
                <th>Type</th>
                <th>Sex</th>
                <th></th>
                <th></th>


            </tr>
            <%
                ProductsDAO pDao = new ProductsDAO();
                ResultSet rs = pDao.getAll();
                while (rs.next()) {
                    out.print("<tr>");

                    // out.print("<td>" + rs.getInt("status") + "</td>");
                    out.print("<td>" + rs.getInt("brID") + "</td>");
                    out.print("<td>" + rs.getInt("tID") + "</td>");
                    out.print("<td>" + rs.getInt("supID") + "</td>");
                    out.print("<td>" + rs.getString("pName") + "</td>");
                    out.print("<td>" + rs.getInt("price") + "</td>");
                    out.print("<td>" + rs.getString("describle") + "</td>");
                    out.print("<td>" + rs.getDate("pDate") + "</td>");
                    out.print("<td>" + rs.getInt("size") + "</td>");
                    out.print("<td>" + rs.getString("material") + "</td>");
                    //  out.print("<td>" + rs.getString("gender") + "</td>");
                    // out.print("<td><a href='cart.jsp?id=" + rs.getInt("pID") + "'>Them vao gio hang</a></td>");
                    out.print("<td> <a href='./../../CartController?id=" + rs.getInt("pID") + "'>Buy</td>");
                    out.print("</tr>");
                }
            %>

        </table>
        <%
            try {
                Cookie[] cookies = request.getCookies();
                out.print("<h1> a " + cookies.length + "</h1>");
                if (cookies.length <= 1) {
                    // out.print("Username: ");
                    response.sendRedirect("../../auth/login.jsp");
                }

                //   String user = request.getCookies()[1].getValue();
                //  out.print("Username: " + user);
            } catch (Exception ex) {
                response.sendRedirect("../../auth/login.jsp");
            }

        %>
        <a href="../../auth/login.jsp?logout=1">logout</a>

    </body>

</html>
