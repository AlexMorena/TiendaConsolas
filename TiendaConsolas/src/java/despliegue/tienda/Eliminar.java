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
public class Eliminar extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Eliminar</title>");
            out.println("<link rel=\"stylesheet\" href=\"estilos.css\"/>\n");
            out.println("</head>");
            out.println("<body>");
            Conexion miConexion = new Conexion();
            String decision = request.getParameter("decision");
            if ("consola".equals(decision)) {

                String idConsola = request.getParameter("idConsola");
                if (miConexion.eliminarConsola(idConsola)) {
                    out.println("<h1 style='margin-top: 10px'>Consola eliminada correctamente</h1>");
                } else {
                    out.println("<h1 style='margin-top: 10px'>No se ha podido borrar la consola</h1>");
                }
            } else {
                String idJuego = request.getParameter("idJuego");
                if (miConexion.eliminarJuego(idJuego)) {
                    out.println("<h1 style='margin-top: 10px'>Juego eliminado correctamente</h1>");
                } else {
                    out.println("<h1 style='margin-top: 10px'>No se ha podido eliminar el juego</h1>");
                }
            }
            out.println("<form>");
            out.println("<button><a href='funcionalidadesAdm.jsp'>Volver atras</a></button>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            out.println(e.getMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
