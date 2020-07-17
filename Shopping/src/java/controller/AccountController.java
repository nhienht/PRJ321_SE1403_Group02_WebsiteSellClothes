/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.AdminDAO;
import model.DAO.CustomerDAO;
import model.entity.Customer;

/**
 *
 * @author Dat
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        Customer c = new Customer();
        CustomerDAO cDao = new CustomerDAO();
        if (request.getParameter("btnSignIn") != null) {
            c.setcPassword(request.getParameter("cPassword"));
            c.setcUsername(request.getParameter("cUsername"));
            c.setcName(request.getParameter("cName"));
            c.setPhonenumber(request.getParameter("cPhonenumber"));
            c.setAddress(request.getParameter("address"));
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            c.setBirthday(birthday);
            c.setEmail(request.getParameter("email"));
            c.setStatus(1);
            c.setGender(request.getParameter("gender"));
            cDao.insert(c);
            HttpSession session = request.getSession();
            session.setAttribute("checkLogin", true);
            response.sendRedirect("./index.jsp");

        } else if (request.getParameter("btnLogin") != null) {
            // CustomerDAO cDao = new CustomerDAO();
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            int id = cDao.login(user, pass);
            if (id != -1) {
               Cookie userCookie = new Cookie("user", user);
                Cookie passCookie = new Cookie("pass", pass);
                Cookie idCookie = new Cookie("idCustomer", String.valueOf(id));

                userCookie.setMaxAge(60 * 60 * 24);
                passCookie.setMaxAge(60 * 60 * 24);
                idCookie.setMaxAge(60 * 60 * 24);

                response.addCookie(userCookie);
                response.addCookie(passCookie);
                response.addCookie(idCookie);
//                HttpSession session= request.getSession();
// session.setAttribute("checkLogin", true);
                response.sendRedirect("home.jsp");
            } else {
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('User or password incorrect');");
//                out.println("location='login.jsp';");
//                out.println("</script>");
                response.sendRedirect("./auth/login.jsp");

            }
        } else if (request.getParameter("adminLogin") != null) {
            AdminDAO aDao = new AdminDAO();
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");

            boolean check = aDao.login(user, pass);
            if (check) {
//                 Cookie userCookie = new Cookie("user", user);
//                Cookie passCookie = new Cookie("pass", pass);
//
//                userCookie.setMaxAge(60 * 60 * 24);
//                passCookie.setMaxAge(60 * 60 * 24);
//
//                response.addCookie(userCookie);
//                response.addCookie(passCookie);
                response.sendRedirect("./admin/product/listproducts.jsp");
                out.print("<script> alert('Login successful');</script>");
            } else {
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('User or password incorrect');");
//                out.println("location='login.jsp';");
//                out.println("</script>");
                response.sendRedirect("./auth/login.jsp");

            }

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
