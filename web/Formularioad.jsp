<%-- 
    Document   : Registro
    Created on : 27-abr-2015, 10:25:31
    Author     : Santiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String u = (String) session.getAttribute("usuario");
        String nom = (String) session.getAttribute("nom");
        String id = (String) session.getAttribute("id");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
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
                            <a href="Iniciologueo.jsp">Inicio</a>
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

            <form class="form-horizontal" action="Servletadoptame" method="post">
                <fieldset>
                    <div class="row">        
                        <div class="col-xs-10">
                            <legend>Formulario Adopción</legend>
                            
                            <div class="form-group">
                                <label for="inputUsuario" class="col-md-2 control-label">Nombre Mascota</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="inputUsuario" placeholder="Nombre Completo" maxlength="30" value="<%= nom%>" readonly required/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEdad" class="col-md-2 control-label">Edad</label>
                                <div class="col-md-4">
                                    <input  name="edad" type="number" class="form-control" id="inputEdadl" placeholder="Edad Postulante" maxlength="2" required/>
                                </div>
                            </div>
                            

                            <div class="form-group">
                                <label for="inputCelular" class="col-md-2 control-label">Celular</label>
                                <div class="col-md-4">
                                    <input name="celular" type="number" class="form-control" id="inputCel" placeholder="Celular" maxlength="10" required/>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label for="inputDireccion" class="col-md-2 control-label">Dirección</label>
                                <div class="col-md-4">
                                    <input name="direccion" type="text" class="form-control" id="inputDireccion" placeholder="Dirección" required/>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label for="inputBarrio" class="col-md-2 control-label">Barrio</label>
                                <div class="col-md-4">
                                    <input name="barrio" type="text" class="form-control" id="inputBarrio" placeholder="Barrio" required/>
                                </div>
                            </div>
                             <!-- edm-->   
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">En donde estaria y dormiria la mascota</label>
                                <div class="col-md-4">
                                    <select name="estaria" >
                                        <option value="Patio">Patio</option> 
                                        <option value="Jardin">Jardin</option> 
                                        <option value="En la casa">En la casa</option> 
                                        <option value="En la calle">En la calle</option> 
                                    </select>
                                </div>
                            </div>   
                                
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">Tipo De Vivienda</label>
                                <div class="col-md-4">
                                    <select name="vivienda" >
                                        <option value="Casa">Casa</option> 
                                        <option value="Apartamento">Apartamento</option> 
                                        <option value="Finca">Finca</option> 
                                        <option value="Otro">Otro</option> 
                                    </select>
                                </div>
                            </div>   
                             <!-- pqmascota-->   
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">Para que quiere una mascota</label>
                                <div class="col-md-4">
                                    <select name="quiere" >
                                        <option value="Compania">Compañia</option> 
                                        <option value="Guardia">Guardia</option> 
                                       
                                        <option value="Otro">Otro</option> 
                                    </select>
                                </div>
                            </div>   
                                
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">Tamaño de la mascota</label>
                                <div class="col-md-4">
                                    <select name="tamanom" >
                                        <option value="Grande">Grande</option> 
                                        <option value="Pequeno">Pequeño</option> 
                                        <option value="Mediano">Mediano</option> 
                                      
                                    </select>
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">Tiene tiempo para la mascota</label>
                                <div class="col-md-4">
                                    <select name="tiempo" >
                                        <option value="Si">Si</option> 
                                        <option value="No">No</option> 
                                       
                                    </select>
                                </div>
                           </div>
                                
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">Alguna vez ha tenido o tiene mascotas</label>
                                <div class="col-md-4">
                                    <select name="alguna" >
                                        <option value="Si">Si</option> 
                                        <option value="No">No</option> 
                                       
                                    </select>
                                </div>
                           </div>
                                <input type="hidden" name="id" value="<%= id%>" />
                        </div>
                    </div>
                                
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <input type="submit" value="Enviar" class="btn btn-success" />
                        </div>
                    </div>
                </fieldset> 
            </form>
        </div>
    </body>
</html>