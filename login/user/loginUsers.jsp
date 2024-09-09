<%-- <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>

<%
    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");
    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String mensaje = "";

    if (email != null && !email.isEmpty() && passwd != null && !passwd.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/curitas",
                "root",
                "");

            // Seleccionar también el ID del usuario
            String sql = "SELECT id, email FROM usuarios WHERE email = ? AND passwd = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Guardar el correo electrónico y el ID en la sesión
                session.setAttribute("userEmail", rs.getString("email"));
                session.setAttribute("userId", rs.getInt("id"));
                response.sendRedirect("inicioUsers.jsp");
            } else {
                mensaje = "Correo o contraseña incorrectos.";
            }
        } catch (ClassNotFoundException e) {
            mensaje = "Error en la carga del driver: " + e.getMessage();
        } catch (SQLException e) {
            mensaje = "Error accediendo a la base de datos: " + e.getMessage();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException e) { mensaje = "Error cerrando el ResultSet: " + e.getMessage(); } }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { mensaje = "Error cerrando la sentencia: " + e.getMessage(); } }
            if (conexion != null) { try { conexion.close(); } catch (SQLException e) { mensaje = "Error cerrando la conexión: " + e.getMessage(); } }
        }
    } else {
        mensaje = "Por favor, ingrese su correo y contraseña.";
    }
%>

<% if (!mensaje.isEmpty()) { %>
    <div class="alert <%= (mensaje.contains("Bienvenido")) ? "alert-success" : "alert-danger" %>" role="alert">
        <%= mensaje %>
    </div>
<% } %> --%>


<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>

<%
    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");
    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if (email != null && !email.isEmpty() && passwd != null && !passwd.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/curitas",
                "root",
                "");

            // Seleccionar también el ID del usuario
            String sql = "SELECT id, email FROM usuarios WHERE email = ? AND passwd = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Guardar el correo electrónico y el ID en la sesión
                session.setAttribute("userEmail", rs.getString("email"));
                session.setAttribute("userId", rs.getInt("id"));
                response.sendRedirect("inicioUsers.jsp");
            } else {
                // Redirigir con mensaje de error
                response.sendRedirect("?mensaje=error");
            }
        } catch (ClassNotFoundException e) {
            response.sendRedirect("LoginUsers.html?mensaje=driverError");
        } catch (SQLException e) {
            response.sendRedirect("LoginUsers.html?mensaje=dbError");
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException e) { /* Log error */ } }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { /* Log error */ } }
            if (conexion != null) { try { conexion.close(); } catch (SQLException e) { /* Log error */ } }
        }
    } else {
        // Redirigir con mensaje de campos vacíos
        response.sendRedirect("LoginUsers.html?mensaje=error");
    }
%>

