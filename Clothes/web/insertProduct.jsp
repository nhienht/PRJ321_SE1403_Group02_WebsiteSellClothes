<%-- 
    Document   : insertProduct.jsp
    Created on : Jul 5, 2020, 10:18:24 AM
    Author     : NhienHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AdminController" method="POST">
            Status product id <input type="text" name="spID"> </br>
            Brand product id <input type="text" name="brID"></br>
            Type product id <input type="text" name="tID"></br>
            Sup product id <input type="text" name="supID"></br>
            Name product <input type="text" name="pName"></br>
            Selling Price <input type="text" name="sellingPrice"></br>
            Price <input type="text" name="price"></br>
            Description  <input type="text" name="describle"></br>
            Date <input type="date" name="pDate"></br>
            Size product <input type="text" name="size"></br>
            Material <input type="text" name="material"></br>
            <input type="submit" value="INSERT">
        </form>
    </body>
</html>
