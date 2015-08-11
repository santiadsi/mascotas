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
                <a href="index.jsp" class="navbar-header"><img src="Imagenes/Logo mascotas.png" alt="logo" height="55" width="110"> </a>      
            </div>

            <div class="navbar-collapse collapse" id="navbar-main">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Iniciologueo.jsp">Inicio</a>
                    </li> 
                    <li>
                        <a href="Registrarmascota.jsp">Registrar Mascotas</a>
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
    <a href="ServletRegistroMascotas" class="btn btn-success">Exportar tabla Excel</a>  
    <a href="Servletpdf" class="btn btn-success">Normas pdf</a> 
    <div class="container">
        <center><h1>Tus Mascotas <%= u%></h1></center>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Especie</th>
                    <th>Tamaño</th>
                    <th>Usuario</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>



            <%
                try {
                    

                    String nombre = "";
                    String especie = "";
                    String tamaño = "";
                    String usua = "";
                    String id = "";
                    
                    conectadb sqlite = new conectadb();
                    java.sql.Connection cn = sqlite.Conectar();
                    Statement st = cn.createStatement();
                    ResultSet rs;

                    String consulta = "Select idmascotas,nombre,especie,tamaño,usuario from mascota where usuario='" + u + "' ;";

                    rs = st.executeQuery(consulta);

                    while (rs.next()) {
                        id = rs.getString(1);
                        nombre = rs.getString(2);
                        especie = rs.getString(3);
                        tamaño = rs.getString(4); 
                        usua = rs.getString(5);
                                             
                        

            %>
            <tbody>
                <tr>
                    <td><%= nombre%></td>
                    <td><%= especie%></td>
                    <td><%= tamaño%></td>
                    <td><%= usua%></td>  

                    <!-- Operacion Mostrar -->
                    <td>
                        <form action="ServletCRUD" method="get">                      
                            <div class="form-group">                                                       
                                <input type="hidden" name="id" value="<%= id%>" />
                                <input type="submit" value="Mostrar" class="btn btn-info"/>
                            </div>
                        </form>
                    </td>
                    <!-- Operacion Ediatr -->
                    <td>
                        <form action="Editar.jsp" method="post">
                            <div class="form-group">               
                                <input type="hidden" name="id" value="<%= id%>" />
                                <input type="submit" value="Editar" class="btn btn-warning"/>                                   
                            </div>
                        </form>
                    </td>
                    <!-- Operacion Eliminar -->
                    <td>
                        <form action="Servletd" method="get">
                            <div class="form-group">            
                                <input type="hidden" name="id" value="<%= id%>" />
                                <input type="submit" value="Eliminar" class="btn btn-danger"/>                                   
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
</body>
</html>
