<%-- 
    Document   : signin
    Created on : Jul 5, 2020, 2:49:45 PM
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
        <form action="AccountController" method="POST">
            Name <input type="text" name="cName" required=""></br>
            User <input type="text" name="cUsername" required=""></br>
            Pass <input type="password" name="cPassword" required=""></br>
            RePass <input type="password" name="rePass" required=""></br>
            Phone <input type="text" name="cPhonenumber" required=""></br>
            Address <input type="text" name="address" required=""></br>
            Birthday <input type="date" name="birthday" required=""></br>
            Email <input type="text" name="email" required=""></br>
            Gender <select name="gender">
                <option value="0">Nam</option>
                <option value="1">Nữ</option>
                <option value="2">Khác</option>
            </select>
            </br>
            <input type="submit" value="SIGNIN" name="btnSignIn">
        </form>
        <a href="login.jsp">LOGIN</a>
    </body>
</html>
