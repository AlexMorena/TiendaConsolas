

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR INICIO DE SESION</title>
        <style>
            body{
                background-color: black;
            }

            h1{
                color: white;
                text-align: center;
            }

            button {
                background-color: #3498DB; 
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                margin-left: 27%;
            }
            
            a {
                text-decoration: none;
            }

            button:hover {
                background-color: #2980B9; 
            }
        </style>
    </head>
    <body>
        <h1>ERROR: Contraseña o usuario incorrecto</h1>
        <h2>Vuelvalo a intentar</h2>
        <br><br>
        <button><a href="formularioLogin.jsp">Volver a intentarlo</a></button>
        <button><a href="index.html">Volver al inicio</a></button>
    </body>
</html>
