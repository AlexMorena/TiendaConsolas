
<%@page import="despliegue.tienda.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprobar Admin</title>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            boolean confirmado = false;
            Conexion miConexion = new Conexion();
            boolean admin = miConexion.serAdmin(usuario);
            miConexion.hacerLogin(usuario, password, admin);
            if (miConexion.hacerLogin(usuario, password, admin)) {
                if (admin) {
                    response.sendRedirect("funcionalidadesAdm.jsp");
                } else {
                    response.sendRedirect("funcionalidadesUsuario.jsp");
                }
            } else {
                response.sendRedirect("errorInicioSesion.jsp");
            }

        %>
    </body>
</html>
