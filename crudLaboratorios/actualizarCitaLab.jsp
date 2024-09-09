<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Obtener los datos del formulario
    String citaId = request.getParameter("cita_id");
    String usuarioId = request.getParameter("usuario_id");
    String fecha = request.getParameter("fecha");
    String hora = request.getParameter("hora");
    String tipoexam = request.getParameter("tipoexam");
    String estado = request.getParameter("estado");

    String mensaje = "";

    // Validar que todos los campos estén completos
    if (citaId != null && !citaId.isEmpty() &&
        usuarioId != null && !usuarioId.isEmpty() &&
        fecha != null && !fecha.isEmpty() &&
        hora != null && !hora.isEmpty() &&
        tipoexam != null && !tipoexam.isEmpty() &&
        estado != null && !estado.isEmpty()) {

        Connection conexion = null;
        PreparedStatement pstmt = null;

        try {
            // Cargar el controlador MySQL
            Class.forName("com.mysql.jdbc.Driver");

            // Establecer la conexión
            conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/curitas",
                "root",
                "");

            // Preparar la sentencia SQL
            String sql = "UPDATE citaslaboratorio SET fecha = ?, hora = ?, tipo_prueba = ?, estado = ? " +
                         "WHERE id = ? AND usuario_id = ?";

            pstmt = conexion.prepareStatement(sql);
            pstmt.setDate(1, java.sql.Date.valueOf(fecha));
            pstmt.setTime(2, java.sql.Time.valueOf(hora + ":00"));
            pstmt.setString(3, tipoexam);
            pstmt.setString(4, estado);
            pstmt.setInt(5, Integer.parseInt(citaId));
            pstmt.setInt(6, Integer.parseInt(usuarioId));

            // Ejecutar la actualización
            int filasActualizadas = pstmt.executeUpdate();
            if (filasActualizadas > 0) {
                mensaje = "La cita médica fue actualizada satisfactoriamente.";
                response.sendRedirect("listar_citas_lab.jsp?cita=actualizada");
            } else {
                mensaje = "No se pudo actualizar la cita médica. Verifique el ID de la cita y del usuario.";
            }

        } catch (ClassNotFoundException e) {
            mensaje = "Error en la carga del driver: " + e.getMessage();
        } catch (SQLException e) {
            mensaje = "Error accediendo a la base de datos: " + e.getMessage();
        } finally {
            // Cerrar recursos
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { mensaje = "Error cerrando la sentencia: " + e.getMessage(); }
            }
            if (conexion != null) {
                try { conexion.close(); } catch (SQLException e) { mensaje = "Error cerrando la conexión: " + e.getMessage(); }
            }
        }
    } else {
        mensaje = "Por favor, complete todos los campos.";
    }

    // Pasar el mensaje como atributo de solicitud
    request.setAttribute("mensaje", mensaje);
%>