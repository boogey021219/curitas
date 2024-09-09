<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean medicoFound = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

        if (request.getParameter("search") != null && id != null && !id.isEmpty()) {
            String sql = "SELECT * FROM medicos WHERE id = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                medicoFound = true;
            }
        }

        if (medicoFound) {
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Actualizar Medico</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
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
                <a class="dropdown-item" href="crear_medico.jsp">Registrar Medico</a>
                <a class="dropdown-item" href="buscar_medico.jsp">Modificar Medico</a>
                <a class="dropdown-item" href="eliminar_medico.jsp">Eliminar Medico</a>
                <a class="dropdown-item" href="ver_medicos.jsp">Ver Medicos</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="indexUserAdmin.jsp" id="navbarDropdownUsuario" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Usuarios
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownUsuario">
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/newUsers.jsp">Registrar Usuario</a>
                <a class="dropdown-item" href="modificar_usuario.jsp">Modificar Usuario</a>
                <a class="dropdown-item" href="eliminar_usuario.jsp">Eliminar Usuario</a>
                <a class="dropdown-item" href="ver_usuarios.jsp">Ver Usuarios</a>
              </div>
            </li>
          </ul>
          <span class="navbar-text ml-auto">
              <%= session.getAttribute("adminEmail") != null ? "Bienvenido, " + session.getAttribute("adminEmail") : "Bienvenido, Invitado" %>
              <%= session.getAttribute("adminId") != null ? " | ID: " + session.getAttribute("adminId") : "" %>
              <a class="nav-link" href="../../index.html">log out</a>
          </span>
        </div>
    </nav>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <div class="text-center">
                <h3>Actualizar Medico</h3>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card-body">
                <form action="successMedico.jsp" method="post">
                    <!-- ID del médico no editable -->
                    <div class="form-group">
                        <input class="form-control" type="text" name="id" value="<%= rs.getString("id") %>" readonly>
                    </div>
                    
                    <!-- Nombre -->
                    <div class="form-group">
                        <label>Nombre:</label>
                        <input class="form-control" type="text" name="nombre" value="<%= rs.getString("nombre") %>" placeholder="Nombre del Médico" required>
                    </div>
                    
                    <!-- Especialidad -->
                    <div class="form-group">
                        <label>Especialidad:</label>
                        <input class="form-control" type="text" name="especialidad" value="<%= rs.getString("especialidad") %>" placeholder="Especialidad" required>
                    </div>
                    
                    <!-- Teléfono -->
                    <div class="form-group">
                        <label>Telefono:</label>
                        <input class="form-control" type="text" name="telefono" value="<%= rs.getString("telefono") %>" placeholder="Teléfono" required>
                    </div>
                    
                    <!-- Email -->
                    <div class="form-group">
                        <label>Email:</label>
                        <input class="form-control" type="email" name="email" value="<%= rs.getString("email") %>" placeholder="Email" required>
                    </div>
                    
                    <!-- Fecha de Contratación -->
                    <div class="form-group">
                        <label>Fecha de Contratacion:</label>
                        <input class="form-control" type="date" name="fecha_contratacion" value="<%= rs.getString("fecha_contratacion") %>" placeholder="Fecha de Contratación" required>
                    </div>
                    
                    <!-- Botón de Enviar -->
                    <button class="btn btn-primary" type="submit">Actualizar Datos</button>
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
<%
        } else {
%>
        <p>No se encontró el médico con ID <%= id %>.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conexion != null) conexion.close(); } catch (SQLException e) {}
    }
%>
