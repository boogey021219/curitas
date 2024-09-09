<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Obtener los datos del formulario
    String usuarioId = request.getParameter("usuario_id");
    String fecha = request.getParameter("fecha");
    String hora = request.getParameter("hora");
    String descripcion = request.getParameter("descripcion");
    String estado = request.getParameter("estado");

    String mensaje = "";

    // Validar que todos los campos estén completos
    if (usuarioId != null && !usuarioId.isEmpty() &&
        fecha != null && !fecha.isEmpty() &&
        hora != null && !hora.isEmpty() &&
        descripcion != null && !descripcion.isEmpty() &&
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
            String sql = "INSERT INTO citasmedicogeneral (usuario_id, fecha, hora, descripcion, estado) " +
                         "VALUES (?, ?, ?, ?, ?)";

            pstmt = conexion.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(usuarioId));
            pstmt.setDate(2, java.sql.Date.valueOf(fecha));
            
            // Manejo de errores en la conversión de hora
            try {
                pstmt.setTime(3, java.sql.Time.valueOf(hora + ":00")); // Asegúrate de que el formato sea HH:mm:ss
            } catch (IllegalArgumentException e) {
                mensaje = "El formato de la hora es incorrecto. Debe ser HH:mm:ss.";
            }
            
            pstmt.setString(4, descripcion);
            pstmt.setString(5, estado);

            // Ejecutar la inserción
            if (mensaje.isEmpty()) {
                int filas = pstmt.executeUpdate();
                if (filas > 0) {
                    mensaje = "La cita médica fue creada satisfactoriamente.";
                    response.sendRedirect("solicitudesCitas.jsp?cita=creada");  // Redirige a la página principal o a otra página
                } else {
                    mensaje = "No se pudo crear la cita médica.";
                }
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