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
 * @author Adsi
 */
@WebServlet(name = "ServletCRUD", urlPatterns = {"/ServletCRUD"})
public class ServletCRUD extends HttpServlet {

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
            out.println("<title>Servlet ServletCRUD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCRUD at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        try {
            boolean buscar = false;
            
            String id = request.getParameter("id");
            HttpSession session = request.getSession(true);
            String usuario = (String) session.getAttribute("usuario");
           
            
            String nom = "";
            String color = "";
            String especie = "";
            String raza = "";
            String edad = "";
            String ta = "";
            
            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();
            ResultSet rs;

            
            
            String consulta = "Select *from mascota where usuario='" + usuario + "'and idmascotas='"+ id + "';";

            rs = st.executeQuery(consulta);

            while (rs.next()) {
                nom = rs.getString(2);
                color = rs.getString(3);
                especie = rs.getString(4);
                raza = rs.getString(5);
                edad = rs.getString(6);
                ta = rs.getString(8);
                buscar = true;
            }
            
            if (buscar) {
 
                session.setAttribute("nom", nom);
                session.setAttribute("color", color);
                session.setAttribute("especie", especie);
                session.setAttribute("raza", raza);
                session.setAttribute("edad", edad);
                session.setAttribute("ta", ta);
               
                //Mandamos estos atributos a la página bienvenida.jsp
                request.getRequestDispatcher("/Show.jsp").forward(request, response);
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
        //processRequest(request, response);
         PrintWriter out = response.getWriter();
     
          try {
                           
           
            
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String color = request.getParameter("color");
            String especie = request.getParameter("especie");
            String raza = request.getParameter("raza");
            String edad = request.getParameter("edad");
            String tamaño = request.getParameter("tamano");
            
            
            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();
            
            String consulta = "update mascota set nombre='" +nombre+ "',color='" +color+ "',especie='" +especie+ "',raza='"+raza+"',edad='"+edad+"',tamaño='"+tamaño+"' where idmascotas='"+id+"'; ";
            
            int t = st.executeUpdate(consulta);
            st.close();
            
            if(t == 1){
             
                //si todo fue exitoso Mandamos a la página TMascotas.jsp
                request.getRequestDispatcher("/TMascotas.jsp").forward(request, response);
                
            }else{
                request.getRequestDispatcher("/TMascotas.jsp").forward(request, response);
            }
            
        } catch (SQLException ex) {
            out.println(ex.toString());
        }
         
         
         
         
           
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
