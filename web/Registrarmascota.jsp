<%--
    Document   : Registrarmascota
    Created on : 4/06/2015, 03:44:23 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--
            llamamos a las carpetas de bootstrap, icono, y javascripts
        --%>
        <title>Registrar Mascota</title>
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
                        
                        <li>
                            <a href="TMascotas.jsp">Mascotas</a>
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
            <form class="form-horizontal" action="ServletRegistroMascotas" method="post">
                <fieldset>
                    <legend>Registrar Mascota</legend>
                    <div class="form-group">
                        <label for="inputNombre" class="col-md-2 control-label">Nombre</label>
                        <div class="col-md-5">
                            <input title="Se necesita un nombre" type="text" class="form-control" id="inputNombre" placeholder="Nombre" name="nombre"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputColor" class="col-md-2 control-label">Color</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputColor" placeholder="Color" name="color" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEspecie" class="col-md-2 control-label">Especie</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputEspecie" placeholder="Especie" name="especie" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputraza" class="col-md-2 control-label">Raza</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputRaza" placeholder="Raza" name="raza" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEdad" class="col-md-2 control-label">Edad</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputEdad" placeholder="Edad" name="edad" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTamaño" class="col-md-2 control-label">Tamaño</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="inputTamaño" placeholder="Tamaño" name="tamano" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <input type="submit" value="Registrar!!" class="btn btn-success" />
                        </div>
                    </div>

                </fieldset> 
            </form>
        </div>      
    </body>
</html>
