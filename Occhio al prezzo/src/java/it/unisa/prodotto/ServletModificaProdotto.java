/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.prodotto;

import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import it.unisa.prodotto.ProdottoManager;
import it.unisa.utility.UtilityVar;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "ServletModificaProdotto", urlPatterns = {"/ServletModificaProdotto"})
public class ServletModificaProdotto extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        try {
            int idProdotto = Integer.valueOf(session.getAttribute("idProdotto").toString());
            String marca = request.getParameter("marca");
            String nome = request.getParameter("nome");
            String taglia = request.getParameter("taglia");
            String fkEmail = session.getAttribute("fk_email").toString();
            double prezzo = Double.valueOf(request.getParameter("prezzo"));
            String puntoVendita = request.getParameter("punto_vendita");
            String data = request.getParameter("data");
            data = UtilityVar.ricomponiData(data);
            String pathImmagine = request.getParameter("path_immagine");
            
            
            Prodotto prodotto = new Prodotto();
            prodotto.setMarca(marca);
            prodotto.setNome(nome);
            prodotto.setTaglia(taglia);
            prodotto.setFkEmail(fkEmail);
            prodotto.setPrezzo(prezzo);
            prodotto.setPuntoVendita(puntoVendita);
            prodotto.setData(data);
            prodotto.setPathImmagine(pathImmagine);
            
            ProdottoManager.getInstance().modifica(idProdotto, prodotto);
            
            ArrayList<Prodotto> prodotti = ProdottoManager.getInstance().ricercaProdottiPerPuntoVendita(fkEmail);
            
            session.setAttribute("prodotti", prodotti);
            session.setAttribute("messaggio", "Prodotto modificato correttamente");
            response.sendRedirect("/Occhio_al_prezzo/gestioneProdotti.jsp");
            } catch (SQLException ex) {
                session.setAttribute("messaggio", "Errore database");
                response.sendRedirect("/Occhio_al_prezzo/gestioneProdotti.jsp");
            } catch (ValueNullException ex) {
                session.setAttribute("messaggio", "Campo/i mancante/i");
                response.sendRedirect("/Occhio_al_prezzo/gestioneProdotti.jsp");
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
