<%-- 
    Document   : juegoVendido
    Created on : 7 ene 2025, 17:53:07
    Author     : Administrador
--%>

<%@page import="despliegue.tienda.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gracias!</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
           <%
            try {
                Conexion miConexion = new Conexion();
                String venta = request.getParameter("si");
                String idJuego = request.getParameter("idJuego");
                if (venta != null) {
                    miConexion.venderJuego(idJuego);
                    out.println("<h1 style='text-align: center'>Juego vendido</h1>");
                } else {
                    out.println("<h1 style='text-align: center'>No se ha vendido el juego</h1>");
                }
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
        <button><a href="index.html">Volver atrás</a></button>
    </body>
</html>
