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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        <title>Change Information</title>
    </head>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgba(255, 1, 1, 0.1)
        }

        .card {
            border: none;
            border-radius: 0;
            width: 420px !important;
            margin: 0 auto
        }

        .signup {
            display: flex;
            flex-flow: column;
            justify-content: center;
            padding: 10px 50px
        }

        a {
            text-decoration: none !important
        }

        h5 {
            color: #ff0147;
            margin-bottom: 3px;
            font-weight: bold
        }

        small {
            color: rgba(0, 0, 0, 0.3)
        }

        input {
            width: 100%;
            display: block;
            margin-bottom: 7px
        }

        .form-control {
            border: 1px solid #dc354575;
            border-radius: 30px;
            background-color: rgba(0, 0, 0, .075);
            letter-spacing: 1px
        }

        .form-control:focus {
            border: 0.5px solid #dc354575;
            border-radius: 30px;
            box-shadow: none;
            background-color: rgba(0, 0, 0, .075);
            color: #000;
            letter-spacing: 1px
        }

        .btn {
            display: block;
            width: 100%;
            border-radius: 30px;
            border: none;
            background: linear-gradient(to right, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%);
            background: -webkit-linear-gradient(left, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%)
        }

        .text-left {
            color: rgba(0, 0, 0, 0.3);
            font-weight: 400
        }

        .text-right {
            color: #ff0147;
            font-weight: bold
        }

        span.text-center {
            color: rgba(0, 0, 0, 0.3)
        }

        .fab {
            padding: 15px;
            font-size: 23px
        }

        .fa-facebook {
            color: #71dd8a;
        }

        .fa-twitter {
            color: #71dd8a;
        }

        .fa-linkedin {
            color: #18b1c0;
        }
    </style>
    <body>

        <%
            Cookie[] cookies = request.getCookies();
            int id = 0;
            for (Cookie c : cookies) {
                if (c.getName().equals("idCustomer")) {
                    id = Integer.parseInt(c.getValue());
                }
            }
           
            CustomerDAO cDao = new CustomerDAO();
            Customer c = cDao.getCustomer(id);

        %>


        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto py-4 px-0">
                    <div class="card p-0">
                        <div class="card-title text-center">
                            <h5 class="mt-5">CHANGE PASSWORD</h5> <small class="para">Please fill in the form</small>
                        </div>
                        <form action="./../ChangeInforCustomer" method="POST">

                            <input type="hidden" name="txtID" value="<%= c.getcID()%>">
                            <input type="hidden" name="txtPassword" value="<%= c.getcPassword()%>">
                            <input type="hidden" name="txtStatus" value="<%= c.getStatus()%>">

                            <div class="form-group">
                                <div>Name</div>
                                <input type="text"  name="txtName" value="<%= c.getcName()%>">
                            </div>

                            <div class="form-group">
                                <div>User Name</div>
                                <input type="text" name="txtUser" value="<%= c.getcUsername()%>">
                            </div>


                            <div class="form-group">
                                <div>User Name</div>
                                <input type="text" name="txtPhone" value="<%= c.getPhonenumber()%>">
                            </div>


                            <div class="form-group">
                                <div>Address</div>
                                <input type="text" name="txtAddress" value="<%= c.getAddress()%>">
                            </div>


                            <div class="form-group">
                                <div>Birthday</div>
                                <input type="date" name="txtBirthday" value="<%= c.getBirthday()%>">
                            </div>
                            <div class="form-group">
                                <div>Email</div>
                                <input type="email" name="txtEmail" value="<%= c.getEmail()%>">
                            </div>


                            <div class="form-group">
                                <div>Gender</div>
                                <select name="txtGender" value="<%=c.getGender()%>" >
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>

                            </div>

                            <input class="btn btn-primary" type="submit" name="btnChange" value="Update">



                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
