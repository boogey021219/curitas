<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Cita</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/lodeadentro.css">

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
              <a class="nav-link" href="../../login/admin/inicioAdmin.jsp">Inicio</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="solicitudesCitas.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Medicos
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="medicos/crear_medico.jsp">Registrar Medico</a>
                <a class="dropdown-item" href="medicos/updateMedico.jsp">Modificar Medico</a>
                <a class="dropdown-item" href="medicos/eliminar_medico.jsp">Eliminar Medico</a>
                <a class="dropdown-item" href="medicos/listarMedicos.jsp">Ver Medicos</a>
              </div>
              
              </li>
              <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="indexUserAdmin.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Usuarios
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/newUsers.jsp">Registrar Usuario</a>
                <a class="dropdown-item" href="updateUser.jsp">Modificar Usuario</a>
                <a class="dropdown-item" href="../adminUsers/eliminar_users.jsp">Eliminar Usuario</a>
                <a class="dropdown-item" href="listUsers.jsp">Ver Usuarios</a>
              </div>
        </ul>
            <span class="navbar-text ml-auto">
                <%= session.getAttribute("userEmail") != null ? "Bienvenido, " + session.getAttribute("userEmail") : "Bienvenido, Invitado" %>
                 <li class="nav-item">
                    <a class="nav-link" href="../../CuritasEPS/index.html">log out</a>
                </li>
              </span>
              
      </li>
  </div>
</nav>
    <!-- Contenedor principal -->
    <div class="container mt-5">
        <h1>Eliminar Usuario</h1>
        <form id="eliminarCitaForm" action="eliminarUser.jsp" method="POST">
            <%-- <input type="hidden" id="user_id" name="user_id" value="<%= session.getAttribute("userId") %>"> --%>
            <div class="form-group">
                <label for="cita_id">ID del usuario</label>
                <input type="number" class="form-control" id="user_id" name="user_id" placeholder="Ingrese el ID del usuario  que desea eliminar" required>
            </div>
            <button type="submit" class="btn btn-danger">Eliminar Cita</button>
            <a href="indexUserAdmin.jsp" class="btn btn-secondary mt-3">Volver</a>
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
