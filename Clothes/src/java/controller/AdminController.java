/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.ProductsDAO;
import model.entity.Products;

/**
 *
 * @author NhienHT
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

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
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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
        //  processRequest(request, response);
        Products p = new Products();
        p.setSpID(Integer.parseInt(request.getParameter("spID")));
        p.setBrID(Integer.parseInt(request.getParameter("brID")));
        p.settID(Integer.parseInt(request.getParameter("tID")));
        p.setSupID(Integer.parseInt(request.getParameter("supID")));
        p.setpName(request.getParameter("pName"));
        p.setSellingPrice(Double.parseDouble(request.getParameter("sellingPrice")));
        p.setPrice(Double.parseDouble(request.getParameter("price")));
        p.setDescrible(request.getParameter("describle"));
        Date pDate = Date.valueOf(request.getParameter("pDate"));
        p.setpDate(pDate);
        //  p.setpDate(Date.from(Instant.now()));
        p.setSize(Integer.parseInt(request.getParameter("size")));
        p.setMaterial(request.getParameter("material"));

        ProductsDAO pDao = new ProductsDAO();
        if (request.getParameter("btnUpdate") != null) {
            int pID = Integer.parseInt(request.getParameter("pID"));
            p.setpID(pID);
            pDao.update(p);

        } else {
            pDao.insert(p);
        }
        response.sendRedirect("listproducts.jsp");

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
