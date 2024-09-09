<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Obtener los parámetros del formulario
    String id = request.getParameter("id");
    String tipoDocumento = request.getParameter("tipo_documento");
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");
    String genero = request.getParameter("genero");
    String tipoAfiliacion = request.getParameter("tipo_afiliacion");
    String estadoCivil = request.getParameter("estado_civil");
    String fechaNacimiento = request.getParameter("fecha_nacimiento");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");

    Connection conexion = null;
    PreparedStatement pstmt = null;
    String mensaje = "";

    try {
        // Establecer conexión con la base de datos
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

        // Crear la sentencia SQL para actualizar los datos del usuario
        String sql = "UPDATE usuarios SET tipo_documento=?, nombre=?, email=?, genero=?, tipo_afiliacion=?, estado_civil=?, fecha_nacimiento=?, telefono=?, direccion=? WHERE id=?";
        pstmt = conexion.prepareStatement(sql);
        pstmt.setString(1, tipoDocumento);
        pstmt.setString(2, nombre);
        pstmt.setString(3, email);
        pstmt.setString(4, genero);
        pstmt.setString(5, tipoAfiliacion);
        pstmt.setString(6, estadoCivil);
        pstmt.setString(7, fechaNacimiento);
        pstmt.setString(8, telefono);
        pstmt.setString(9, direccion);
        pstmt.setString(10, id);

        // Ejecutar la actualización
        int filasActualizadas = pstmt.executeUpdate();

        if (filasActualizadas > 0) {
            // Redirigir a otra página si se actualizó correctamente
            response.sendRedirect("updateUser.jsp?mensaje=Actualización exitosa");
        } else {
            mensaje = "No se encontró el usuario con ID " + id;
        }
    } catch (Exception e) {
        e.printStackTrace();
        mensaje = "Error al actualizar los datos del usuario";
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
