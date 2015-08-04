<%-- 
    Document   : Iniciologueo
    Created on : 26/05/2015, 10:00:28 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/> 
        <link rel="stylesheet" href="newcss.css" type="text/css">   
        <link rel="Shortcut Icon" type="image/x-icon" href="Imagenes/Icono.png">
        <script src="js/cargador.js"></script>
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <link href="css/cargador.css" rel="stylesheet" />
        <!-- carrusel-->
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <!-- carrusel -->
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
                            <a href="Inicio.jsp">Inicio</a>
                        </li> 
                        <li>
                            <a href="Formularioad.jsp">Formulario Adopcion</a>
                        </li>
                        <li>
                            <a href="TMascotas.jsp">Mascotas</a>
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
                            <a href="Inicio.jsp">Cerrar Sesión</a>
                        </li>
                    </ul>  
                </div>
            </div>   
        </nav>
        
        <div class="container-fluid">
            <div class="jumbotron">
                <h1>Bienvenido </h1>
                <p>Esta página fue creada para saber más sobre las mascotas, podrán adoptar mascotas, donar beneficios para que estas mascotas se encuntren bien  y se podra interactuar con la persona que esta dando en adopcion la mascotas.</p>

            </div>
        </div>
        <!-- CARRUSEL-->
        <div class="carrucel" >
            <div id="wowslider-container1" >
                <div class="ws_images"><ul>
                        <li><img src="data1/images/noalmaltratoanimal.jpg" alt="" title="" id="wows1_0"/></li>
                        <li><a href="http://wowslider.com"><img src="data1/images/portada.jpg" alt="simple jquery slider" title="" id="wows1_1"/></a></li>
                        <li><img src="data1/images/catdoggrooming960x360.jpg" alt="ADOPTAME" title="ADOPTAME" id="wows1_2"/></li>
                    </ul></div>
                <div class="ws_bullets"><div>
                        <a href="#" title=""><span><img src="data1/tooltips/noalmaltratoanimal.jpg" alt=""/>1</span></a>
                        <a href="#" title=""><span><img src="data1/tooltips/portada.jpg" alt=""/>2</span></a>
                        <a href="#" title="ADOPTAME"><span><img src="data1/tooltips/catdoggrooming960x360.jpg" alt="ADOPTAME"/>3</span></a>
                    </div></div><div class="ws_script" style="position:absolute;left:-99% "><a href="http://wowslider.com/vi">jquery image slider</a> by WOWSlider.com v8.0</div>
                <div class="ws_shadow"></div>
            </div>        
            <script type="text/javascript" src="engine1/wowslider.js"></script>
            <script type="text/javascript" src="engine1/script.js"></script>
        </div>
        <!-- CARRUSEL-->
    </body>
</html>

