<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Description" content="Listado de Usuarios"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/lodeadentro.css">

    <title>Listado de Usuarios</title>
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
                <a class="nav-link" href="../../index.html">Cerrar sesión</a>
            </li>
        </span>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="mb-4">Listado de Usuarios</h2>

    <!-- Formulario para buscar usuarios -->
    <form method="get" action="bdUserList.jsp" class="mb-4">
        <div class="form-group">
            <label for="id">Buscar por ID de Usuario:</label>
            <input type="text" class="form-control" id="id" name="usuarioId" placeholder="Ingresa ID de usuario">
        </div>
        <button type="submit" class="btn btn-primary">Buscar</button>
    </form>

    <table class="table table-striped mt-4">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Género</th>
                <th>Teléfono</th>
                <th>Dirección</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String jdbcURL = "jdbc:mysql://localhost:3306/curitas"; // Cambia según tu configuración
            String dbUser = "root"; // Cambia según tu configuración
            String dbPassword = ""; // Cambia según tu configuración

            // Obtener el ID de usuario desde el parámetro enviado por el formulario
            String usuarioId = request.getParameter("usuarioId");
            try {
                // Conectar a la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                // Preparar la consulta SQL
                String sql;
                if (usuarioId != null && !usuarioId.trim().isEmpty()) {
                    sql = "SELECT * FROM usuarios WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, Integer.parseInt(usuarioId));
                } else {
                    sql = "SELECT * FROM usuarios";  // Mostrar todos los usuarios si no se proporciona un ID
                    pstmt = conn.prepareStatement(sql);
                }

                rs = pstmt.executeQuery();

                boolean hasResults = false;
                while (rs.next()) {
                    hasResults = true;
            %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("genero") %></td>
                        <td><%= rs.getString("telefono") %></td>
                        <td><%= rs.getString("direccion") %></td>
                    </tr>
            <% 
                }
                if (!hasResults) {
            %>
                    <tr>
                        <td colspan="6" class="text-center">No se encontraron usuarios.</td>
                    </tr>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='6' class='text-center'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
            %>
        </tbody>
    </table>

    <div>
        <a href="../../login/admin/inicioAdmin.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
