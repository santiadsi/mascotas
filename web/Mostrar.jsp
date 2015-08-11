<%-- 
    Document   : mostrar
    Created on : 6/08/2015, 09:23:48 AM
    Author     : Adsi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>mostrar</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>        
        <link rel="stylesheet" href="newcss.css" type="text/css">   
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png">    
        <script src="js/cargador.js"></script>
        <link href="css/cargador.css" rel="stylesheet" />
         <%
            String n = (String) session.getAttribute("nom");
            String c = (String) session.getAttribute("color");
            String e = (String) session.getAttribute("especie");
            String r = (String) session.getAttribute("raza");
            String edad = (String) session.getAttribute("edad");
            String t = (String) session.getAttribute("tamaño");
            String u = (String) session.getAttribute("usuario");
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
   
           <div class="col-md-4  col-md-offset-4">    
                
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Detalle de la Mascota</h3>
                </div>
                <div class="panel-body">
                    <p>
                        <strong> Nombre:</strong>
                            <%= n%>   
                    </p>
                    <p>
                        <strong> Color:</strong>
                            <%= c%>   
                    </p>
                     <p>
                        <strong> Especie:</strong>
                            <%= e%>   
                    </p>
                     <p>
                        <strong> Raza:</strong>
                            <%= r%>   
                    </p>
                     <p>
                        <strong> Edad:</strong>
                            <%= edad%>   
                    </p>
                     <p>
                        <strong> Tamaño:</strong>
                            <%= t%>   
                    </p>
                     <p>
                        <strong> Usuario:</strong>
                            <%= u%>   
                    </p>
                    <br>
                    <a href="TMascotas.jsp" class="btn btn-primary">Atras</a>
                </div>
            </div>          
      </div>                 
    </body>
</html>

