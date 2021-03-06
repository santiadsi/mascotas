<%-- 
    Document   : Registro
    Created on : 27-abr-2015, 10:25:31
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--
            llamamos a las carpetas de bootstrap, icono, y javascripts
        --%>
        <title>Registrate</title>
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
            <form class="form-horizontal" action="ServletRegistro" method="post">
                <fieldset>
                    <legend>Registrarse</legend>
                    <div class="form-group">
                        <label for="inputUsuario" class="col-md-2 control-label">Usuario</label>
                        <div class="col-md-5">
                            <input title="Se necesita un nombre" type="text" class="form-control" id="inputUsuario" placeholder="Usuario" minlength="10" required name="usuario"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-md-2 control-label">Email</label>
                        <div class="col-md-5">
                            <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-2 control-label">Contraseña</label>
                        <div class="col-md-5">
                            <input type="password" class="form-control" id="inputPassword" placeholder="Contraseña" minlength="8" name="passaword" required/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <input type="submit" value="Registrarse" class="btn btn-success" />
                        </div>
                    </div>

                </fieldset> 
            </form>
        </div>
    </body>
</html>
