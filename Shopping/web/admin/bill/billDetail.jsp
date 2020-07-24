<%-- 
    Document   : billDetail
    Created on : Jul 14, 2020, 12:21:08 PM
    Author     : NhienHT
--%>

<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.entity.Bill"%>
<%@page import="model.DAO.BillDAO"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="model.DAO.BillDetailDAO"%>
<%@page import="java.sql.ResultSet"%>
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
                <th>No.</th>
                <th style="width: 200px">Name</th>
                <th>Image</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <%

                BillDetailDAO bdDao = new BillDetailDAO();
                ResultSet rs = bdDao.getBillDetail(Integer.parseInt(request.getParameter("id")));
                BillDAO bDao = new BillDAO();
                Bill b = bDao.getBill(Integer.parseInt(request.getParameter("id")));

                ProductsDAO pDao = new ProductsDAO();

                double total = 0;
                int i = 1;
                while (rs.next()) {
                    Products p = pDao.getProduct(rs.getInt(2));
                    ImageDAO iDao = new ImageDAO();
                    ResultSet rsImg = iDao.getImage(rs.getInt("pID"));

                    out.print("<tr>");
                    out.print("<td>" + i++ + "</td>");
                    out.print("<td>" + p.getpName() + "</td>");
                    out.print("<td>");
                    while (rsImg.next()) {
                        out.print("<img class='zoom' src='../../" + rsImg.getString("imageName") + "' height='200px' width='200px' />");
                        break;
                    }
                    out.print("</td>");
                    
                    out.print("<td>" + rs.getInt(3) + "</td>");
                    out.print("<td>" + rs.getInt(4) + "</td>");
                    out.print(" </tr>");
                }
            %>
        </table>
        <p>Total : <%= b.getTotal()%></p>
        <a href="listbill.jsp">BACK</a>
    </body>
</html>
