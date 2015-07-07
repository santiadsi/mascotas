<%-- 
    Document   : Registro
    Created on : 27-abr-2015, 10:25:31
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String m = (String) session.getAttribute("email");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
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
                        <li> <a style="left:735px;"><%= m%></a></li>
                        <li>
                            <a style="left:735px;" href="Inicio.jsp">Cerrar Sesión</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">

            <form class="form-horizontal">
                <fieldset>
                    <div class="row">        
                        <div class="col-xs-10">
                            <legend>Formulario Adopción</legend>
                            <div class="form-group">
                                <label for="inputUsuario" class="col-md-2 control-label">Nombre Completo</label>
                                <div class="col-md-4">
                                    <input title="Se necesita un nombre" type="text" class="form-control" id="inputUsuario" placeholder="Nombre Completo" maxlength="30" required/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEdad" class="col-md-2 control-label">Edad</label>
                                <div class="col-md-4">
                                    <input type="number" class="form-control" id="inputEdadl" placeholder="Edad" maxlength="2" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputTel" class="col-md-2 control-label">Tel</label>
                                <div class="col-md-4">
                                    <input type="number" class="form-control" id="inputTel" placeholder="Telefono" maxlength="7" required/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputCelular" class="col-md-2 control-label">Celular</label>
                                <div class="col-md-4">
                                    <input type="number" class="form-control" id="inputCel" placeholder="Celular" maxlength="10" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputDireccion" class="col-md-2 control-label">Dirección</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="inputDireccion" placeholder="Dirección" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputBarrio" class="col-md-2 control-label">Barrio</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="inputBarrio" placeholder="Barrio" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmpresa" class="col-md-2 control-label">Empresa</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="inputEmpresa" placeholder="Empresa" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPT" class="col-md-2 control-label">Puesto de trabajo</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="inputPT" placeholder="Puesto de trabajo" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputvivienda" class="col-md-2 control-label">Tipo De Vivienda</label>
                                <div class="col-md-4">
                                    <select name="vivienda" >
                                        <option value="1">Casa</option> 
                                        <option value="2">Apartamento</option> 
                                        <option value="1">Finca</option> 
                                        <option value="1">Otro</option> 
                                    </select>
                                </div>
                            </div>                      
                        </div>


                        <div class="col-xs-10">

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