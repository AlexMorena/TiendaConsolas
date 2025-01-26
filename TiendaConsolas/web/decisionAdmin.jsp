<%-- 
    Document   : decisionAdmin
    Created on : 8 ene 2025, 19:54:54
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eleccion</title>
        <link rel="stylesheet" href="estilosFormularios.css"/>
    </head>
    <body>
        <form action='formularioInsertarConsola.jsp' method="post">
            <table>
                <tr>
                    <td><h4>Que producto desea insertar</h4></td>
                </tr>
                <tr>
                    <td>
                        <select name='lista' class="centrar">
                            <option value='consola'>Consola</option>
                            <option value='juego'>Juego</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><button id='Enviar Datos'>Enviar Datos</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
