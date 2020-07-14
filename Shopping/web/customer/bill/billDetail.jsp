<%-- 
    Document   : billDetail
    Created on : Jul 14, 2020, 12:24:42 PM
    Author     : NhienHT
--%>

<%@page import="model.DAO.ImageDao"%>
<%@page import="java.awt.Image"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ImageDao iDao = new ImageDao();
            String path = iDao.getImage();
            out.print(path);
        %>
        
        <img src="../../<%= path %> " alt="Girl in a jacket" width="500" height="600">
   
    </body>
</html>
