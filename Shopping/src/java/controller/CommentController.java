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
import model.DAO.CommentDAO;
import model.entity.Comment;
import model.entity.Customer;

/**
 *
 * @author NhienHT
 */
@WebServlet(name = "CommentController", urlPatterns = {"/CommentController"})
public class CommentController extends HttpServlet {

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
            int cmtID = Integer.parseInt(request.getParameter("cmtID"));
 int pID = Integer.parseInt(request.getParameter("pID"));
            CommentDAO cDao = new CommentDAO();
           cDao.delete(cmtID);
           response.sendRedirect("./customer/product/productDetail.jsp?pID="+ pID);
           
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
        Cookie[] cookies = request.getCookies();
        int id = 0;
        boolean check = false;
        for (Cookie c : cookies) {
            if (c.getName().equals("user")) {
                check = true;
            } else if (c.getName().equals("idCustomer")) {
                id = Integer.parseInt(c.getValue());
            }
        }
        String pID = request.getParameter("pID");
        //System.out.println(request.getParameter("pID"));
        String message = request.getParameter("message");
        if (check) {
            Comment c = new Comment();
            c.setcID(id);

            c.setpID(Integer.parseInt(pID));
            c.setCmtMessage(message);
            CommentDAO cDao = new CommentDAO();
            check = cDao.insert(c);
            response.sendRedirect("./customer/product/productDetail.jsp?pID=" + pID);

        } else {
            String url = "./auth/login.jsp?returnURL=/Shopping/customer/product/productDetail.jsp?pID=" + pID;

            response.sendRedirect(url);
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
