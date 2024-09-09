<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String tipo_documento = request.getParameter("tipo_documento");  
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");
    String confirmar_paswd = request.getParameter("confirmar_paswd");
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

        if (passwd != null && confirmar_paswd != null && passwd.equals(confirmar_paswd)) {
            if (id != null && !id.isEmpty() && 
                tipo_documento != null && !tipo_documento.isEmpty() &&  
                nombre != null && !nombre.isEmpty() && 
                email != null && !email.isEmpty() && 
                genero != null && !genero.isEmpty() && 
                telefono != null && !telefono.isEmpty() && 
                direccion != null && !direccion.isEmpty() && 
                estado_civil != null && !estado_civil.isEmpty() && 
                fecha_nacimiento != null && !fecha_nacimiento.isEmpty() && 
                estado_afiliacion != null && !estado_afiliacion.isEmpty()) {

                String sql = "INSERT INTO usuarios(id, tipo_documento, nombre, email, passwd, confirmar_paswd, genero, telefono, direccion, fecha_nacimiento, tipo_afiliacion, estado_civil) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conexion.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, tipo_documento);
                pstmt.setString(3, nombre);
                pstmt.setString(4, email);
                pstmt.setString(5, passwd);
                pstmt.setString(6, confirmar_paswd);
                pstmt.setString(7, genero);
                pstmt.setString(8, telefono);
                pstmt.setString(9, direccion);
                pstmt.setString(10, fecha_nacimiento);
                pstmt.setString(11, estado_afiliacion);
                pstmt.setString(12, estado_civil);

                int filasAfectadas = pstmt.executeUpdate();

                if (filasAfectadas > 0) {
                    // Redirigir a loginuser.jsp con un parámetro para mostrar el modal
                    response.sendRedirect("indexUserAdmin.jsp?registro=exito");
                } else {
                    out.println("<div class='alert alert-danger'>Error al registrar el usuario.</div>");
                }
            } else {
                out.println("<div class='alert alert-danger'>Complete todos los campos.</div>");
            }
        } else {
            out.println("<div class='alert alert-danger'>Las contraseñas no coinciden.</div>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Se produjo un error: " + e.getMessage() + "</div>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conexion != null) conexion.close();
    }
%>
