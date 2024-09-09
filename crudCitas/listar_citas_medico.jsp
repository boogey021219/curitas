<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Listado de citas médicas"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/lodeadentro.css">

    <title>Listado de Citas Medicas</title>
</head>
<body>

<!-- Barra de navegación -->
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
          Citas Medico General
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
          <a class="dropdown-item" href="crear_cita_medico.jsp">Crear Cita</a>
          <a class="dropdown-item" href="listar_citas_medico.jsp">Listar Citas</a>
          <a class="dropdown-item" href="actualizar_cita_medico.jsp">Actualizar Cita</a>
          <a class="dropdown-item" href="eliminar_cita_medico.jsp">Eliminar Cita</a>
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

<!-- Cuerpo del documento -->
<div class="container mt-4">
    <h2 class="mb-4">Listado de Citas Medicas</h2>

    <!-- Formulario para enviar el ID de usuario obtenido de la sesión -->
    <form action="listarCitas.jsp" method="post">
        <input type="hidden" name="usuarioId" value="<%= session.getAttribute("userId") %>">
        <button type="submit" class="btn btn-primary">Buscar Citas</button>
    </form>

    <!-- Tabla de citas (se llenará con datos del JSP) -->
    <table class="table table-striped mt-4">
        <thead>
            <tr>
                <th>ID</th>
                <th>Usuario ID</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Descripcion</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aquí los datos serán llenados por el JSP -->
        </tbody>
    </table>

    <!-- Botón para volver -->
    <div>
        <a href="solicitudesCitas.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
