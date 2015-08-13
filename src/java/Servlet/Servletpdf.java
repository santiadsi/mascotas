/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.conectadb;
import com.itextpdf.text.BaseColor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Santiago
 */
@WebServlet(name = "Servletpdf", urlPatterns = {"/Servletpdf"})
public class Servletpdf extends HttpServlet {

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
            out.println("<title>Servlet Servletpdf</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servletpdf at " + request.getContextPath() + "</h1>");
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
        try{
            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("SELECT *FROM mascota;");

            Document document = new Document();
            
            response.setContentType("APPLICATION/download");
            response.setHeader("Content-Disposition", "filename=Mascotas.pdf");
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
                 
            Image image = Image.getInstance("http://mascotaselarcadenoe.com/images/animales/venta-mascotas-animales.jpg");
            image.scaleAbsolute(100, 100);
            image.setAlignment(Element.ALIGN_CENTER);
            document.add(image);
            
            Paragraph preface = new Paragraph("Mascotas en adopcion");
            preface.setAlignment(Element.ALIGN_CENTER);
            document.add(preface);

            PdfPTable table = new PdfPTable(7); 
            table.setWidthPercentage(100); 
            table.setSpacingBefore(10f); //Space before table
            table.setSpacingAfter(10f); //Space after table

            //Set Column widths
            float[] columnWidths = {1f, 1f, 1f, 1f, 1f, 1f, 1f};
            table.setWidths(columnWidths);

            PdfPCell cellnombre = new PdfPCell(new Paragraph("Nombre mascotas"));
            cellnombre.setBorderColor(BaseColor.BLUE);
            cellnombre.setPaddingLeft(10);
            cellnombre.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellnombre.setVerticalAlignment(Element.ALIGN_MIDDLE);

            PdfPCell cellcolor = new PdfPCell(new Paragraph("Color"));
            cellcolor.setBorderColor(BaseColor.BLUE);
            cellcolor.setPaddingLeft(10);
            cellcolor.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellcolor.setVerticalAlignment(Element.ALIGN_MIDDLE);

            PdfPCell cellespecie = new PdfPCell(new Paragraph("Especie"));
            cellespecie.setBorderColor(BaseColor.BLUE);
            cellespecie.setPaddingLeft(10);
            cellespecie.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellespecie.setVerticalAlignment(Element.ALIGN_MIDDLE);

            PdfPCell cellraza = new PdfPCell(new Paragraph("Raza"));
            cellraza.setBorderColor(BaseColor.BLUE);
            cellraza.setPaddingLeft(10);
            cellraza.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellraza.setVerticalAlignment(Element.ALIGN_MIDDLE);

            PdfPCell celledad = new PdfPCell(new Paragraph("Edad"));
            celledad.setBorderColor(BaseColor.BLUE);
            celledad.setPaddingLeft(10);
            celledad.setHorizontalAlignment(Element.ALIGN_CENTER);
            celledad.setVerticalAlignment(Element.ALIGN_MIDDLE);
            
            PdfPCell celltamano = new PdfPCell(new Paragraph("Tamaño"));
            celltamano.setBorderColor(BaseColor.BLUE);
            celltamano.setPaddingLeft(10);
            celltamano.setHorizontalAlignment(Element.ALIGN_CENTER);
            celltamano.setVerticalAlignment(Element.ALIGN_MIDDLE);
            
            PdfPCell cellusuario = new PdfPCell(new Paragraph("Usuario"));
            cellusuario.setBorderColor(BaseColor.BLUE);
            cellusuario.setPaddingLeft(10);
            cellusuario.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellusuario.setVerticalAlignment(Element.ALIGN_MIDDLE);

            table.addCell(cellnombre);
            table.addCell(cellcolor);
            table.addCell(cellespecie);
            table.addCell(cellraza);
            table.addCell(celledad);
            table.addCell(celltamano);
            table.addCell(cellusuario);
            
            
            

            while (rs.next()) {

                PdfPCell cell1 = new PdfPCell(new Paragraph(rs.getString(2)));
                cell1.setPaddingLeft(1);
                cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell1.setBackgroundColor(BaseColor.CYAN);
                cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell1);

                PdfPCell cell2 = new PdfPCell(new Paragraph(rs.getString(3)));
                cell2.setPaddingLeft(2);
                cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell2.setBackgroundColor(BaseColor.CYAN);
                cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell2);

                PdfPCell cell3 = new PdfPCell(new Paragraph(rs.getString(4)));
                cell3.setPaddingLeft(3);
                cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell3.setBackgroundColor(BaseColor.CYAN);
                cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell3);

                PdfPCell cell4 = new PdfPCell(new Paragraph(rs.getString(5)));
                cell4.setPaddingLeft(4);
                cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell4.setBackgroundColor(BaseColor.CYAN);
                cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell4);

                PdfPCell cell5 = new PdfPCell(new Paragraph(rs.getString(6)));
                cell5.setPaddingLeft(5);
                cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell5.setBackgroundColor(BaseColor.CYAN);
                cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell5);
                
                PdfPCell cell6 = new PdfPCell(new Paragraph(rs.getString(8)));
                cell6.setPaddingLeft(6);
                cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell6.setBackgroundColor(BaseColor.CYAN);
                cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell6);
                
                PdfPCell cell7 = new PdfPCell(new Paragraph(rs.getString(7)));
                cell7.setPaddingLeft(7);
                cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell7.setBackgroundColor(BaseColor.CYAN);
                cell7.setVerticalAlignment(Element.ALIGN_MIDDLE);
                table.addCell(cell7);

            }

            document.add(table);
            //Add more content here
            cn.close();
            document.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        
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
        processRequest(request, response);
      
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
