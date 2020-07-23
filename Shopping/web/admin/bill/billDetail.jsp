<%-- 
    Document   : billDetail
    Created on : Jul 14, 2020, 12:21:08 PM
    Author     : NhienHT
--%>

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

                <th>ten san pham</th>
                <th>so luong mua</th>
                <th>gia</th>
            </tr>
                <%

                    BillDetailDAO bdDao = new BillDetailDAO();
                    ResultSet rs = bdDao.getBillDetail(Integer.parseInt(request.getParameter("id")));
                    BillDAO bDao = new BillDAO();
                    Bill b = bDao.getBill(Integer.parseInt(request.getParameter("id")));
                    
                    ProductsDAO pDao = new ProductsDAO();
                    
                    double total = 0;
                    
                    while (rs.next()) {
                      Products p = pDao.getProduct(rs.getInt(2));
                     out.print("<tr>");
                     out.print("<td>"+p.getpName()+"</td>");
                     out.print("<td>"+rs.getInt(3)+"</td>");
                     out.print("<td>"+rs.getInt(4)+"</td>");
                     out.print(" </tr>");                    
                    }
                %>
        </table>
        <p>Total : <%= b.getTotal() %></p>
        <a href="listbill.jsp">BACK</a>
    </body>
</html>
