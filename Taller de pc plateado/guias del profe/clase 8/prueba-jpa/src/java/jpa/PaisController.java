/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alumnosinf
 */
@WebServlet(
        name = "PaisController",
        urlPatterns = {"/pais.html"})
public class PaisController extends HttpServlet {

    @EJB
    private PaisService service;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaisController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaisController at " + request.getContextPath() + "</h1>");
            // SE ASUME QUE EL SERVLET SE INVOCA CON
            // PARAMETRO POR GET
            // ... pais.html?codigo=CL
            String codigo = request.getParameter("codigo");

            // delegar la busqueda a la capa de negocio
            Pais pais = service.buscarPorCodigo(codigo);
            if (pais == null) {
                out.println("<h2> NO EXISTE: " + codigo + "</h2>");
            } else {
                out.println("<h2> CODIGO: " + pais.getCodigo() + "</h2>");
                out.println("<h2> NOMBRE: " + pais.getNombre() + "</h2>");
            }

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
