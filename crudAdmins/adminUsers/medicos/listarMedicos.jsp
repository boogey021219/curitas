<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="Description" content="Listado de médicos"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../css/lodeadentro.css">

    <title>Listado de Medicos</title>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">EPS Curitas</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="../../../login/admin/inicioAdmin.jsp">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Medicos
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
              <a class="dropdown-item" href="crear_medico.jsp">Crear Medico</a>
              <a class="dropdown-item" href="listarMedicos.jsp">Listar Medicos</a>
              <a class="dropdown-item" href="updateMedico.jsp">Actualizar Medico</a>
              <a class="dropdown-item" href="eliminar_medico.jsp">Eliminar Medico</a>
            </div>
          </li>
           </li>
              <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="indexUserAdmin.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Usuarios
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="../newUsers.jsp">Registrar Usuario</a>
                <a class="dropdown-item" href="../updateUser.jsp">Modificar Usuario</a>
                <a class="dropdown-item" href="../eliminar_users.jsp">Eliminar Usuario</a>
                <a class="dropdown-item" href="../listUsers.jsp">Ver Usuarios</a>
              </div>
        </ul>
        <span class="navbar-text ml-auto">
            <%= session.getAttribute("userEmail") != null ? "Bienvenido, " + session.getAttribute("userEmail") : "Bienvenido, Invitado" %>
            <%= session.getAttribute("userId") != null ? " | ID: " + session.getAttribute("userId") : "" %>
            <a class="nav-link" href="../../../index.html">Log Out</a>
        </span>
      </div>
   </nav>

   <div class="container mt-4">
       <h2 class="mb-4">Listado de Medicos</h2>

       <table class="table table-striped mt-4">
           <thead>
               <tr>
                   <th>ID</th>
                   <th>Nombre</th>
                   <th>Especialidad</th>
                   <th>Telefono</th>
                   <th>Email</th>
                   <th>Fecha de Contratación</th>
               </tr>
           </thead>
           <tbody>
               <% 
               Connection conn = null;
               Statement stmt = null;
               ResultSet rs = null;
               String jdbcURL = "jdbc:mysql://localhost:3306/curitas";
               String dbUser = "root";
               String dbPassword = "";

               try {
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                   String sql = "SELECT * FROM medicos";
                   stmt = conn.createStatement();
                   rs = stmt.executeQuery(sql);

                   boolean hasResults = false;
                   while (rs.next()) {
                       hasResults = true;
               %>
                       <tr>
                           <td><%= rs.getInt("id") %></td>
                           <td><%= rs.getString("nombre") %></td>
                           <td><%= rs.getString("especialidad") %></td>
                           <td><%= rs.getString("telefono") %></td>
                           <td><%= rs.getString("email") %></td>
                           <td><%= rs.getDate("fecha_contratacion") %></td>
                       </tr>
               <% 
                   }
                   if (!hasResults) {
               %>
                       <tr>
                           <td colspan="6" class="text-center">No se encontraron médicos registrados.</td>
                       </tr>
               <% 
                   }
               } catch (Exception e) {
                   e.printStackTrace();
                   out.println("<tr><td colspan='6' class='text-center'>Error: " + e.getMessage() + "</td></tr>");
               } finally {
                   if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                   if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                   if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
               }
               %>
           </tbody>
       </table>

       <div>
           <a href="indexMedicos.jsp" class="btn btn-secondary mt-3">Volver</a>
       </div>
   </div>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>