<%-- 
    Document   : formularioInsertarConsola
    Created on : 8 ene 2025, 20:23:23
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Consola</title>
        <link rel="stylesheet" href="estilosFormularios.css"/>
    </head>
    <body>
        <%
            String decision = request.getParameter("lista");
            if ("consola".equals(decision)) {
                out.println("<form action='insertar' method='post'>");
                out.println("<h2 style='text-align: center'>Introduzca la consola a Insertar</h2>");
                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Potencia GPU</th>");
                out.println("<th>Potencia CPU</th>");
                out.println("<th>Compañia</th>");
                out.println("<th>Precio</th>");
                out.println("<th>Unidades Disponibles</th>");
                out.println("<th>Nombre Consola</th>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><input type='text' name='potenciaGPU'></td>");
                out.println("<td><input type='text' name='potenciaCPU'></td>");
                out.println("<td><input type='text' name='compania'></td>");
                out.println("<td><input type='text' name='precio'></td>");
                out.println("<td><input type='text' name='unidadesDisponibles'></td>");
                out.println("<td><input type='text' name='nombreConsola'></td>");
                out.println("<input type='hidden' name='decision' value='consola'>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><button id='Enviar Datos'>Enviar Datos</button></td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("</form>");
            } else {
                out.println("<h2 style='text-align: center'>Introduzca el juego a Insertar</h2>");
                out.println("<form action='insertar' method='post'>");
                out.println("<table>");
                out.println("<tr>");
                out.println("<th colspan='2'>Formulario de Juegos</th>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Nombre del Juego:</td>");
                out.println("<td><input type='text' name='nombreJuego'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Nombre de la Consola:</td>");
                out.println("<td><input type='text' name='nombreConsola'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Compañía Desarrolladora:</td>");
                out.println("<td><input type='text' name='companiaDesarrolladora'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Género del Juego:</td>");
                out.println("<td><input type='text' name='generoJuego'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Puntuación Metacritic:</td>");
                out.println("<td><input type='text' name='puntMetacritic'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Precio:</td>");
                out.println("<td><input type='text' name='precio'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>Unidades Disponibles:</td>");
                out.println("<td><input type='text' name='unidadesDisponibles'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td colspan='2' style='text-align: center;'>");
                out.println("<button type='submit' id='EnviarDatos'>Enviar Datos</button>");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("</form>");
            }
            out.println("<form>");
            out.println("<button class='Volver' style='margin-left: 40%'><a href='funcionalidadesAdm.jsp'>Volver atras</a></button>");
            out.println("</form>");
        %>
    </body>
</html>
