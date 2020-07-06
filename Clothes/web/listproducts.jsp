<%-- 
    Document   : listproducts
    Created on : Jul 5, 2020, 9:50:45 AM
    Author     : NhienHT
--%>

<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <body>
        <%
            if (request.getParameter("id") != null) {
                int pId = Integer.parseInt(request.getParameter("id"));
                ProductsDAO pDao = new ProductsDAO();
                int kq = pDao.delete(pId);
                if (kq > 0) {
                    out.println("<script> alert('Xoa thanh cong');</script>");
                } else {
                    out.println("<script>alert('Xoa that bai');</script>");
                }
                out.println("<script>location.href='listproducts.jsp';</script>");
            }
        %>
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <th>id</th>
                <th>spId</th>
                <th>brID</th>
                <th>tID</th>
                <th>supId </th>
                <th>pName</th>
                <th>sellingPrice</th>
                <th>price</th>
                <th>describle</th>
                <th>pDate</th>
                <th>size </th>
                <th>material</th>
                <th></th>
                <th></th>


            </tr>
            <%
                ProductsDAO pDao = new ProductsDAO();
                ResultSet rs = pDao.getAll();
                while (rs.next()) {
                    out.print("<tr>");
                    out.print("<td>" + rs.getInt("pID") + "</td>");
                    out.print("<td>" + rs.getInt("spID") + "</td>");
                    out.print("<td>" + rs.getInt("brID") + "</td>");
                    out.print("<td>" + rs.getInt("tID") + "</td>");
                    out.print("<td>" + rs.getInt("supID") + "</td>");
                    out.print("<td>" + rs.getString("pName") + "</td>");
                    out.print("<td>" + rs.getInt("sellingPrice") + "</td>");
                    out.print("<td>" + rs.getInt("price") + "</td>");
                    out.print("<td>" + rs.getString("describle") + "</td>");
                    out.print("<td>" + rs.getDate("pDate") + "</td>");
                    out.print("<td>" + rs.getInt("size") + "</td>");
                    out.print("<td>" + rs.getString("material") + "</td>");
                    out.print("<td><a href='updateProduct.jsp?id=" + rs.getInt("pID") + "'>Update</a></td>");
                    out.print("<td><a href='?id=" + rs.getInt("pID") + "'>Delete</a></td>");

                    out.print("</tr>");
                }
            %>

        </table>
        <a href="insertProduct.jsp">Insert</a>

    </body>
</body>
</html>
