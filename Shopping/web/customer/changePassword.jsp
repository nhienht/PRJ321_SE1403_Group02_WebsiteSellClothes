<%-- 
    Document   : changePassword
    Created on : Jul 13, 2020, 2:41:57 PM
    Author     : Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="./../ChangeInforCustomer" method="POST">
            <table>
                <tr>
                    <td>Old pass</td>
                    <td><input type="text" name="Oldpass" required=""></td>
                </tr>
                <tr>
                    <td>New pass</td>
                    <td><input type="text" name="newPass" required=""></td>
                </tr>
                <tr>
                    <td>Cofirm pass</td>
                    <td><input type="text" name="Cofirmpass" required=""></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Change Password" name="btnChangePass"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
