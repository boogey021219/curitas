<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Médico</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../css/lodeadentro.css">


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
            <a class="nav-link" href="../../../login/admin/inicioAdmin.jsp">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Medicos
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
              <a class="dropdown-item" href="crear_medico.jsp">Crear Medico</a>
              <a class="dropdown-item" href="listarMedicos.jsp">Listar Medicos</a>
              <a class="dropdown-item" href="updateMedico.jsp">Actualizar Medico</a>
              <a class="dropdown-item" href="eliminar_medico.jsp">Eliminar Medico</a>
            </div>
          </li>
           </li>
              <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="indexUserAdmin.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Usuarios
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="../newUsers.jsp">Registrar Usuario</a>
                <a class="dropdown-item" href="../updateUser.jsp">Modificar Usuario</a>
                <a class="dropdown-item" href="../eliminar_users.jsp">Eliminar Usuario</a>
                <a class="dropdown-item" href="../listUsers.jsp">Ver Usuarios</a>
              </div>
        </ul>
        <span class="navbar-text ml-auto">
            <%= session.getAttribute("userEmail") != null ? "Bienvenido, " + session.getAttribute("userEmail") : "Bienvenido, Invitado" %>
            <%= session.getAttribute("userId") != null ? " | ID: " + session.getAttribute("userId") : "" %>
            <a class="nav-link" href="../../../index.html">Log Out</a>
        </span>
      </div>
   </nav>

   <!-- Contenedor principal -->
   <div class="container mt-5">
       <h1>Eliminar Médico</h1>
       <form id="eliminarMedicoForm" action="procesarEliminarMedico.jsp" method="POST">
           <div class="form-group">
               <label for="medico_id">ID del Médico</label>
               <input type="number" class="form-control" id="medico_id" name="medico_id" placeholder="Ingrese el ID del médico que desea eliminar" required>
           </div>
           <button type="submit" class="btn btn-danger">Eliminar Médico</button>
           <a href="indexMedicos.jsp" class="btn btn-secondary mt-3">Volver</a>
       </form>
   </div>

   <!-- Modal de Mensaje -->
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