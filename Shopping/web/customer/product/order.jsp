<%-- 
    Document   : order
    Created on : Jul 7, 2020, 1:54:23 PM
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
        <h1>Hello World!</h1>
        <form action="./../../OrderController" method="POST">
            Ten <input type="text" name="nameCustomer" > </br>
            Dia chi <input type="text" name="address"  ></br>
            SDT <input type="text" name="phone"  ></br>
            <textarea name="note">Ghi chu</textarea> </br>
            <input type="submit" value="Order" name="btnOrder">
        
        </form>
    </body>
</html>
