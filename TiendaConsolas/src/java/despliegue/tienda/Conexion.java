/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package despliegue.tienda;

import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;

/**
 *
 * @author Administrador
 */
public class Conexion {

    private Connection miConexion;

    public Conexion() throws Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda", "daw2", "1234");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    public String saberStatus() throws Exception {
        if (miConexion != null) {
            return "has conectado";
        } else {
            return "no has conectado";
        }
    }

    public void informacionConsolas(PrintWriter out) throws Exception {
        Statement miStatement = miConexion.createStatement();

        String consultaSQL = "select * from consolas";

        ResultSet miResultset = miStatement.executeQuery(consultaSQL);
        while (miResultset.next()) {
            String potenciaGPU = miResultset.getString("Potencia_GPU");
            String potenciaCPU = miResultset.getString("Potencia_CPU");
            String compania = miResultset.getString("Compañia");
            String precio = miResultset.getString("Precio");
            String unidadesDisponibles = miResultset.getString("Unidades_Disponibles");
            String idconsola = miResultset.getString("ID_Consola");
            String consolaNombre = miResultset.getString("Nombre_Consola");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InformacionConsolas</title>");
            out.println("<link rel=\"stylesheet\" href=\"estilos.css\"/>\n");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1 class='centrar'>Informacion de la consola " + consolaNombre + "</h1>");
            out.println("<table border='1'>");
            out.println("<tr><th>Propiedad</th><th>Valor</th></tr>");
            out.println("<tr><td>Potencia GPU</td><td>" + potenciaGPU + "</td></tr>");
            out.println("<tr><td>Potencia CPU</td><td>" + potenciaCPU + "</td></tr>");
            out.println("<tr><td>Companía</td><td>" + compania + "</td></tr>");
            out.println("<tr><td>Precio</td><td>" + precio + "</td></tr>");
            out.println("<tr><td>Unidades Disponibles</td><td>" + unidadesDisponibles + "</td></tr>");
            out.println("<tr><td>ID Consola</td><td>" + idconsola + "</td></tr>");
            out.println("<tr><td>Nombre Consola</td><td>" + consolaNombre + "</td></tr>");
            out.println("</table>");
            out.println("<br><br>");
            out.println("<div id='comprar-container'>");
            out.println("<div id='comprar'>");
            out.println("<p>¿Desea comprar este producto?</p>");
            out.println("<form action='consolaComprada.jsp' method='post'>");
            out.println("<input type='hidden' name='nombreConsola' value='" + consolaNombre + "'>");
            out.println("<input type='submit' name='si' value='si'>");
            out.println("<input type='submit' name='no' value='no'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");
            out.println("<br><br>");
        }
        out.println("<button><a href=\"index.html\">Volver atras</a></button>");
        out.println("</body>");
        out.println("</html>");
    }

    private String obtenerNombreConsola(String idConsola) throws Exception {
        String elNombre = "";
        PreparedStatement elStatement = miConexion.prepareStatement(
                "SELECT Nombre_Consola FROM consolas WHERE ID_Consola = ?"
        );
        elStatement.setString(1, idConsola);
        ResultSet elResultset = elStatement.executeQuery();
        if (elResultset.next()) {
            elNombre = elResultset.getString("Nombre_Consola");
        }
        return elNombre;
    }

    public void juegosPorConsola(String idConsola, PrintWriter out) throws Exception {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Catalogo de Juegos Por Consola</title>");
        out.println("<link rel=\"stylesheet\" href=\"estilos.css\"/>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1 class='centrar'>Catalogo de juegos por consola</h1>");

        String nombreConsola = obtenerNombreConsola(idConsola);
        if (nombreConsola.isEmpty()) {
            out.println("<p>No se encontró información para la consola seleccionada.</p>");
        } else {
            out.println("<h2>Consola: " + nombreConsola + "</h2>");

            PreparedStatement miStatement = miConexion.prepareStatement(
                    "SELECT j.Nombre_Juego, j.Compañia_Desarrolladora, j.Genero_Juego, j.Punt_Metacritic, \n"
                    + "       j.Precio, j.ID_Juego, j.Unidades_Disponibles, j.Nombre_Consola\n"
                    + "FROM juegos j\n"
                    + "INNER JOIN consolas_juegos cj ON j.ID_Juego = cj.ID_Juegos\n"
                    + "WHERE cj.ID_Consola = ?"
            );
            miStatement.setString(1, idConsola);
            ResultSet miResultset = miStatement.executeQuery();

            while (miResultset.next()) {
                String nombreJuego = miResultset.getString("Nombre_Juego");
                String compania = miResultset.getString("Compañia_Desarrolladora");
                String genero = miResultset.getString("Genero_Juego");
                String pMetacritic = miResultset.getString("Punt_Metacritic");
                String precio = miResultset.getString("Precio");
                String juegoID = miResultset.getString("ID_Juego");
                String unidades = miResultset.getString("Unidades_Disponibles");

                out.println("<table border='1'>");
                out.println("<tr><th>Propiedad</th><th>Valor</th></tr>");
                out.println("<tr><td>Nombre Juego</td><td>" + nombreJuego + "</td></tr>");
                out.println("<tr><td>Compania Desarrolladora</td><td>" + compania + "</td></tr>");
                out.println("<tr><td>Genero</td><td>" + genero + "</td></tr>");
                out.println("<tr><td>P. Metacritic</td><td>" + pMetacritic + "</td></tr>");
                out.println("<tr><td>Precio</td><td>" + precio + "</td></tr>");
                out.println("<tr><td>ID Juego</td><td>" + juegoID + "</td></tr>");
                out.println("<tr><td>Unidades Disponibles</td><td>" + unidades + "</td></tr>");
                out.println("</table>");
                out.println("<br><br>");
                out.println("<div id='comprar-container'>");
                out.println("<div id='comprar'>");
                out.println("<p>Desea comprar este producto?</p>");
                out.println("<form action='juegoVendido.jsp' method='post'>");
                out.println("<input type='hidden' name='idJuego' value='" + juegoID + "'>");
                out.println("<input type='submit' name='si' value='si'>");
                out.println("<input type='submit' name='no' value='no'>");
                out.println("</form>");
                out.println("</div>");
                out.println("</div>");
                out.println("<br><br>");
            }
        }

        out.println("<button><a href=\"index.html\">Volver atras</a></button>");
        out.println("</body>");
        out.println("</html>");
    }

    public void catalogoJuegos(PrintWriter out) throws Exception {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Catalogo de Juegos</title>");
        out.println("<link rel=\"stylesheet\" href=\"estilos.css\"/>\n");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1 class='centrar'>Catalogo de todos los juegos</h1>");
        Statement statement = miConexion.createStatement();

        String consultaSQL = "select * from juegos";

        ResultSet resultSet = statement.executeQuery(consultaSQL);

        while (resultSet.next()) {
            String nombreJuego = resultSet.getString("Nombre_Juego");
            String nombreConsola = resultSet.getString("Nombre_Consola");
            String companiaDesarrolladora = resultSet.getString("Compañia_Desarrolladora");
            String genero = resultSet.getString("Genero_Juego");
            String puntMetacritic = resultSet.getString("Punt_Metacritic");
            String idJuego = resultSet.getString("ID_Juego");
            String precio = resultSet.getString("Precio");
            String unidadesDisponibles = resultSet.getString("Unidades_Disponibles");

            out.println("<table border='1'>");
            out.println("<tr><th>Propiedad</th><th>Valor</th></tr>");
            out.println("<tr><td>Nombre Juego</td><td>" + nombreJuego + "</td></tr>");
            out.println("<tr><td>Nombre Consola </td><td>" + nombreConsola + "</td></tr>");
            out.println("<tr><td>Compania Desarrolladora</td><td>" + companiaDesarrolladora + "</td></tr>");
            out.println("<tr><td>Genero</td><td>" + genero + "</td></tr>");
            out.println("<tr><td>P. Metacritic</td><td>" + puntMetacritic + "</td></tr>");
            out.println("<tr><td>Precio</td><td>" + precio + "</td></tr>");
            out.println("<tr><td>Unidades Disponibles</td><td>" + unidadesDisponibles + "</td></tr>");
            out.println("<tr><td>ID Juego</td><td>" + idJuego + "</td></tr>");
            out.println("</table>");
            out.println("<br><br>");
            out.println("<div id='comprar-container'>");
            out.println("<div id='comprar'>");
            out.println("<p>Desea comprar este producto?</p>");
            out.println("<form action='juegoVendido.jsp' method='post'>");
            out.println("<input type='hidden' name='idJuego' value='" + idJuego + "'>");
            out.println("<input type='submit' name='si' value='si'>");
            out.println("<input type='submit' name='no' value='no'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");
            out.println("<br><br>");
        }
        out.println("<button><a href=\"index.html\">Volver atras</a></button>");
        out.println("</body>");
        out.println("</html>");
    }

    public void catalogoProductos(PrintWriter out) throws Exception {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Catalogo de Productos</title>");
        out.println("<link rel=\"stylesheet\" href=\"estilos.css\"/>\n");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1 class='centrar'>Catalogo de todos los productos</h1>");
        Statement statement = miConexion.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY
        );

        String consultaSQL = "Select * from juegos";

        ResultSet resultSet = statement.executeQuery(consultaSQL);

        out.println("<h2 class='centrar'>Juegos</h2>");
        while (resultSet.next()) {
            String nombreJuego = resultSet.getString("Nombre_Juego");
            String companiaDesarrolladora = resultSet.getString("Compañia_Desarrolladora");
            String genero = resultSet.getString("Genero_Juego");
            String puntMetacritic = resultSet.getString("Punt_Metacritic");
            String idJuego = resultSet.getString("ID_Juego");
            String precio = resultSet.getString("Precio");
            String unidadesDisponibles = resultSet.getString("Unidades_Disponibles");
            String nombreConsola = resultSet.getString("Nombre_Consola");
            out.println("<table border='1'>");
            out.println("<tr><th>Propiedad</th><th>Valor</th></tr>");
            out.println("<tr><td>Nombre Juego</td><td>" + nombreJuego + "</td></tr>");
            out.println("<tr><td>Compania Desarrolladora</td><td>" + companiaDesarrolladora + "</td></tr>");
            out.println("<tr><td>Genero</td><td>" + genero + "</td></tr>");
            out.println("<tr><td>P. Metacritic</td><td>" + puntMetacritic + "</td></tr>");
            out.println("<tr><td>Precio</td><td>" + precio + "</td></tr>");
            out.println("<tr><td>Unidades Disponibles</td><td>" + unidadesDisponibles + "</td></tr>");
            out.println("<tr><td>Nombre Consola: </td><td>" + nombreConsola + "</td></tr>");
            out.println("</table>");
            out.println("<br><br>");
            out.println("<div id='comprar-container'>");
            out.println("<div id='comprar'>");
            out.println("<p>Desea comprar este producto?</p>");
            out.println("<form action='juegoVendido.jsp' method='post'>");
            out.println("<input type='hidden' name='idJuego' value='" + idJuego + "'>");
            out.println("<input type='submit' name='si' value='si'>");
            out.println("<input type='submit' name='no' value='no'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");
            out.println("<br><br>");

        }
        resultSet.close();
        ResultSet elResultset = statement.executeQuery("Select * from consolas");

        out.println("<h2 class='centrar'>Consolas</h2>");
        while (elResultset.next()) {
            String nombreConsola = elResultset.getString("Nombre_Consola");
            String potenciaGPU = elResultset.getString("Potencia_GPU");
            String potenciaCPU = elResultset.getString("Potencia_CPU");
            String compania = elResultset.getString("Compañia");
            String idConsola = elResultset.getString("ID_Consola");
            String elPrecio = elResultset.getString("Precio");
            String consolasDisponibles = elResultset.getString("Unidades_Disponibles");

            out.println("<table border='1'>");
            out.println("<tr><th>Propiedad</th><th>Valor</th></tr>");
            out.println("<tr><td>Potencia GPU</td><td>" + potenciaGPU + "</td></tr>");
            out.println("<tr><td>Potencia CPU</td><td>" + potenciaCPU + "</td></tr>");
            out.println("<tr><td>Companía</td><td>" + compania + "</td></tr>");
            out.println("<tr><td>Precio</td><td>" + elPrecio + "</td></tr>");
            out.println("<tr><td>Unidades Disponibles</td><td>" + consolasDisponibles + "</td></tr>");
            out.println("<tr><td>ID Consola</td><td>" + idConsola + "</td></tr>");
            out.println("<tr><td>Nombre Consola</td><td>" + nombreConsola + "</td></tr>");
            out.println("</table>");
            out.println("<br><br>");
            out.println("<div id='comprar-container'>");
            out.println("<div id='comprar'>");
            out.println("<p>¿Desea comprar este producto?</p>");
            out.println("<form action='consolaComprada.jsp' method='post'>");
            out.println("<input type='hidden' name='nombreConsola' value='" + nombreConsola + "'>");
            out.println("<input type='submit' name='si' value='si'>");
            out.println("<input type='submit' name='no' value='no'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");
            out.println("<br><br>");
        }
        out.println("<button><a href=\"index.html\">Volver atras</a></button>");
        out.println("</body>");
        out.println("</html>");
    }

    public void venderConsola(String nombreConsola) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement("update consolas set Unidades_Disponibles = Unidades_Disponibles - 1 where Nombre_Consola = ?");
        miStatement.setString(1, nombreConsola);
        miStatement.executeUpdate();
    }

    public void venderJuego(String idJuego) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement("update juegos set Unidades_Disponibles = Unidades_Disponibles - 1 where ID_Juego = ?");
        miStatement.setString(1, idJuego);
        miStatement.executeUpdate();
    }

    public boolean hacerLogin(String usuario, String password, boolean admin) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement("select * from usuarios where nombre_usuario = ? and es_administrador = ? and password = ?");
        miStatement.setString(1, usuario);
        miStatement.setBoolean(2, admin);
        miStatement.setString(3, password);
        ResultSet miResultset = miStatement.executeQuery();
        while (miResultset.next() != false) {
            String usuarioBD = miResultset.getString("nombre_usuario");
            String passwordBD = miResultset.getString("password");
            boolean adminBD = miResultset.getBoolean("es_administrador");
            if (usuarioBD.equals(usuario) && passwordBD.equals(password) && adminBD == admin) {
                return true;
            } else {
                return false;
            }
        }
        miResultset.close();
        miStatement.close();
        return false;
    }

    public boolean serAdmin(String usuario) {
        if (usuario.equals("administrador")) {
            return true;
        } else {
            return false;
        }
    }

    public boolean insertarConsola(String potenciaGPU, String potenciaCPU, String compania, String precio, String unidadesDisponibles, String nombreConsola) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement("insert into consolas(Potencia_CPU, Potencia_GPU, Compañia, Precio, "
                + "Unidades_Disponibles, Nombre_Consola) values(?,?,?,?,?,?)");
        miStatement.setString(1, potenciaCPU);
        miStatement.setString(2, potenciaGPU);
        miStatement.setString(3, compania);
        miStatement.setString(4, precio);
        miStatement.setString(5, unidadesDisponibles);
        miStatement.setString(6, nombreConsola);
        miStatement.executeUpdate();
        return true;
    }

    public boolean insertarJuego(String nombreJuego, String nombreConsola, String companiaDesarrolladora,
            String generoJuego, String puntMetacritic, String precio,
            String unidadesDisponibles) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement(
                "INSERT INTO juegos (Nombre_Juego, Nombre_Consola, Compañia_Desarrolladora, Genero_Juego, Punt_Metacritic, Precio, Unidades_Disponibles) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)"
        );

        miStatement.setString(1, nombreJuego);
        miStatement.setString(2, nombreConsola);
        miStatement.setString(3, companiaDesarrolladora);
        miStatement.setString(4, generoJuego);
        miStatement.setString(5, puntMetacritic);
        miStatement.setString(6, precio);
        miStatement.setString(7, unidadesDisponibles);

        miStatement.executeUpdate();

        return true;
    }

    public boolean eliminarConsola(String idConsola) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement("delete from consolas_juegos where ID_Consola = ?");
        miStatement.setString(1, idConsola);
        miStatement.executeUpdate();
        miStatement = miConexion.prepareStatement("delete from consolas where ID_Consola = ?");
        miStatement.setString(1, idConsola);
        miStatement.executeUpdate();
        return true;
    }

    public boolean eliminarJuego(String idJuego) throws Exception {
        PreparedStatement miStatement = miConexion.prepareStatement("delete from consolas_juegos where ID_Juegos = ?");
        miStatement.setString(1, idJuego);
        miStatement.executeUpdate();
        miStatement = miConexion.prepareStatement("delete from juegos where ID_Juego = ?");
        miStatement.setString(1, idJuego);
        miStatement.executeUpdate();
        return true;
    }

    public boolean modificarConsola(String potenciaGPU, String potenciaCPU, String compania, String precio, String unidadesDisponibles, String nombreConsola, String idConsola) throws Exception {
        String sql = "UPDATE consolas SET Potencia_CPU = ?, Potencia_GPU = ?, Compañia = ?, Precio = ?, Unidades_Disponibles = ?, Nombre_Consola = ? where ID_Consola = ?";

        PreparedStatement miStatement = miConexion.prepareStatement(sql);

        miStatement.setString(1, potenciaCPU);
        miStatement.setString(2, potenciaGPU);
        miStatement.setString(3, compania);
        miStatement.setString(4, precio);
        miStatement.setString(5, unidadesDisponibles);
        miStatement.setString(6, nombreConsola);
        miStatement.setString(7, idConsola);

        int lineasAfectadas = miStatement.executeUpdate();
        boolean afectado = false;
        if (lineasAfectadas > 0) {
            afectado = true;
        }

        return afectado;

    }

    public boolean modificarJuego(String nombreJuego, String nombreConsola, String companiaDesarrolladora, String generoJuego, String puntMetacritic, String precio, String unidadesDisponibles, String idJuego) throws Exception {
        boolean afectado = false;

        String sql = "UPDATE juegos SET Nombre_Juego = ?, Nombre_Consola = ?, Compañia_Desarrolladora = ?, Genero_Juego = ?, Punt_Metacritic = ?, Precio = ?, Unidades_Disponibles = ? WHERE ID_Juego = ?";

        PreparedStatement miStatement = miConexion.prepareStatement(sql);

        miStatement.setString(1, nombreJuego);
        miStatement.setString(2, nombreConsola);
        miStatement.setString(3, companiaDesarrolladora);
        miStatement.setString(4, generoJuego);
        miStatement.setString(5, puntMetacritic);
        miStatement.setString(6, precio);
        miStatement.setString(7, unidadesDisponibles);
        miStatement.setString(8, idJuego);

        int lineasAfectadas = miStatement.executeUpdate();

        if (lineasAfectadas > 0) {
            afectado = true;
        }
        return afectado;
    }

}
