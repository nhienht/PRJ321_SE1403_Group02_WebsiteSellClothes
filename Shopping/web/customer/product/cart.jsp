<%-- 
    Document   : cart
    Created on : Jul 6, 2020, 2:21:16 PM
    Author     : NhienHT
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>Ma sp</th>
                <th>Ten san pham</th>
                <th>So luong</th>
                <th>Don gia</th>

            </tr>

            <%
                ProductsDAO pDao = new ProductsDAO();

                int total = 0;

                Enumeration<String> pName = session.getAttributeNames();

                while (pName.hasMoreElements()) {

                    String id = pName.nextElement();

                    Products p = pDao.getProduct(Integer.parseInt(id));

                    total += p.getPrice() * Integer.parseInt(session.getAttribute(id).toString());
                    out.print("<tr>");
                    out.print("<td>" + id + "</td>");
                    out.print("<td>" + p.getpName() + "</td>");
                    out.print("<td>" + session.getAttribute(id) + "</td>");
                    out.print("<td>" + p.getPrice() + "</td>");

                    out.print("</tr>");
                }
                out.print("<tr><td colspan='3'>Tong tien</td><td>" + total + "</td></tr>");

                getServletContext().setAttribute("total", total);


            %>
        </table>
        <a href="list.jsp">Mua tiep</a>
        <a href="order.jsp">Thanh toan</a>

    </body>
</html>
