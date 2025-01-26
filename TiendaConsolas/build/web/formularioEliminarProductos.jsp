

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Productos</title>
        <link rel="stylesheet" href="estilosFormularios.css"/>
    </head>
    <body>
        <%
            String decision = request.getParameter("lista");
            if ("consola".equals(decision)) {
                out.println("<h2 style='text-align: center'>Introduzca la consola a Eliminar</h2>");
                out.println("<form action='eliminar' method='post'>");
                out.println("<table>");
                out.println("<tr>");
                out.println("<th>ID Consola</th>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><input type='number' name='idConsola'></td>");
                out.println("<input type='hidden' name='decision' value='consola'>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><button id='Enviar Datos'>Enviar Datos</button></td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("</form>");
            } else {
                out.println("<h2 style='text-align: center'>Introduzca el juego a Eliminar</h2>");
                out.println("<form action='eliminar' method='post'>");
                out.println("<table>");
                out.println("<td>ID Juego: </td>");
                out.println("<td><input type='number' name='idJuego'></td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><button type='submit' id='EnviarDatos'>Enviar Datos</button><td>");
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
