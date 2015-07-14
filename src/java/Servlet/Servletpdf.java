/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;

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
       
        try {
            // step 1
            Document document = new Document();
            // step 2
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            // step 3
            document.open();
            // step 4
            document.add(new Paragraph(String.format(" Diez reglas básicas para tener una mascota sin peligros", request.getMethod())));
            document.add(new Paragraph("   "));
            document.add(new Paragraph(" 1. Estar informados sobre el animal que se va adquirir, sus necesidades, sus características y su comportamiento.\n"
                    + "    2. Elegir un animal adecuado según las circunstancias personales de los individuosque van a convivir con el animal (edad,disponibilidad de espacio y de tiempo,economía, alergias, estatus inmunitario,carácter, etc.).\n"
                    + "   3. Elegir animales sanos, con un origen de confianza. Sison especies que lo requieran, como las exóticas, que tengan su CITES (número de permiso deexportación/importación concedido para la comercialización de animales protegidos por elConvenio Internacional de Especies Amenazadas de Fauna y Flora Silvestres).\n"
                    + "   4. Tener en cuenta que es una inversión a largo plazo y una gran responsabilidad, que va a requerir del propietario tiempo, atenciones y dinero.\n"
                    + "    5. Control sanitario del animal. Visitas periódicas a lveterinario:  vacunaciones y desparasitaciones(interna y externa) en regla, exploraciones periódicas...\n"
                    + "    6. Medidas higiénico sanitarias en el hogar: limpieza periódica del animal (baño, corte deuñas, limpieza de oídos, dientes, etc.) y sus utensilios (comederos, juguetes, camas, terrario,etc.).\n"
                    + "     7. Realización en casa de exploraciones periódicas del animal y encuanto se observe algún síntoma extraño (aparición de heridas,bultos, toses, mocos, heces diarreicas, envolado en aves  cuando parecen estar hinchadas, postración, cambio de color en reptiles y anfibios, pérdida de pelo, falta de apetito, aumento o pérdida depeso rápido, etc.) acudir al veterinario.\n"
                    + "     8. Proporcionar al animal todas sus necesidades tanto de alimentación, temperatura, agua,estimulación psicológica y motriz, cariño, etc. conforme a las características de la especie.\n"
                    + "     9. Siempre que sea posible, identificar al animal mediante microchip para poder localizarlo si sepierde o es robado.\n"
                    + "    10. Tener en cuenta que una mascota es un miembro más de la familia y por lo tanto se le debe proporcionar todo aquello que sea necesario parasu bienestar teniendo siempre en cuenta que es un animal, no un ser humano."));
            // step 5
            document.close();

            // setting some response headers
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control",
                    "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            // setting the content type
            response.setContentType("application/pdf");
            // the contentlength
            response.setContentLength(baos.size());
            // write ByteArrayOutputStream to the ServletOutputStream
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
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
