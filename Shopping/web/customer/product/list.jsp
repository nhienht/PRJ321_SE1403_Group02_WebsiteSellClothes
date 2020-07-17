<%-- 
    Document   : home
    Created on : Jul 6, 2020, 2:15:36 PM
    Author     : NhienHT
--%>

<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
        <!--        <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
        
                        <th>Trang thai san pham</th>
                        <th> brand</th>
                        <th>type</th>
                        <th>nha san xuat </th>
                        <th>ten</th>
                        <th>Gia</th>
                        <th>Mo ta</th>
                        <th>Ngay nhap</th>
                        <th>kich thuoc </th>
                        <th>chat lieu</th>
                        <th>Gioi tinh</th>
                        <th></th>
                        <th></th>
        
        
                    </tr>-->
        <%
//                ProductsDAO pDao = new ProductsDAO();
//                ResultSet rs = pDao.getAll();
//                ImageDAO iDao = new ImageDAO();
//                while (rs.next()) {
//                    out.print("<tr>");
//
//                    out.print("<td>" + rs.getInt("status") + "</td>");
//                    out.print("<td>" + rs.getInt("brID") + "</td>");
//                    out.print("<td>" + rs.getInt("tID") + "</td>");
//                    out.print("<td>" + rs.getInt("supID") + "</td>");
//                    out.print("<td>" + rs.getString("pName") + "</td>");
//                    out.print("<td>" + rs.getInt("price") + "</td>");
//                    out.print("<td>" + rs.getString("describle") + "</td>");
//                    out.print("<td>" + rs.getDate("pDate") + "</td>");
//                    out.print("<td>" + rs.getInt("size") + "</td>");
//                    out.print("<td>" + rs.getString("material") + "</td>");
//                    out.print("<td>" + rs.getString("gender") + "</td>");
//                    ResultSet rsImg = iDao.getImage(rs.getInt("pID"));
//                    while (rsImg.next()) {
//                       out.print("<td><a href='productDetail.jsp?pID="+rs.getInt("pID")+"'>");
//                     
//                        out.print("<img src='../../data/" + rsImg.getString(3) + "' height='100px' width='100px' />");
//                          out.print("</a></td>");
//                        break;
//                    }
//                    // out.print("<td><a href='cart.jsp?id=" + rs.getInt("pID") + "'>Them vao gio hang</a></td>");
//                    out.print("<td> <a href='./../../CartController?id=" + rs.getInt("pID") + "'>Buy</td>");
//                    out.print("</tr>");
//                }
        %>

        <!--</table>-->
        <%//            try {
//                Cookie[] cookies = request.getCookies();
//                out.print("<h1> a " + cookies.length + "</h1>");
//                if (cookies.length <= 1) {
//                    // out.print("Username: ");
//                    response.sendRedirect("../../auth/login.jsp");
//                }
//
//                //   String user = request.getCookies()[1].getValue();
//                //  out.print("Username: " + user);
//            } catch (Exception ex) {
//                response.sendRedirect("../../auth/login.jsp");
//            }
%>

        <sql:setDataSource var="conn" scope="session"
                           url="jdbc:mysql://localhost/prj321" 
                           user="root" password="" 
                           driver="com.mysql.jdbc.Driver"/>
        <sql:query var="p" dataSource="${conn}">
            SELECT * FROM products
        </sql:query>
        <table>
            <tr>
                <c:forEach var="columnName" items="${p.columnNames}">
                    <td><c:out value="${columnName}"/></td>
                </c:forEach>
                <td>Img</td>
                <td>Del</td>
                <td>Edit</td>
            </tr>
            <c:forEach var="row" items="${p.rows}">
                <sql:query dataSource="${conn}" var="i"
                           sql="select * from image where pID=?">
                    <%--<sql:query var="i" dataSource="${conn}">--%>
                    <!--select * from image where pID = ?-->
                    <sql:param value="${row.pID}"/>
                </sql:query>
                <tr>

                    <td>${row.pID}</td>
                    <td>${row.status}</td>
                    <td>${row.brID}</td>
                    <td>${row.tID}</td>

                    <td>${row.supID}</td>
                    <td>${row.pName}</td>
                    <td>${row.sellingPrice}</td>
                    <td>${row.price}</td>
                    <td>${row.describle}</td>
                    <td>${row.pDate}</td>
                    <td>${row.size}</td>
                    <td>${row.material}</td>
                    <td>${row.quantity}</td>
                    <td>${row.discount}</td>
                    <td>${row.gender}</td>
                    <td>
                        <c:forEach var="img" items="${i.rows}" begin="1" end="1">
                            <img src="../../data/${img.imageName}" height="100px" width="100px" alt="Error"/>
                        </c:forEach>
                    </td>


                </tr>
            </c:forEach>
        </table>       
        <a href="../../auth/login.jsp?logout=1">logout</a>

    </body>
</body>
</html>
