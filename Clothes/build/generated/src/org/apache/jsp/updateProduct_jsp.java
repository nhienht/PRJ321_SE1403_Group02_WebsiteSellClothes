package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import model.entity.Products;
import model.DAO.DAOProducts;

public final class updateProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            int id = 0, spID = 0, brID = 0, tID = 0, supID = 0, size = 0;
            String pName = "", description = "", material = "";
            Double sellingPrice = 0.0, price = 0.0;
            Date pDate = null;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
                DAOProducts pDao = new DAOProducts();
                Products p = pDao.getProduct(id);
                spID = p.getSpID();
                brID = p.getBrID();
                tID = p.gettID();
                supID = p.getSupID();
                pName = p.getpName();
                sellingPrice = p.getSellingPrice();
                price = p.getPrice();
                description = p.getDescrible();
                size = p.getSize();
                pDate = p.getpDate();
                material = p.getMaterial();
            }
        
      out.write("\n");
      out.write("        <form action=\"AdminController\" method=\"POST\">\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.print( id );
      out.write("\" name=\"pID\"/>\n");
      out.write("            Status product id <input type=\"text\" name=\"spID\" value=\"");
      out.print( spID);
      out.write("\"> </br>\n");
      out.write("            Brand product id <input type=\"text\" name=\"brID\" value=\"");
      out.print( brID);
      out.write("\" ></br>\n");
      out.write("            Type product id <input type=\"text\" name=\"tID\" value=\"");
      out.print( tID);
      out.write("\" ></br>\n");
      out.write("            Sup product id <input type=\"text\" name=\"supID\" value=\"");
      out.print( supID);
      out.write("\" ></br>\n");
      out.write("            Name product <input type=\"text\" name=\"pName\" value=\"");
      out.print( pName);
      out.write("\" ></br>\n");
      out.write("            Selling Price <input type=\"text\" name=\"sellingPrice\" value=\"");
      out.print( sellingPrice);
      out.write("\" ></br>\n");
      out.write("            Price <input type=\"text\" name=\"price\" value=\"");
      out.print( price);
      out.write("\" ></br>\n");
      out.write("            Description  <input type=\"text\" name=\"describle\" value=\"");
      out.print( description);
      out.write("\" ></br>\n");
      out.write("            Date <input type=\"date\" name=\"pDate\" value=\"");
      out.print( pDate);
      out.write("\" ></br>\n");
      out.write("            Size product <input type=\"text\" name=\"size\" value=\"");
      out.print( size);
      out.write("\" ></br>\n");
      out.write("            Material <input type=\"text\" name=\"material\" value=\"");
      out.print( material);
      out.write("\" ></br>\n");
      out.write("            <input type=\"submit\" value=\"UPDATE\" name=\"btnUpdate\">\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
