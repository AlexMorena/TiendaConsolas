<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Bienvenido Administrador!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilosIndex.css"/>
    </head>
    <body>
        <div id="encabezado">
            <button id="logearte"><a href='index.html'>Cerrar sesion</a></button>
            <h1>Bienvenido a la tienda de consolas de 2ºDAW</h1>
            <h4>Sesion iniciada como Administrador</h4>
        </div>
        <br><br>
        <div id="cuerpo">
            <h3>Opciones</h3>
            <button><a href="decisionAdmin.jsp">Insertar nuevos productos</a></button>
            <button><a href="decisionAdminEliminar.jsp">Eliminar productos</a></button>
            <button><a href="decisionAdminModificar.jsp">Modificar productos</a></button>
        </div>
    </body>
</html>
