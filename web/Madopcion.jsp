<%-- 
    Document   : Madopcion
    Created on : 12/08/2015, 08:23:24 AM
    Author     : adsi
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.conectadb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adopcion</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/cargador.css" rel="stylesheet" />
        <link rel="stylesheet" href="newcss.css" type="text/css">
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png"> 
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>   
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="js/cargador.js"></script>
        <%
            
            String u = (String) session.getAttribute("usuario");
            
        %>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">                
                    <a href="index.jsp" class="navbar-header"><img src="Imagenes/Logo mascotas.png" alt="logo" height="55" width="110"> </a>  
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                  </button>
                </div>

                <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="Iniciologueo.jsp">Inicio</a>
                        </li>                         

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a><%= u%></a>
                        </li>
                        <li>
                            <a href="index.jsp">Cerrar Sesión</a>
                        </li>
                    </ul>  
                </div>
            </div>
        </nav>
        
 <div class="container">
      <center><h1>Mascotas en adopcion</h1></center>
      <br>
      <br>
      <div class="table-responsive">  
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Color</th>
                    <th>Especie</th>
                    <th>Raza</th>
                    <th>Edad</th>                  
                    <th>Tamaño</th>
                    <th>Usuario</th>
                    <th></th>
                </tr>
            </thead>

            <%
                try {
                    
                    String id = "";
                    String nombre = "";
                    String color = "";
                    String especie = "";                  
                    String raza = "";
                    String edad = "";
                    String tamaño = "";
                    String usua = "";
                   
                    
                    conectadb sqlite = new conectadb();
                    java.sql.Connection cn = sqlite.Conectar();
                    Statement st = cn.createStatement();
                    ResultSet rs;

                    String consulta = "Select *from mascota;";

                    rs = st.executeQuery(consulta);

                    while (rs.next()) {
                        id = rs.getString(1);
                        nombre = rs.getString(2);
                        color = rs.getString(3);
                        especie = rs.getString(4); 
                        raza = rs.getString(5);
                        edad = rs.getString(6);                     
                        usua = rs.getString(7);
                        tamaño = rs.getString(8);

            %>
            <tbody>
                <tr>
                    <td><%= nombre%></td>
                    <td><%= color%></td>
                    <td><%= especie%></td>
                    <td><%= raza%></td>  
                    <td><%= edad%></td> 
                    <td><%= tamaño%></td> 
                    <td><%= usua%></td> 
                    <td>
                        <form action="Servletadoptame" method="get">                    
                            <div class="form-group">                                                       
                                <input type="hidden" name="id" value="<%= id%>" />                              
                                <input type="submit" value="Adoptar!!" class="btn btn-success"/>
                            </div>
                        </form> 
                    </td>
                </tr> 

                <%  }

                        out.close();
                    } catch (SQLException ex) {
                        out.println(ex.toString());
                    }
                %>
            </tbody>
        </table>
    </div>    
   </div> 
        
        
        
        
    </body>
</html>
