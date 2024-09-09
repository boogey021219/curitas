<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

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

            // Preparar la sentencia SQL para buscar al empleado
            String sql = "SELECT * FROM empleados WHERE email = ? AND passwd = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);

            // Ejecutar la consulta
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Guardar el correo electrónico y el ID del administrador en la sesión
                session.setAttribute("adminEmail", rs.getString("email"));
                session.setAttribute("adminId", rs.getInt("id"));
                response.sendRedirect("inicioAdmin.jsp");  // Redirigir a la página de administrador
            } else {
                // Preparar la sentencia SQL para buscar al usuario
                sql = "SELECT * FROM usuarios WHERE email = ? AND passwd = ?";
                pstmt = conexion.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, passwd);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Guardar el correo electrónico y el ID del usuario en la sesión
                    session.setAttribute("userEmail", rs.getString("email"));
                    session.setAttribute("userId", rs.getInt("id"));
                    response.sendRedirect("inicioUsers.jsp");  // Redirigir a la página de usuario
                } else {
                    // Redirigir con mensaje de error
                    response.sendRedirect("LoginAdmin.html?mensaje=error");
                }
            }
        } catch (ClassNotFoundException e) {
            response.sendRedirect("LoginAdmin.html?mensaje=driverError");
        } catch (SQLException e) {
            response.sendRedirect("LoginAdmin.html?mensaje=dbError");
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException e) { /* Log error */ } }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) { /* Log error */ } }
            if (conexion != null) { try { conexion.close(); } catch (SQLException e) { /* Log error */ } }
        }
    } else {
        // Redirigir con mensaje de campos vacíos
        response.sendRedirect("LoginAdmin.html?mensaje=error");
    }
%>
