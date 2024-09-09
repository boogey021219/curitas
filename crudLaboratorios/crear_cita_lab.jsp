<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Formulario para crear una cita médica"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="../css/lodeadentro.css">
    <title>Crear Cita Laboratorio</title>
</head>
<body>
    
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
          <a class="dropdown-item" href="crear_cita_lab.jsp">Crear Cita Laboratorio</a>
          <a class="dropdown-item" href="listar_citas_lab.jsp">Listar Citas laboratorio</a>
          <a class="dropdown-item" href="actualizar_cita_lab.jsp">Actualizar Citas de laboratorio</a>
          <a class="dropdown-item" href="eliminar_cita_lab.jsp">Eliminar Cita</a>
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
        <h2>Crear Cita Laboratorio</h2>
        <form action="crearcitaLab.jsp" method="POST">
            <input type="hidden" name="usuario_id" value="<%= session.getAttribute("userId") %>">
            <div class="form-group">
                <label for="fecha">Fecha:</label>
                <input type="date" class="form-control" id="fecha" name="fecha" required>
            </div>
            <div class="form-group">
                <label for="hora">Hora:</label>
                <input type="time" class="form-control" id="hora" name="hora" required>
            </div>
            <div class="form-group">
                <label for="tipoexam">Tipo de examen :</label>
                <textarea class="form-control" id="tipoexam" name="tipoexam" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="estado">Estado:</label>
                <select class="form-control" id="estado" name="estado">
                    <option value="pendiente">Pendiente</option>
                    <option value="confirmada">Confirmada</option>
                    <option value="cancelada">Cancelada</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Crear Cita</button>
        </form>
        <div>
            <a href="solicitudesLaboratorios.jsp" class="btn btn-secondary mt-3">Volver</a>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>