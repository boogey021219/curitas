<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href="../../css/lodeadentro.css">

<title>Admin/Users</title>
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
              
              </li>
              </ul>
                  <span class="navbar-text ml-auto">
                      <%= session.getAttribute("adminEmail") != null ? "Bienvenido, " + session.getAttribute("adminEmail") : "Bienvenido, Invitado" %>
                      <%= session.getAttribute("adminId") != null ? " | ID: " + session.getAttribute("adminId") : "" %>
                       <li class="nav-item">
                          <a class="nav-link" href="../../index.html">log out</a>
                      </li>
                    </span>
        </div>
      </nav>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <div class="text-center">
                <h3>Buscar Usuario</h3>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card-body">
                <form action="update_data_user.jsp" method="post">
                    <div class="form-group">
                        <p>Ingrese el Documento del usuario:</p>
                        <input class="form-control" type="text" name="id" placeholder="Documento" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="search" value="Buscar" class="btn btn-primary btn-block">
                    </div>
                </form>
            </div>
        </div>
    </div>
     <a href="indexUserAdmin.jsp" class="btn btn-secondary mt-3">Volver</a>
</div>
</body>
</html>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>