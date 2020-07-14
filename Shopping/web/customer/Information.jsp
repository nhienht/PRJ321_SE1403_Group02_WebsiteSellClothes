<%-- 
    Document   : Information
    Created on : Jul 13, 2020, 3:44:23 PM
    Author     : Dat
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="model.entity.Customer"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>INFORMATION!</h1>
        <%
            Cookie[] cookies = request.getCookies();
            int id = 0;
            for (Cookie c : cookies) {
                if (c.getName().equals("idCustomer")) {
                    id = Integer.parseInt(c.getValue());
                }
            }
            out.print(id);
            CustomerDAO cDao = new CustomerDAO();
            Customer c = cDao.getCustomer(id);

        %>
        <form action="./../ChangeInforCustomer" method="POST">
            <table>


                <tr>
                    <td>Name</td>
                    <td><%= c.getcName()%></td>
                </tr>
                <tr>
                    <td>User name</td>
                    <td><%= c.getcUsername()%></td>
                </tr>
                <tr>
                    <td>Phone number</td>
                    <td><%= c.getPhonenumber()%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%= c.getAddress()%></td>
                </tr>
                <tr>
                    <td>Birthday</td>
                    <td><%= c.getBirthday()%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= c.getEmail()%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%= c.getGender()%></td>
                </tr>
                <tr>
                    <td> <a href="changeInfo.jsp">Change infor</a></td>
                    <td> <a href="changePassword.jsp">Change password</a></td>
                </tr>

            </table>
        </form>
        <sql:setDataSource var="conn"
                           driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/prj321"
                           user="root"
                           password=""
                           />
        <sql:query var="bill" dataSource="${conn}" sql="select * from bill where cID=?">
            <sql:param value="<%= id%>" />
        </sql:query>
        <table>
            <tr>
                <c:forEach var="name" items="${bill.columnNames}">
                    <c:out value="${name}"/>
                </c:forEach>
            </tr>
            <c:forEach var="b" items="${bill.rows}">
                <tr>
                    <td></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
