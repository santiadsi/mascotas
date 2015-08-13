/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.conectadb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author adsi
 */
@WebServlet(name = "Servletadoptame", urlPatterns = {"/Servletadoptame"})
public class Servletadoptame extends HttpServlet {

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
            out.println("<title>Servlet Servletadoptame</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servletadoptame at " + request.getContextPath() + "</h1>");
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
            PrintWriter out = response.getWriter();
            
        try {
            boolean buscar = false;
            
            HttpSession session = request.getSession(true);           
            String id = request.getParameter("id");
           
            
            String nom = "";
           
            
            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();
            ResultSet rs;

            
            
            String consulta = "Select (nombre)from mascota where idmascotas='" + id + "';";

            rs = st.executeQuery(consulta);

            while (rs.next()) {
                
                nom = rs.getString(1);
               
                buscar = true;
            }
            
            if (buscar) {
 
                session.setAttribute("nom", nom);
                session.setAttribute("id", id);
                request.getRequestDispatcher("/Formularioad.jsp").forward(request, response);
            } else {
                //De lo contrario vamos a la página errorLogin.jsp
                request.getRequestDispatcher("/TMascotas.jsp").forward(request, response);
            }
      
            
        } catch (SQLException ex) {
            out.println(ex.toString());
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
            PrintWriter out = response.getWriter();
             
      try {
            HttpSession session = request.getSession(true); 
            String idusuario = (String) session.getAttribute("idusuario");
            
            String idmascota = request.getParameter("id");
            String edad = request.getParameter("edad");
            String celular = request.getParameter("celular");
            String direccion = request.getParameter("direccion");
            String barrio = request.getParameter("barrio");
            String estaria = request.getParameter("estaria");
            String vivienda = request.getParameter("vivienda");
            String quiere = request.getParameter("quiere");
            String tamanom = request.getParameter("tamanom");
            String tiempo = request.getParameter("tiempo");
            String alguna = request.getParameter("alguna");

            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();

            String consulta = "insert into adopciones(edad,celular,direccion,barrio,edm,tvivienda,pqmascota,tmascota,tiemascota,tienemascotas,idusuario,idmascota) values('" + edad + "','" + celular + "','" + direccion + "','" + barrio + "','" + estaria + "','" + vivienda + "','" + quiere + "','" + tamanom + "','" + tiempo + "','" + alguna + "','" + idusuario + "','" + idmascota + "');";

            int t = st.executeUpdate(consulta);
            st.close();

            if (t == 1) {

                //Mandamos estos atributos a la página bienvenida.jsp
                request.getRequestDispatcher("/Madopcion.jsp").forward(request, response);

            } else {
                
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
