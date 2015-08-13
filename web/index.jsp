<%-- 
    Document   : Inicio
    Created on : 16/04/2015, 01:06:30 PM
    Author     : Santiago
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Controller.conectadb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
   invalidamos la session
--%>
<%
    session.invalidate();
%>
<html>
    <head>
        <%--
            llamamos a las carpetas de bootstrap, icono, y javascripts
        --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mascotas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/cargador.css" rel="stylesheet" />
        <link rel="stylesheet" href="newcss.css" type="text/css">
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png"> 
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>   
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="js/cargador.js"></script>
        <script>
            var xmlhttp;
            function loadXMLDoc(url,cfunc)
            {
            if (window.XMLHttpRequest)
              {// code for IE7+, Firefox, Chrome, Opera, Safari
              xmlhttp=new XMLHttpRequest();
              }
            else
              {// code for IE6, IE5
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
              }
            xmlhttp.onreadystatechange=cfunc;
            xmlhttp.open("GET",url,true);
            xmlhttp.send();
            }
            function myFunction()
            {
            loadXMLDoc("Madopcion.jsp",function()
              {
              if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                }
              });
            }
     </script>
</head> 
<body>
<div id="myDiv">
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
                    
                    <li>
                       <a onclick="myFunction()" href="#" >Tabla</a>
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
 </div>  
</body>
</html>

