<%-- 
    Document   : changeInfo
    Created on : Jul 13, 2020, 2:42:08 PM
    Author     : NhienHT
--%>

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
        <h1>Change infor</h1>
        <%
            Cookie[] cookies = request.getCookies();
            int id = 0;
            for(Cookie c: cookies){
                if(c.getName().equals("idCustomer")){
                    id = Integer.parseInt(c.getValue());
                }
            }
            out.print(id);
            CustomerDAO cDao = new CustomerDAO();
            Customer c = cDao.getCustomer(id);
            
            %>
            <form action="./../ChangeInforCustomer" method="POST">
                <table>
                    <input type="hidden" name="txtID" value="<%= c.getcID()%>">
                    <input type="hidden" name="txtPassword" value="<%= c.getcPassword() %>">
                    <input type="hidden" name="txtStatus" value="<%= c.getStatus() %>">
                    <tr>
                        <td>Name</td>
                        <td><input type="text"  name="txtName" value="<%= c.getcName()%>"</td>
                    </tr>
                    <tr>
                        <td>User name</td>
                        <td><input type="text" name="txtUser" value="<%= c.getcUsername()%>"</td>
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td><input type="text" name="txtPhone" value="<%= c.getPhonenumber()%>"</td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="txtAddress" value="<%= c.getAddress() %>"</td>
                    </tr>
                    <tr>
                        <td>Birthday</td>
                        <td><input type="date" name="txtBirthday" value="<%= c.getBirthday() %>"</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="txtEmail" value="<%= c.getEmail()%>"</td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td> <select name="txtGender" value="<%=c.getGender() %>" >
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <input type="submit" name="btnChange" value="Update"></td>
                    </tr>
                    
                </table>
            </form>
    </body>
</html>
