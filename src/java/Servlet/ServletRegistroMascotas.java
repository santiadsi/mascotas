/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.conectadb;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
/**
 *
 * @author Santiago
 */
@WebServlet(name = "ServletRegistroMascotas", urlPatterns = {"/ServletRegistroMascotas"})
public class ServletRegistroMascotas extends HttpServlet {

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
            out.println("<title>Servlet ServletRegistroMascotas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletRegistroMascotas at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession(true);
            String u = (String) session.getAttribute("usuario");
            
            HSSFWorkbook wb = new HSSFWorkbook();
            HSSFSheet sheet = wb.createSheet();
            
            HSSFRow row = sheet.createRow(20);
            HSSFCell cell = row.createCell(20);
            cell.setCellValue("Some text");
            
            HSSFRow row2 = sheet.createRow(3);
            HSSFCell cell2 = row2.createCell(5);
            cell2.setCellValue("Some text");
            
            // write it as an excel attachment
            
            ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
            wb.write(outByteStream);
            byte [] outArray = outByteStream.toByteArray();
            response.setContentType("application/ms-excel");
            response.setContentLength(outArray.length);
            response.setHeader("Expires:", "0"); // eliminates browser caching
            response.setHeader("Content-Disposition", "attachment; filename=tabla.xls");
            OutputStream outStream = response.getOutputStream();
            outStream.write(outArray);
            outStream.flush();
            
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
         PrintWriter out = response.getWriter();

        try {
         
            String nombre = request.getParameter("nombre");
            String color = request.getParameter("color");
            String especie = request.getParameter("especie");
            String raza = request.getParameter("raza");
            String edad = request.getParameter("edad");
            String tamaño = request.getParameter("tamano");
            HttpSession session = request.getSession(true);
            String usuario = (String) session.getAttribute("usuario");
            

            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();
            
            String consulta = "insert into mascota(nombre,color,especie,raza,edad,usuario,tamaño) values('"+ nombre +"','"+ color +"','"+ especie +"','"+ raza +"','"+ edad +"','"+ usuario +"','"+ tamaño +"')";
            
            int t = st.executeUpdate(consulta);
            st.close();
            
            if(t == 1){
             
                //Mandamos estos atributos a la página bienvenida.jsp
                request.getRequestDispatcher("/Iniciologueo.jsp").forward(request, response);
                
            }else{
                JOptionPane.showMessageDialog(null, "no se apodido hacer el registro");
            }
            
            out.close();
        } catch (SQLException ex) {
            out.println(ex.toString());
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
