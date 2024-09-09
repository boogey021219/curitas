<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
              <link rel="stylesheet" href="../css/lodeadentro.css">

      <title>eliminar cita laboratorio</title>
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


    <div class="container mt-5">
        <h1>Eliminar Cita Médica</h1>
        <%
            String usuarioId = request.getParameter("usuario_id");
            String citaId = request.getParameter("cita_id");
            String mensaje = "";
            boolean citaExiste = false;
            boolean mostrarConfirmacion = false;

            if (usuarioId != null && !usuarioId.isEmpty() && citaId != null && !citaId.isEmpty()) {
                Connection conexion = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

                    // Verificar si la cita existe y pertenece al usuario
                    String sqlVerificar = "SELECT * FROM citaslaboratorio WHERE id = ? AND usuario_id = ?";
                    pstmt = conexion.prepareStatement(sqlVerificar);
                    pstmt.setInt(1, Integer.parseInt(citaId));
                    pstmt.setInt(2, Integer.parseInt(usuarioId));
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        citaExiste = true;
                        mostrarConfirmacion = true;
                    } else {
                        mensaje = "La cita no existe o no pertenece a este usuario.";
                    }

                    // Si se ha confirmado la eliminación
                    if ("true".equals(request.getParameter("confirmar"))) {
                        String sqlEliminar = "DELETE  FROM citaslaboratorio WHERE id = ? AND usuario_id = ?";
                        pstmt = conexion.prepareStatement(sqlEliminar);
                        pstmt.setInt(1, Integer.parseInt(citaId));
                        pstmt.setInt(2, Integer.parseInt(usuarioId));
                        int filasAfectadas = pstmt.executeUpdate();

                        if (filasAfectadas > 0) {
                            mensaje = "La cita ha sido eliminada con éxito.";
                        } else {
                            mensaje = "No se pudo eliminar la cita.";
                        }
                        mostrarConfirmacion = false;
                    }
                } catch (Exception e) {
                    mensaje = "Error: " + e.getMessage();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
                    if (conexion != null) try { conexion.close(); } catch (SQLException e) { }
                }
            } else {
                mensaje = "Parámetros inválidos.";
            }
        %>
    
        <form action="eliminarlab.jsp" method="POST">
            <input type="hidden" name="usuario_id" value="<%= usuarioId %>">
            <div class="form-group">
                <label for="cita_id">ID de la Cita</label>
                <input type="number" class="form-control" id="cita_id" name="cita_id" value="<%= citaId != null ? citaId : "" %>" placeholder="Ingrese el ID de la cita que desea eliminar" required>
            </div>
            <%
                if (!mensaje.isEmpty()) {
            %>
            <div class="alert alert-info mt-3"><%= mensaje %></div>
            <%
                }
            %>
            <%
                if (mostrarConfirmacion) {
            %>
            <div class="alert alert-warning mt-3">
                ¿Está seguro de que desea eliminar la cita con ID <%= citaId %>?
                <br>
                <button type="submit" class="btn btn-danger mt-2" name="confirmar" value="true">Confirmar eliminación</button>
                <a href="solicitudesLaboratorios.jsp" class="btn btn-secondary mt-2">Cancelar</a>
            </div>
            <%
                } else {
            %>
            <button type="submit" class="btn btn-danger">Eliminar Cita</button>
            <a href="solicitudesLaboratorios.jsp" class="btn btn-secondary mt-3">Volver</a>
            <%
                }
            %>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
