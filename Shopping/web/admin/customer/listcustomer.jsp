<%-- 
    Document   : listcustomer
    Created on : Jul 9, 2020, 10:54:56 PM
    Author     : Dat
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <th>id customer</th>
            <th>user name</th>
            <th>name</th>
            <th>phone</th>
            <th>address</th>
            <th>birthday</th>
            <th>email</th>
            <th>Status</th>
            <th>gender</th>
                <%
                    CustomerDAO cDao = new CustomerDAO();
                    ResultSet rs = cDao.getAll();
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getInt(1) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("<td>" + rs.getString(4) + "</td>");
                        out.print("<td>" + rs.getString(5) + "</td>");
                        out.print("<td>" + rs.getString(6) + "</td>");
                        out.print("<td>" + rs.getDate(7) + "</td>");
                        out.print("<td>" + rs.getString(8) + "</td>");  
                         out.print("<td>" + rs.getString(9) + "</td>");  
                            out.print("<td>"+rs.getString(10)+"</td>");
                        //                            out.print("<td><a href='billDetail.jsp?id=" + rs.getInt("bID") + "'>Xem chi tiet hoa don</a></td>");
                        out.print("<td><a href='updateCustomer.jsp?id=" + rs.getInt("cID") + "'>Cap nhat</a></td>");
                        
                        out.print("</tr>");
                    }
                %>
        </table>
    </body>
</html>
