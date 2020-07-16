<%-- 
    Document   : home
    Created on : Jul 6, 2020, 2:15:36 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Admin"%>
<%@page import="model.DAO.ImageDAO"%>
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


    </style>
    <%
        boolean isLogin;
        Admin ad = (Admin) session.getAttribute("checkLogin");
        if (ad != null) {
            isLogin = true;

        } else {
            isLogin = false;

        }

    %>
</head>

<body>
    <jsp:include page="../../header/header.jsp" ></jsp:include>


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
                        <a href="./auth/login.jsp?logout=1" title="Login" class="nav-link">
                            Logout
                        </a>
                    </li>
                </c:if>






            </ul>
        </div>
    </nav>

    <%            if (request.getParameter("id") != null) {
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
    <table border="1" cellpadding="0" cellspacing="0">
        <tr>

            <th>Trang thai san pham</th>
            <th> brand</th>
            <th>type</th>
            <th>nha san xuat </th>
            <th>ten</th>
            <th>Gia</th>
            <th>Mo ta</th>
            <th>Ngay nhap</th>
            <th>kich thuoc </th>
            <th>chat lieu</th>
            <th>Gioi tinh</th>
            <th></th>
            <th></th>


        </tr>
        <%
            ProductsDAO pDao = new ProductsDAO();
            ResultSet rs = pDao.getAll();
            ImageDAO iDao = new ImageDAO();
            while (rs.next()) {
                out.print("<tr>");

                out.print("<td>" + rs.getInt("status") + "</td>");
                out.print("<td>" + rs.getInt("brID") + "</td>");
                out.print("<td>" + rs.getInt("tID") + "</td>");
                out.print("<td>" + rs.getInt("supID") + "</td>");
                out.print("<td>" + rs.getString("pName") + "</td>");
                out.print("<td>" + rs.getInt("price") + "</td>");
                out.print("<td>" + rs.getString("describle") + "</td>");
                out.print("<td>" + rs.getDate("pDate") + "</td>");
                out.print("<td>" + rs.getInt("size") + "</td>");
                out.print("<td>" + rs.getString("material") + "</td>");
                out.print("<td>" + rs.getString("gender") + "</td>");
                ResultSet rsImg = iDao.getImage(rs.getInt("pID"));
                while (rsImg.next()) {
                    out.print("<td><a href='productDetail.jsp?pID=" + rs.getInt("pID") + "'>");

                    out.print("<img src='../../data/" + rsImg.getString(3) + "' height='100px' width='100px' />");
                    out.print("</a></td>");
                    break;
                }
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
