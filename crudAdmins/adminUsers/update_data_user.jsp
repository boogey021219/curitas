<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean userFound = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");

        if (request.getParameter("search") != null && id != null && !id.isEmpty()) {
            String sql = "SELECT * FROM usuarios WHERE id = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                userFound = true;
            }
        }

        if (userFound) {
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Actualizar Usuario</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    
        <div class="row no-gutters">
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <div class="text-center">
                    <img class="user img-fluid" src="https://i.ibb.co/yVGxFPR/2.png" alt="User Image">
                    <h3 class="mt-3">Actualiza tus Datos</h3>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card-body">
                    <form action="success.jsp" method="post">
                        <!-- ID del usuario no editable -->
                        <div class="form-group">
                            <input class="form-control" type="text" name="id" value="<%= rs.getString("id") %>" readonly>
                        </div>
                        
                        <!-- Tipo de Documento -->
                        <div class="form-group">
                            <select class="form-control" name="tipo_documento" required>
                                <option value="" disabled>Seleccione Tipo de Documento</option>
                                <option value="TI" <%= "TI".equals(rs.getString("tipo_documento")) ? "selected" : "" %>>Tarjeta de Identidad (TI)</option>
                                <option value="CC" <%= "CC".equals(rs.getString("tipo_documento")) ? "selected" : "" %>>Cedula de Ciudadania (CC)</option>
                                <option value="CE" <%= "CE".equals(rs.getString("tipo_documento")) ? "selected" : "" %>>Cedula de Extranjeria (CE)</option>
                            </select>
                        </div>

                        <!-- Nombre Completo -->
                        <div class="form-group">
                            <input class="form-control" type="text" name="nombre" value="<%= rs.getString("nombre") %>" placeholder="Nombre Completo" required>
                        </div>
                        
                        <!-- Email -->
                        <div class="form-group">
                            <input class="form-control" type="email" name="email" value="<%= rs.getString("email") %>" placeholder="Email" required>
                        </div>

                        <!-- Contraseña -->
                        <div class="form-group">
                            <input class="form-control" type="password" name="passwd" value="<%= rs.getString("passwd") %>" placeholder="Contrasena" readonly>
                        </div>

                        <!-- Confirmar Contraseña -->
                        <div class="form-group">
                            <input class="form-control" type="password" name="confirmar_passwd" placeholder="Confirmar Contrasena" readonly>
                        </div>

                        <!-- Genero -->
                        <div class="form-group">
                            <label>Genero</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genero" id="masculino" value="Masculino" <%= "Masculino".equals(rs.getString("genero")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="masculino">Masculino</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genero" id="femenino" value="Femenino" <%= "Femenino".equals(rs.getString("genero")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="femenino">Femenino</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genero" id="otro" value="Otro" <%= "Otro".equals(rs.getString("genero")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="otro">Otro</label>
                            </div>
                        </div>
                        <!-- Estado de Afiliacion -->
<!-- Estado de Afiliacion -->
<div class="form-group">
    <label>Estado de Afiliacion</label><br>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="tipo_afiliacion" id="contributivo" value="Contributivo" <%= "Contributivo".equals(rs.getString("tipo_afiliacion")) ? "checked" : "" %> required>
        <label class="form-check-label" for="contributivo">Contributivo</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="tipo_afiliacion" id="subsidiado" value="Subsidiado" <%= "Subsidiado".equals(rs.getString("tipo_afiliacion")) ? "checked" : "" %> required>
        <label class="form-check-label" for="subsidiado">Subsidiado</label>
    </div>
</div>



                        <!-- Estado Civil -->
                        <div class="form-group">
                            <label>Estado Civil</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="estado_civil" id="soltero" value="Soltero" <%= "Soltero".equals(rs.getString("estado_civil")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="soltero">Soltero</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="estado_civil" id="casado" value="Casado" <%= "Casado".equals(rs.getString("estado_civil")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="casado">Casado</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="estado_civil" id="divorciado" value="Divorciado" <%= "Divorciado".equals(rs.getString("estado_civil")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="divorciado">Divorciado</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="estado_civil" id="viudo" value="Viudo" <%= "Viudo".equals(rs.getString("estado_civil")) ? "checked" : "" %> required>
                                <label class="form-check-label" for="viudo">Viudo</label>
                            </div>
                        </div>
                    <!-- Fecha de Nacimiento -->
                        <div class="form-group">
                            <input class="form-control" type="date" name="fecha_nacimiento" value="<%= rs.getString("fecha_nacimiento") %>" placeholder="Fecha de Nacimiento" required>
                        </div>
                        <!-- Telefono -->
                        <div class="form-group">
                            <input class="form-control" type="text" name="telefono" value="<%= rs.getString("telefono") %>" placeholder="Telefono" required>
                        </div>
                    
                        <!-- Direccion -->
                        <div class="form-group">
                            <input class="form-control" type="text" name="direccion" value="<%= rs.getString("direccion") %>" placeholder="Direccion" required>
                        </div>

    <!-- Botón de Enviar -->
    <button class="btn btn-primary" type="submit">Actualizar Datos</button>
</form>

                </div>
            
        </div>
    </div>
     <a href="indexUserAdmin.jsp" class="btn btn-secondary mt-3">Volver</a>
</div>
</body>
</html>
<%
        } else {
%>
        <p>No se encontró el usuario con ID <%= id %>.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conexion != null) conexion.close(); } catch (SQLException e) {}
    }
%>
