<%-- 
    Document   : billDetail
    Created on : Jul 14, 2020, 12:21:08 PM
    Author     : NhienHT
--%>

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
                <th>tong tien</th>

                <%

                    BillDetailDAO bdDao = new BillDetailDAO();
                    System.out.println(request.getParameter("id"));
                    ResultSet rs = bdDao.getBillDetail(Integer.parseInt(request.getParameter("id")));
                    //out.print(request.getParameter("id"));
                    ProductsDAO pDao = new ProductsDAO();

                    while (rs.next()) {
                        
                        out.print(rs.getInt(1));
                        out.print(rs.getInt(2));
                        out.print(rs.getInt(3));
                        out.print(rs.getInt(4));

                    }
                %>
            </tr>
        </table>
    </body>
</html>
