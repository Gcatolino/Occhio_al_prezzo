/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.prodotto;

import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import it.unisa.prodotto.ProdottoManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andreapilato
 */
@WebServlet(name = "SerlvetModificaProdotto", urlPatterns = {"/SerlvetModificaProdotto"})
public class SerlvetModificaProdotto extends HttpServlet {

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
            out.println("<title>Servlet SerlvetModificaProdotto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SerlvetModificaProdotto at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        int id = Integer.valueOf(request.getParameter("id"));
        String marca = request.getParameter("marca");
        String nome = request.getParameter("nome");
        String taglia = request.getParameter("taglia");
        String prezzo = request.getParameter("prezzo");
        String puntoVendita = request.getParameter("puntoVendita");
        String data = request.getParameter("data");
            
        Prodotto prodotto = new Prodotto();
        prodotto.setMarca(marca);
        prodotto.setNome(nome);
        prodotto.setTaglia(taglia);
        prodotto.setPrezzo(Double.valueOf(prezzo));
        prodotto.setPuntoVendita(puntoVendita);
        prodotto.setData(data);
            
        try {
            ProdottoManager.getInstance().update(id, prodotto);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SerlvetModificaProdotto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SerlvetModificaProdotto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ValueNullException ex) {
            Logger.getLogger(SerlvetModificaProdotto.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("messaggio", "prodotto modificato con successo");
            
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
