<%-- 
    Document   : updateBill
    Created on : Jul 14, 2020, 12:20:56 PM
    Author     : NhienHT
--%>

<%@page import="model.entity.Bill"%>
<%@page import="model.DAO.BillDAO"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int bID = 0;
            int cID = 0;
            String bStatus = "";
            String customerName = "";
            Date bDate = null;
            String address = "";
            String phone = "";
            String note = "";
            double total = 0;
            if (request.getParameter("id") != null) {
                bID = Integer.parseInt(request.getParameter("id"));
                BillDAO bDao = new BillDAO();
                Bill b = bDao.getBill(bID);
                cID = b.getcID();
                bStatus = b.getbStatus();
                customerName = b.getCustomerName();
                bDate = b.getDate();
                address = b.getAddress();
                phone = b.getPhone();
                note = b.getNote();
                total = b.getTotal();
            }
        %>
        <form action="./../../BillController" method="POST">
            <input type="hidden" value="<%= bID%>" name="bID"/>
            <input type="hidden" value="<%= cID%>" name="cID"/>

            Status <input type="text" name="bStatus" value="<%= bStatus%>" ></br>
            Người nhận <input type="text" name="customerName" value="<%= customerName%>" ></br>
            bill Date <input type="date" name="pDate" value="<%= bDate%>" ></br>
            Address <input type="text" name="address" value="<%= address%>" ></br>
            Phone <input type="text" name="phone" value="<%= phone%>" ></br>
            <textarea value="<%= note%>" name="note"> Note </textarea>
            
            Total <input type="text" name="total" value="<%= total%>" ></br>

            <input type="submit" value="UPDATE" name="btnUpdate">
        </form>
    </body>
</html>
