<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
        String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String tipo_de_documento = request.getParameter("tipo_de_documento");
    String cargo = request.getParameter("cargo");
    String genero = request.getParameter("genero");
    String fecha_de_nacimiento = request.getParameter("fecha_de_nacimiento");
    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");
    String confirmar_paswd = request.getParameter("confirmar_paswd");
    String departamento_area = request.getParameter("departamento_area");
    String fecha_inicio = request.getParameter("fecha_inicio");
    String tipo_contrato = request.getParameter("tipo_contrato");
    String horas_trabajo = request.getParameter("horas_trabajo");

    String mensaje = "";

    // Validar contraseñas
    if (passwd != null && confirmar_paswd != null && passwd.equals(confirmar_paswd)) {
        // Validar otros campos
        if (id != null && !id.isEmpty() && nombre != null && !nombre.isEmpty() &&
            email != null && !email.isEmpty() && tipo_de_documento != null && !tipo_de_documento.isEmpty() &&
            genero != null && !genero.isEmpty() && fecha_de_nacimiento != null && !fecha_de_nacimiento.isEmpty() &&
            departamento_area != null && !departamento_area.isEmpty() && fecha_inicio != null && !fecha_inicio.isEmpty() &&
            horas_trabajo != null && !horas_trabajo.isEmpty() && tipo_contrato != null && !tipo_contrato.isEmpty()) {

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
                String sql = "INSERT INTO empleados (id, nombre, tipo_de_documento, cargo, genero, fecha_de_nacimiento, email, passwd, confirmar_paswd, departamento_area, fecha_inicio, tipo_contrato, horas_trabajo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conexion.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, nombre);
                pstmt.setString(3, tipo_de_documento);
                pstmt.setString(4, cargo);
                pstmt.setString(5, genero);
                pstmt.setDate(6, java.sql.Date.valueOf(fecha_de_nacimiento)); // Convertir la fecha a formato SQL
                pstmt.setString(7, email);
                pstmt.setString(8, passwd);
                pstmt.setString(9, confirmar_paswd);
                pstmt.setString(10, departamento_area);
                pstmt.setDate(11, java.sql.Date.valueOf(fecha_inicio)); // Convertir la fecha a formato SQL
                pstmt.setString(12, tipo_contrato);
                pstmt.setInt(13, Integer.parseInt(horas_trabajo));

                int filas = pstmt.executeUpdate();
                              if (filas > 0) {
    mensaje = "El usuario fue registrado satisfactoriamente.";
    response.sendRedirect("LoginAdmin.html?registro=exitoso"); 
} else {
    mensaje = "No se pudo registrar el usuario.";
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
    } else {
        mensaje = "Las contraseñas no coinciden.";
    }
%>

<% if (!mensaje.isEmpty()) { %>
    <div class="alert <%= (mensaje.contains("satisfactoriamente")) ? "alert-success" : "alert-danger" %>" role="alert">
        <%= mensaje %>
    </div>
<% } %>
<div>
<a href="registerAdmin.html" class="btn btn-secondary mt-3">Volver</a>
</div>
