<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String mensaje = "";
    String medicoId = request.getParameter("medico_id");
    
    if (medicoId != null && !medicoId.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/curitas", "root", "");
            
            String sql = "DELETE FROM medicos WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(medicoId));
            
            int filasAfectadas = pstmt.executeUpdate();
            
            if (filasAfectadas > 0) {
                mensaje = "El médico con ID " + medicoId + " ha sido eliminado exitosamente.";
            } else {
                mensaje = "No se encontró un médico con el ID " + medicoId + ".";
            }
        } catch (Exception e) {
            mensaje = "Error al eliminar el médico: " + e.getMessage();
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    } else {
        mensaje = "Por favor, proporcione un ID de médico válido.";
    }
    
    request.setAttribute("mensaje", mensaje);
    request.getRequestDispatcher("eliminar_medico.jsp").forward(request, response);
%>