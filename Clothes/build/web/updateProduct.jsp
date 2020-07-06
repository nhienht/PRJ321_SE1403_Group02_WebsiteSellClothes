<%-- 
    Document   : updateProduct
    Created on : Jul 5, 2020, 11:35:02 AM
    Author     : NhienHT
--%>


<%@page import="java.util.Date"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.DAOProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = 0, spID = 0, brID = 0, tID = 0, supID = 0, size = 0;
            String pName = "", description = "", material = "";
            Double sellingPrice = 0.0, price = 0.0;
            Date pDate = null;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
                DAOProducts pDao = new DAOProducts();
                Products p = pDao.getProduct(id);
                spID = p.getSpID();
                brID = p.getBrID();
                tID = p.gettID();
                supID = p.getSupID();
                pName = p.getpName();
                sellingPrice = p.getSellingPrice();
                price = p.getPrice();
                description = p.getDescrible();
                size = p.getSize();
                pDate = p.getpDate();
                material = p.getMaterial();
            }
        %>
        <form action="AdminController" method="POST">
            <input type="hidden" value="<%= id %>" name="pID"/>
            Status product id <input type="text" name="spID" value="<%= spID%>"> </br>
            Brand product id <input type="text" name="brID" value="<%= brID%>" ></br>
            Type product id <input type="text" name="tID" value="<%= tID%>" ></br>
            Sup product id <input type="text" name="supID" value="<%= supID%>" ></br>
            Name product <input type="text" name="pName" value="<%= pName%>" ></br>
            Selling Price <input type="text" name="sellingPrice" value="<%= sellingPrice%>" ></br>
            Price <input type="text" name="price" value="<%= price%>" ></br>
            Description  <input type="text" name="describle" value="<%= description%>" ></br>
            Date <input type="date" name="pDate" value="<%= pDate%>" ></br>
            Size product <input type="text" name="size" value="<%= size%>" ></br>
            Material <input type="text" name="material" value="<%= material%>" ></br>
            <input type="submit" value="UPDATE" name="btnUpdate">
        </form>
    </body>
</html>
