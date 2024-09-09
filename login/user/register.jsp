<%-- <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
 
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm-password");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    
    Connection conexion = null;
    PreparedStatement pstmt = null;
    String mensaje = "";

    // Validar que las contraseñas coincidan
    if (password != null && confirmPassword != null && password.equals(confirmPassword)) {
        if (name != null && !name.isEmpty() && email != null && !email.isEmpty() && gender != null && !gender.isEmpty() && dob != null && !dob.isEmpty() && address != null && !address.isEmpty()) {
            try {
                // Cargar el controlador MySQL
                Class.forName("com.mysql.jdbc.Driver");

                // Establecer la conexión
                conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/usuariodb",
                    "root",
                    "");

                // Preparar la sentencia SQL con parámetros
                String sql = "INSERT INTO usuarios (nombre, email, password, genero, fecha_nacimiento, direccion) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conexion.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                pstmt.setString(4, gender);
                pstmt.setDate(5, java.sql.Date.valueOf(dob)); // Convertir la fecha a formato SQL
                pstmt.setString(6, address);

                // Ejecutar la consulta
                int filas = pstmt.executeUpdate();

                if (filas > 0) {
                    mensaje = "El usuario fue insertado satisfactoriamente.";
                } else {
                    mensaje = "No se pudo insertar el usuario.";
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
<a href="menu.jsp" class="btn btn-secondary mt-3">Volver</a> </div> --%>