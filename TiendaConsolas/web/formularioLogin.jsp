<%-- 
    Document   : formularioLogin
    Created on : 8 ene 2025, 18:18:09
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="estilosFormularios.css"/>
    </head>
    <body>

        <form action="comprobarAdmin.jsp" method="post">
            <h1 class='centrar'>Formulario Login</h1>
            <table>
                <tr>
                    <td>Nombre de usuario: <input type='text' name='usuario'></td>
                </tr>
                <br><br>
                <tr>
                    <td>Contraseña: <input type='text' name='password'></td>
                </tr>
                <tr>
                    <td><button name='Enviar'>Enviar Datos</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
