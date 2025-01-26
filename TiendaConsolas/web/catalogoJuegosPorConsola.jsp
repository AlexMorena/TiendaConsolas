

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ElegirConsola</title>
        <link rel="stylesheet" href="estilosFormularios.css"/>
    </head>
    <body>
        <form action="catalogoPorConsola" method="post">
            <table>
                <tr>
                    <td class="centrar">Selecciona una consola para consultar su catalogo de juegos</td>
                </tr>
                <tr>
                    <td><select name="lista" class="centrar">
                            <option value="1">Xbox One</option>
                            <option value="2">Xbox Series X</option>
                            <option value="3">Xbox Series S</option>
                            <option value="4">Nintendo Switch</option>
                            <option value="5">Nintendo Switch Lite</option>
                            <option value="6">PS4</option>
                            <option value="7">PS5 con CD</option>
                            <option value="8">PS5 sin CD</option>
                        </select></td>
                </tr>
                <tr>
                    <td><button id="Enviar Datos">Enviar Datos</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
