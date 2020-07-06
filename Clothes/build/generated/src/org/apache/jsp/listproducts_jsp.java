package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.DAO.ProductsDAO;
import java.sql.ResultSet;
import model.DAO.ProductsDAO;

public final class listproducts_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <body>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("            <tr>\n");
      out.write("                <th>id</th>\n");
      out.write("                <th>spId</th>\n");
      out.write("                <th>brID</th>\n");
      out.write("                <th>tID</th>\n");
      out.write("                <th>supId </th>\n");
      out.write("                <th>pName</th>\n");
      out.write("                <th>sellingPrice</th>\n");
      out.write("                <th>price</th>\n");
      out.write("                <th>describle</th>\n");
      out.write("                <th>pDate</th>\n");
      out.write("                <th>size </th>\n");
      out.write("                <th>material</th>\n");
      out.write("                <th></th>\n");
      out.write("                <th></th>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            ");

                ProductsDAO pDao = new ProductsDAO();
                ResultSet rs = pDao.getAll();
                while (rs.next()) {
                    out.print("<tr>");
                    out.print("<td>" + rs.getInt("pID") + "</td>");
                    out.print("<td>" + rs.getInt("spID") + "</td>");
                    out.print("<td>" + rs.getInt("brID") + "</td>");
                    out.print("<td>" + rs.getInt("tID") + "</td>");
                    out.print("<td>" + rs.getInt("supID") + "</td>");
                    out.print("<td>" + rs.getString("pName") + "</td>");
                    out.print("<td>" + rs.getInt("sellingPrice") + "</td>");
                    out.print("<td>" + rs.getInt("price") + "</td>");
                    out.print("<td>" + rs.getString("describle") + "</td>");
                    out.print("<td>" + rs.getDate("pDate") + "</td>");
                    out.print("<td>" + rs.getInt("size") + "</td>");
                    out.print("<td>" + rs.getString("material") + "</td>");
                    out.print("<td><a href='updateProduct.jsp?id=" + rs.getInt("pID") + "'>Update</a></td>");
                    out.print("<td><a href='?id=" + rs.getInt("pID") + "'>Delete</a></td>");

                    out.print("</tr>");
                }
            
      out.write("\n");
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <a href=\"insertProduct.jsp\">Insert</a>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</body>\n");
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
