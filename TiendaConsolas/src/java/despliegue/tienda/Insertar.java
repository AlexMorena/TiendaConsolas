/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package despliegue.tienda;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;

/**
 *
 * @author Administrator
 */
public class Insertar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Insertar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Insertar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.sendRedirect("index.html");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Insertar</title>");
            out.println("<link rel=\"stylesheet\" href=\"estilosFormularios.css\"/>\n");
            out.println("</head>");
            out.println("<body>");
            Conexion miConexion = new Conexion();
            String decision = request.getParameter("decision");
            if ("consola".equals(decision)) {
                String potenciaGPU = request.getParameter("potenciaGPU");
                String potenciaCPU = request.getParameter("potenciaCPU");
                String compania = request.getParameter("compania");
                String precio = request.getParameter("precio");
                String unidadesDisponibles = request.getParameter("unidadesDisponibles");
                String nombreConsola = request.getParameter("nombreConsola");
                if (miConexion.insertarConsola(potenciaGPU, potenciaCPU, compania, precio, unidadesDisponibles, nombreConsola)) {
                    out.println("<h1 style='margin-top: 10px'>Consola introducida correctamente</h1>");
                } else {
                    out.println("<h1 style='margin-top: 10px>No se ha podido insertar la consola</h1>");
                }
            } else {
                String nombreJuego = request.getParameter("nombreJuego");
                String nombreConsola = request.getParameter("nombreConsola");
                String companiaDesarrolladora = request.getParameter("companiaDesarrolladora");
                String generoJuego = request.getParameter("generoJuego");
                String puntMetacritic = request.getParameter("puntMetacritic");
                String precio = request.getParameter("precio");
                String unidadesDisponibles = request.getParameter("unidadesDisponibles");

                if (miConexion.insertarJuego(nombreJuego, nombreConsola, companiaDesarrolladora, generoJuego, puntMetacritic, precio, unidadesDisponibles)) {
                    out.println("<h1 style='margin-top: 10px'>Juego introducido correctamente</h1>");
                } else {
                    out.println("<h1 style='margin-top: 10px>No se ha podido insertar el juego</h1>");
                }
            }
            out.println("<form>");
            out.println("<button class='Volver' style='margin-left: 40%'><a href='funcionalidadesAdm.jsp'>Volver atras</a></button>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            out.println(e.getMessage());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
