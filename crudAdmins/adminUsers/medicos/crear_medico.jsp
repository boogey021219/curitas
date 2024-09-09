<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Registro de Médicos Curitas EPS"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../../css/lodeadentro.css">

    <title>Registrar Medico Curitas EPS</title>
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

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <div class="text-center">
                                        <img class="use img-fluid" src="../../../IMG/perfil2.jpg" style="border-radius: 80px; width=200px; height=200px"alt="User Image">

                    <h3>Registrar Medico</h3>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card-body">
                    <form action="crearMedicoNew.jsp" method="post">
                        <div class="form-group">
                            <label>ID:</label>
                            <input class="form-control" type="text" name="id" placeholder="ID del Medico" required>
                        </div>
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input class="form-control" type="text" name="nombre" placeholder="Nombre del Medico" required>
                        </div>
                        <div class="form-group">
                            <label>Especialidad:</label>
                            <input class="form-control" type="text" name="especialidad" placeholder="Especialidad" required>
                        </div>
                        <div class="form-group">
                            <label>Telefono:</label>
                            <input class="form-control" type="text" name="telefono" placeholder="Telefono" required>
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <input class="form-control" type="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="form-group">
                            <label>Fecha de Contratacion:</label>
                            <input class="form-control" type="date" name="fecha_contratacion" placeholder="Fecha de Contratación" required>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Registrar" class="btn btn-primary btn-block">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <a href="indexMedicos.jsp" class="btn btn-secondary mt-3">Volver</a>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
