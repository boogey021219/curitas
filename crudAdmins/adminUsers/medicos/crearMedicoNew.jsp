<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String especialidad = request.getParameter("especialidad");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String fecha_contratacion = request.getParameter("fecha_contratacion");

    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

        if (id != null && !id.isEmpty() &&
            nombre != null && !nombre.isEmpty() &&
            especialidad != null && !especialidad.isEmpty() &&
            telefono != null && !telefono.isEmpty() &&
            email != null && !email.isEmpty() &&
            fecha_contratacion != null && !fecha_contratacion.isEmpty()) {

            String sql = "INSERT INTO medicos (id, nombre, especialidad, telefono, email, fecha_contratacion) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, nombre);
            pstmt.setString(3, especialidad);
            pstmt.setString(4, telefono);
            pstmt.setString(5, email);
            pstmt.setDate(6, Date.valueOf(fecha_contratacion));

            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                response.sendRedirect("indexMedicos.jsp?registro=exito");
            } else {
                out.println("<div class='alert alert-danger'>Error al registrar el médico.</div>");
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
