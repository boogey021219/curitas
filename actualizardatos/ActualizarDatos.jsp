<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Actualizar datos Curitas EPS"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../css/LogU.css">
                <link rel="stylesheet" href="../css/lodeadentro.css">

    <title>Actualizar Datos Curitas EPS</title>
</head>
<body class="body2">
    
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">EPS Curitas</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="../login/user/inicioUsers.jsp">Inicio</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="solicitudesCitas.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Citas Laboratorio
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
            <a class="dropdown-item" href="../crudLaboratorios/crear_cita_lab.jsp">Crear Cita Laboratorio</a>
            <a class="dropdown-item" href="../crudLaboratorios/listar_citas_lab.jsp">Listar Citas laboratorio</a>
            <a class="dropdown-item" href="../crudLaboratorios/actualizar_cita_lab.jsp">Actualizar Citas de laboratorio</a>
            <a class="dropdown-item" href="../crudLaboratorios/eliminar_cita_lab.jsp">Eliminar Cita</a>
          </div>
          </ul>
              <span class="navbar-text ml-auto">
                  <%= session.getAttribute("userEmail") != null ? "Bienvenido, " + session.getAttribute("userEmail") : "Bienvenido, Invitado" %>
                  <%= session.getAttribute("userId") != null ? " | ID: " + session.getAttribute("userId") : "" %>
                   <li class="nav-item">
                      <a class="nav-link" href="../../CuritasEPS/index.html">log out</a>
                  </li>
                </span>
                
        </li>
      
    </div>
  </nav>
  
    <div class="container mt-5a">
        <div class="card mx-auto" style="max-width: 900px; ">
            <div class="row no-gutters">
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <div class="text-center">
                        <img class="use img-fluid" src="../IMG/99.jpg" alt="User Image">
                        <h3 class="mt-3">Actualiza tus Datos</h3>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card-body">
                        <form action="actualizar.jsp" method="post">
                            <!-- El ID del usuario no se puede modificar -->
                            <div class="form-group">
                                <input id="userId" class="form-control" type="text" name="id" placeholder="Documento" readonly>
                            </div>
                            
                            <div class="form-group">
                                <select id="tipo_documento" class="form-control" name="tipo_documento" required>
                                    <option value="" disabled>Seleccione Tipo de Documento</option>
                                    <option value="TI">Tarjeta de Identidad (TI)</option>
                                    <option value="CC">Cedula de Ciudadania (CC)</option>
                                    <option value="CE">Cedula de Extranjeria (CE)</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <input class="form-control" type="text" name="nombre" placeholder="Nombre Completo" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="email" name="email" placeholder="Email" required>
                            </div>
                            
                            <!-- Contraseña y Confirmar Contraseña no se pueden modificar -->
                            <div class="form-group">
                                <input class="form-control" type="password" name="passwd" placeholder="Contrasena" readonly>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="confirmar_paswd" placeholder="Confirmar Contrasena" readonly>
                            </div>

                            <div class="form-group">
                                <select class="form-control" name="genero" required>
                                    <option value="" disabled selected>Genero</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                    <option value="Otro">Otro</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="estado_afiliacion">Estado de Afiliacion</label><br>
                                
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="estado_afiliacion" id="contributivo" value="Contributivo" required>
                                    <label class="form-check-label" for="contributivo">Contributivo</label>
                                </div>
                                
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="estado_afiliacion" id="subsidiado" value="Subsidiado" required>
                                    <label class="form-check-label" for="subsidiado">Subsidiado</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="estado_civil">Estado Civil</label><br>
                                
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="estado_civil" id="soltero" value="Soltero" required>
                                    <label class="form-check-label" for="soltero">Soltero</label>
                                </div>
                                
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="estado_civil" id="casado" value="Casado" required>
                                    <label class="form-check-label" for="casado">Casado</label>
                                </div>
                            
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="estado_civil" id="divorciado" value="Divorciado" required>
                                    <label class="form-check-label" for="divorciado">Divorciado</label>
                                </div>
                            
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="estado_civil" id="viudo" value="Viudo" required>
                                    <label class="form-check-label" for="viudo">Viudo</label>
                                </div>
                            </div>
                                                        
                            <div class="form-group">
                                <input class="form-control" type="number" name="telefono" placeholder="Telefono" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="direccion" placeholder="Direccion" required>
                            </div>
                            
                            <div class="form-group">
                                <p>Fecha de Nacimiento</p>
                                <input class="form-control" type="date" name="fecha_nacimiento" placeholder="Fecha de Nacimiento" required>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" value="Actualizar" class="btn btn-primary btn-block">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
