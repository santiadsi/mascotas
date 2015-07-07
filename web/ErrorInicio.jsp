<%-- 
    Document   : ErrorInicio
    Created on : 26/05/2015, 10:33:33 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No se ha podido iniciar sesión</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/> 
        <link rel="stylesheet" href="newcss.css" type="text/css">   
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png">
        <script src="js/cargador.js"></script>
        <link href="css/cargador.css" rel="stylesheet" />
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
                            <a href="Inicio.jsp">Inicio</a>
                        </li> 

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Error</h1>
                <p>No se ha podido iniciar sesión por que el usuario no existe o la contraseña es incorrecta.<br>
                    Regrese a la pagina de <a href="Inicio.jsp">  Inicio</a>.</p>
            </div>
        </div>
    </div>
</body>
</html>
