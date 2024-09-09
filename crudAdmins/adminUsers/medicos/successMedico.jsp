<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Obtener los parámetros del formulario
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String especialidad = request.getParameter("especialidad");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String fechaContratacion = request.getParameter("fecha_contratacion");

    Connection conexion = null;
    PreparedStatement pstmt = null;
    String mensaje = "";

    try {
        // Establecer conexión con la base de datos
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

        // Crear la sentencia SQL para actualizar los datos del médico
        String sql = "UPDATE medicos SET nombre=?, especialidad=?, telefono=?, email=?, fecha_contratacion=? WHERE id=?";
        pstmt = conexion.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, especialidad);
        pstmt.setString(3, telefono);
        pstmt.setString(4, email);
        pstmt.setString(5, fechaContratacion);
        pstmt.setString(6, id);

        // Ejecutar la actualización
        int filasActualizadas = pstmt.executeUpdate();

        if (filasActualizadas > 0) {
            // Redirigir a otra página si se actualizó correctamente
            response.sendRedirect("updateMedico.jsp?mensaje=Actualización exitosa");
        } else {
            mensaje = "No se encontró el médico con ID " + id;
        }
    } catch (Exception e) {
        e.printStackTrace();
        mensaje = "Error al actualizar los datos del médico";
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conexion != null) conexion.close(); } catch (SQLException e) {}
    }

    if (!mensaje.isEmpty()) {
%>
        <p><%= mensaje %></p>
<%
    }
%>
