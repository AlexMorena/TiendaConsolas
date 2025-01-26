

<%@page import="java.io.PrintWriter"%>
<%@page import="despliegue.tienda.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gracias por comprar</title>
        <link rel="stylesheet" href="estilos.css"/>
    </head>
    <body>
        <%
            try {
                Conexion miConexion = new Conexion();
                String venta = request.getParameter("si");
                String nombreConsola = request.getParameter("nombreConsola");
                if (venta != null) {
                    miConexion.venderConsola(nombreConsola);
                    out.println("<h1 style='text-align: center'>Consola vendida</h1>");
                } else {
                    out.println("<h1 style='text-align: center'>No se ha vendido la consola</h1>");
                }
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
        <button><a href="informacionConsolas">Volver atras</a></button>
    </body>
</html>
