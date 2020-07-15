<%-- 
    Document   : img
    Created on : Jul 15, 2020, 10:05:00 AM
    Author     : NhienHT
--%>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ImageDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="conn" scope="session"
                           url="jdbc:mysql://localhost/prj321" 
                           user="root" password="" 
                           driver="com.mysql.jdbc.Driver"/>
        <sql:query var="image" dataSource="${conn}" sql=" select * from image where pID = 1"/>

        <c:forEach var="img" items="${image.rows}" >
            <img src="../../data/${img.imageName}"/>
            <c:out value="${img.imageName}"></c:out>
        </c:forEach>
    </body>
</html>
