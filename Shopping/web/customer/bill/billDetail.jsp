<%-- 
    Document   : billDetail
    Created on : Jul 14, 2020, 12:24:42 PM
    Author     : NhienHT
--%>

<%@page import="java.awt.Image"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                
        <form action="../../ImageController">
              <input  type="file"class="form-control" autofocus="" required=" " name="img" multiple >
               <input type="submit" value="INSERT">
        </form>
        
   
    </body>
</html>
