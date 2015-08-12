<%-- 
    Document   : Inicio
    Created on : 16/04/2015, 01:06:30 PM
    Author     : Andres
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controller.conectadb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mascotas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/cargador.css" rel="stylesheet" />
        <link rel="stylesheet" href="newcss.css" type="text/css">
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png"> 
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>   
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="js/cargador.js"></script>
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
                        <a href="index.jsp">Inicio</a>
                    </li> 

                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="col-xs-8 col-xs-offset-4">
            <form class="form-horizontal" action="Servletautenticacion" method="post">
                <fieldset>
                    <legend>Iniciar Sesión</legend>
                    <div class="form-group">
                        <label for="inputEmail" class="col-md-2 control-label">Email</label>
                        <div class="col-md-7">
                            <input name="email" type="email" class="form-control" id="inputEmail" placeholder="Email" title="Ingrese Email" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword" class="col-md-2 control-label">Contraseña</label>
                        <div class="col-md-7">
                            <input title="Ingrese Contraseña" type="password" name="password" class="form-control" id="inputPassword" placeholder="Contraseña" required/>
                        </div>
                    </div>
                    <div class="from-group">
                        <label for="inputPassword" class="col-md-2 control-label"></label>
                        <div class="col-md-4">
                            <p><strong>No tienes una cuenta?  <a href="Registro.jsp">  Registrarse </a> </strong></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <input type="submit" value="Entrar" class="btn btn-success"/>
                        </div>
                    </div>


                </fieldset> 
            </form>
        </div>
    </div>

    <%
        conectadb sqlite = new conectadb();
        Connection cn = sqlite.Conectar();

        String res = "";

        if (cn != null) {
            res = "Conexión Exitosa!";
        } else {
            res = "Conexión Fallida :( ";
        }
    %>
    <!--
    <div class="container">
        <div class="col-xs-8">
            <input type="submit" value="Conexion" class="btn btn-success" onclick = "alert('<%= res%>')"/>
        </div>
    </div>
    -->
</body>
</html>

