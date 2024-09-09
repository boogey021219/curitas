<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Verificar si la sesión está disponible sin crear una nueva si no existe
    HttpSession userSession = request.getSession(false);  // Renombramos 'session' a 'userSession'

    // Verificar si la sesión es nula o si no tiene el atributo 'userId'
    if (userSession == null || userSession.getAttribute("userId") == null) {
        out.println("<div class='alert alert-danger'>No se pudo acceder a la sesión o ID del usuario.</div>");
        return;
    }

    // Obtener el ID del usuario de la sesión
    Integer userIdInt = (Integer) userSession.getAttribute("userId");
String userId = userIdInt != null ? userIdInt.toString() : null;
  // Renombramos 'id' a 'userId'

    // Verificar si el ID está presente en la sesión
    if (userId == null || userId.isEmpty()) {
        out.println("<div class='alert alert-danger'>El ID del usuario no está disponible.</div>");
        return;
    }

    // Obtención de datos del formulario, eliminamos posibles duplicados de variables
    String tipo_documento = request.getParameter("tipo_documento");  
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");
    String genero = request.getParameter("genero");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String estado_civil = request.getParameter("estado_civil");
    String fecha_nacimiento = request.getParameter("fecha_nacimiento");
    String estado_afiliacion = request.getParameter("estado_afiliacion");

    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

        // Verificar si todos los campos necesarios están presentes
        if (tipo_documento != null && !tipo_documento.isEmpty() &&  
            nombre != null && !nombre.isEmpty() && 
            email != null && !email.isEmpty() && 
            genero != null && !genero.isEmpty() && 
            telefono != null && !telefono.isEmpty() && 
            direccion != null && !direccion.isEmpty() && 
            estado_civil != null && !estado_civil.isEmpty() && 
            fecha_nacimiento != null && !fecha_nacimiento.isEmpty() && 
            estado_afiliacion != null && !estado_afiliacion.isEmpty()) {

            // SQL para actualizar datos del usuario sin modificar ID ni contraseñas
            String sql = "UPDATE usuarios SET tipo_documento=?, nombre=?, email=?, genero=?, telefono=?, direccion=?, fecha_nacimiento=?, tipo_afiliacion=?, estado_civil=? WHERE id=?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, tipo_documento);
            pstmt.setString(2, nombre);
            pstmt.setString(3, email);
            pstmt.setString(4, genero);
            pstmt.setString(5, telefono);
            pstmt.setString(6, direccion);
            pstmt.setString(7, fecha_nacimiento);
            pstmt.setString(8, estado_afiliacion);
            pstmt.setString(9, estado_civil);
            pstmt.setString(10, userId);

            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                // Redirigir a la página de menú con mensaje de éxito
                response.sendRedirect("../login/user/inicioUsers.jsp?update=success");
            } else {
                out.println("<div class='alert alert-danger'>Error al actualizar los datos.</div>");
            }
        } else {
            out.println("<div class='alert alert-danger'>Complete todos los campos.</div>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Se produjo un error: " + e.getMessage() + "</div>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conexion != null) conexion.close();
    }
%>

