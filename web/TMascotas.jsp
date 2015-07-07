<%-- 
    Document   : TMascotas
    Created on : 2/06/2015, 11:45:55 AM
    Author     : Andres
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
        <title>Tabla Mascotas</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>        
        <link rel="stylesheet" href="newcss.css" type="text/css">   
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png">    
        <script src="js/cargador.js"></script>
        <link href="css/cargador.css" rel="stylesheet" />
        <%
            String m = (String) session.getAttribute("email");
            String u = (String) session.getAttribute("usuario");
            String r = (String) session.getAttribute("rol");
        %>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">                
                    <a href="Inicio.jsp" class="navbar-header"><img src="Imagenes/Logo mascotas.png" alt="logo" height="55" width="110"> </a>      
                </div>

                <div class="navbar-collapse collapse" id="navbar-main">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="Iniciologueo.jsp">Inicio</a>
                        </li> 
                        <li>
                            <a href="Registrarmascota.jsp">Registrar Mascotas</a>
                        </li>
                        <li>
                            <a style="left:820px;"><%= u%></a>
                        </li>
                        <li>
                            <a style="left:830px;" href="Inicio.jsp">Cerrar Sesión</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <center><h1>Tabla Mascotas del <%= u%></h1></center>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Especie</th>
                        <th>Tamaño</th>
                        <th>Usuario</th>
                    </tr>
                </thead>



                <%
                    try {
                        boolean buscar = false;

                        String nombre = "";
                        String especie = "";
                        String tamaño = "";
                        String usua = "";

                        conectadb sqlite = new conectadb();
                        java.sql.Connection cn = sqlite.Conectar();
                        Statement st = cn.createStatement();
                        ResultSet rs;

                        String consulta = "Select * from vistamascota where usuario='" + u + "' ;";

                        rs = st.executeQuery(consulta);

                        while (rs.next()) {
                            nombre = rs.getString(1);
                            especie = rs.getString(2);
                            tamaño = rs.getString(3);
                            usua = rs.getString(4);
                            buscar = true;

                %>
                <tbody>
                    <tr>
                        <td><%= nombre%></td>
                        <td><%= especie%></td>
                        <td><%= tamaño%></td>
                        <td><%= usua%></td>
                    </tr> 

                    <%  }

                            if (buscar) {

                            } else {

                            }
                            out.close();
                        } catch (SQLException ex) {
                            out.println(ex.toString());
                        }
                    %>
                </tbody>
            </table>

        </div>
    </body>
</html>
