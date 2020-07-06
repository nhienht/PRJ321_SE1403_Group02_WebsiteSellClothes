<%-- 
    Document   : login
    Created on : Jul 5, 2020, 2:49:24 PM
    Author     : NhienHT
--%>

<%@page import="model.DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnLogin") != null) {
                CustomerDAO cDao = new CustomerDAO();
                boolean check = cDao.login(request.getParameter("user"), request.getParameter("pass"));
                if (check) {
                    response.sendRedirect("listproducts.jsp");
                } else {
                    out.print("<p>dang nhap that bai</p>");
                }
            }
        %>
        <form action="">         
            User <input type="text" name="user" required=""> </br>
            Password <input type="password" name="pass" required=""> </br> 
            <input type="submit" value="SEND" name="btnLogin">
        </form>
        <a href="signin.jsp">SIGN IN</a>
    </body>
</html>
