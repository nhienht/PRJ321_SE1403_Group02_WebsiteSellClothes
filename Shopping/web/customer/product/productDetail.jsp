<%-- 
    Document   : productDetail
    Created on : Jul 15, 2020, 5:29:00 PM
    Author     : NhienHT
--%>

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
        
    </head>
    <body>
        <sql:setDataSource var="conn" scope="session"
                           url="jdbc:mysql://localhost/prj321" 
                           user="root" password="" 
                           driver="com.mysql.jdbc.Driver"/>
        <sql:query var="products" dataSource="${conn}">
            SELECT * FROM products where pID=1
        </sql:query>
        <sql:query var="images" dataSource="${conn}">
            SELECT * FROM image where pID=1
        </sql:query>   

        <c:forEach var="img" items="${images.rows}" begin="1" end="1">
            <img src="../../data/${img.imageName}" height="500px" width="500px"/>
        </c:forEach>
        <c:forEach var="img" items="${images.rows}">
            <img src="../../data/${img.imageName}" height="100px" width="100px"/>
        </c:forEach>                
    </body>
</html>
