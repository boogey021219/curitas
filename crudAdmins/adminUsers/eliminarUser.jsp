<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Usuario</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/lodeadentro.css">

</head>
<body>

<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <!-- ... (mantén el código de la barra de navegación sin cambios) ... -->
</nav>

<div class="container mt-5">
    <h1>Eliminar Usuario</h1>
    <%
        String usuarioId = request.getParameter("user_id");
        String mensaje = "";
        boolean usuarioExiste = false;
        boolean mostrarConfirmacion = false;

        if (usuarioId != null && !usuarioId.isEmpty()) {
            Connection conexion = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

                String sqlVerificar = "SELECT * FROM usuarios WHERE id = ?";
                pstmt = conexion.prepareStatement(sqlVerificar);
                pstmt.setInt(1, Integer.parseInt(usuarioId));
               
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    usuarioExiste = true;
                    mostrarConfirmacion = true;
                } else {
                    mensaje = "El usuario no existe.";
                }

                // Si se ha confirmado la eliminación
                if ("true".equals(request.getParameter("confirmar"))) {
                    String sqlEliminar = "DELETE FROM usuarios WHERE id = ?";
                    pstmt = conexion.prepareStatement(sqlEliminar);
                    pstmt.setInt(1, Integer.parseInt(usuarioId));
                    int filasAfectadas = pstmt.executeUpdate();

                    if (filasAfectadas > 0) {
                        mensaje = "El usuario ha sido eliminado con éxito.";
                    } else {
                        mensaje = "No se pudo eliminar el usuario.";
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

    <form action="eliminarUser.jsp" method="POST">
        <input type="hidden" name="user_id" value="<%= usuarioId %>">
        <div class="form-group">
            <label for="user_id">ID del Usuario</label>
            <input type="number" class="form-control" id="user_id" name="user_id" value="<%= usuarioId != null ? usuarioId : "" %>" placeholder="Ingrese el ID del usuario que desea eliminar" required>
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
            ¿Está seguro de que desea eliminar el usuario con el ID <%= usuarioId %>?
            <br>
            <button type="submit" class="btn btn-danger mt-2" name="confirmar" value="true">Confirmar eliminación</button>
            <a href="eliminarUser.jsp" class="btn btn-secondary mt-2">Cancelar</a>
        </div>
        <%
            } else {
        %>
        <button type="submit" class="btn btn-danger">Eliminar Usuario</button>
        <%
            }
        %>
    </form>
    <a href="indexUserAdmin.jsp" class="btn btn-secondary mt-3">Volver</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdeliv.com/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>