<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="../css/lodeadentro.css">

     <title>Actualizar Cita Laboratorio</title>
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

    <!-- Contenedor principal -->
    <div class="container mt-5">
        <h1>Eliminar Cita</h1>
        <form id="eliminarCitaForm" action="eliminarlab.jsp" method="POST">
            <input type="hidden" id="usuario_id" name="usuario_id" value="<%= session.getAttribute("userId") %>">
            <div class="form-group">
                <label for="cita_id">ID de la Cita</label>
                <input type="number" class="form-control" id="cita_id" name="cita_id" placeholder="Ingrese el ID de la cita que desea eliminar" required>
            </div>
            <button type="submit" class="btn btn-danger">Eliminar Cita</button>
            <a href="solicitudesLaboratorios.jsp" class="btn btn-secondary mt-3">Volver</a>

        </form>
    </div>

    <!-- Modal de Mensaje (Solo se deja este modal para mostrar mensajes) -->
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">Mensaje</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="messageModalBody">
                    <!-- El mensaje se insertará aquí dinámicamente -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts de Bootstrap y JQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Función para mostrar mensajes en el modal
        function mostrarMensaje(mensaje) {
            document.getElementById('messageModalBody').innerText = mensaje;
            $('#messageModal').modal('show');
        }

        // Verificar si hay un mensaje para mostrar (esto se puede llenar desde el backend)
        window.onload = function() {
            var mensaje = "<%= request.getAttribute("mensaje") %>";
            if (mensaje && mensaje !== "null" && mensaje !== "") {
                mostrarMensaje(mensaje);
            }
        }
    </script>
</body>
</html>
