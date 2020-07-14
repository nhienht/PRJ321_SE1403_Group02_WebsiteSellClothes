<%-- 
    Document   : updateCustomer
    Created on : Jul 9, 2020, 11:12:50 PM
    Author     : Dat
--%>

<%@page import="java.util.Date"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page import="model.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
            <%
                int cID =0;
                String cUsername = "";
                String cPassword ="";
                String cName = "";
                String phonenumber = "";
                String address ="";
                Date date = null;
                String email = "";
                int status = 0;
                int gender = -1; 
                
                if(request.getParameter("id") != null){
                    cID = Integer.parseInt(request.getParameter("id"));
                    CustomerDAO cDao = new CustomerDAO();
                    Customer c = cDao.getCustomer(cID);
                    cUsername = c.getcName();
                    cPassword = c.getcPassword();
                    cName = c.getcName();
                    phonenumber = c.getPhonenumber();
                    address = c.getAddress();
                    date = c.getBirthday();
                    email = c.getEmail();
                    status = c.getStatus();
                    gender = c.getGender();
                    
                    
                }
                %>
               <form action="./../../CustomerController" method="POST">
            <input type="hidden" value="<%= cID%>" name="cID"/>
             <input type="hidden" value="<%= cPassword%>" name="cPassword"/>
            
            usser name <input type="text" name="cUsername" value="<%= cUsername%>" ></br>
            Name <input type="text" name="cName" value="<%= cName%>" ></br>
            Phone number <input type="text" name="phonenumber" value="<%= phonenumber%>" ></br>
            Address <input type="text" name="address" value="<%= address%>" ></br>
            sinh nhat <input type="date" name="birthday" value="<%= date%>" ></br>
            email <input type="text" name="email" value="<%= email%>" ></br>
            status <input type="text" name="status" value="<%= status%>" ></br>
            <select name="gender" >
                            <option  value="0">Nam</option>
                            <option value="1">Nữ</option>
                            <option  value="2">Khác</option>
                        </select>
           
            <input type="submit" value="UPDATE" name="btnUpdate">
        </form>
        </form>
    </body>
</html>
