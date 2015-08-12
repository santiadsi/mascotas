<%-- 
    Document   : editar
    Created on : 07-ago-2015, 18:20:46
    Author     : Santiago
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.conectadb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edicion de mascota</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/cargador.css" rel="stylesheet" />
        <link rel="stylesheet" href="newcss.css" type="text/css">
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png"> 
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>   
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="js/cargador.js"></script>
        <%
            String u = (String) session.getAttribute("usuario");
            String id = request.getParameter("id");
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
                            <a><%= u %></a>
                        </li>
                        <li>
                            <a href="index.jsp">Cerrar Sesión</a>
                        </li>
                    </ul>  
                </div>
            </div>
        </nav> 
                        
        <% 
            String nom = "";
            String color = "";
            String especie = "";
            String raza = "";
            String edad = "";
            String tamaño = "";
            
            conectadb sqlite = new conectadb();
            java.sql.Connection cn = sqlite.Conectar();
            Statement st = cn.createStatement();
            ResultSet rs;

            String consulta = "Select * from mascota where usuario='" + u + "'and idmascotas='"+ id + "' ;";

            rs = st.executeQuery(consulta);

            while (rs.next()) {
                nom = rs.getString(2);
                color = rs.getString(3);
                especie = rs.getString(4);
                raza = rs.getString(5);
                edad = rs.getString(6);
                tamaño = rs.getString(8);
                
            }
        
        %>
               
        <div class="container">
            <form class="form-horizontal" action="ServletCRUD" method="post">
                <fieldset>
                    <legend>Editar Mascota</legend>
                    <div class="form-group">
                        <label for="inputNombre" class="col-md-2 control-label">Nombre</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputNombre" name="nombre" value="<%= nom %>"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputColor" class="col-md-2 control-label">Color</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputColor" name="color" value="<%= color %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEspecie" class="col-md-2 control-label">Especie</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputEspecie" name="especie" value="<%= especie %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputraza" class="col-md-2 control-label">Raza</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputRaza" name="raza" value="<%= raza %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEdad" class="col-md-2 control-label">Edad</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputEdad" name="edad" value="<%= edad %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTamaño" class="col-md-2 control-label">Tamaño</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputTamaño" name="tamano" value="<%= tamaño %>" required/>
                        </div>
                    </div>
                     <input type="hidden" name="id" value="<%= id%>" />
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <input type="submit" value="Guardar" class="btn btn-success" />
                        </div>
                    </div>
                </fieldset> 
            </form>
        </div>           
    </body>
</html>
