/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.prodotto;

import it.unisa.account.Account;
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
@WebServlet(name = "ServletInserimentoProdotto", urlPatterns = {"/ServletInserimentoProdotto"})
public class ServletInserimentoProdotto extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);
            response.setContentType("text/html;charset=UTF-8");

            String marca = request.getParameter("marca");
            String nome = request.getParameter("nome");
            String taglia = request.getParameter("taglia");
            double prezzo = Double.valueOf(request.getParameter("prezzo"));
            String punto_vendita = request.getParameter("punto_vendita");
            String fkEmail = session.getAttribute("fk_email").toString();
            String data = request.getParameter("data");
            String pathImmagine = request.getParameter("path_immagine");
         
            Prodotto prodotto = new Prodotto();
            prodotto.setMarca(marca);
            prodotto.setNome(nome);
            prodotto.setTaglia(taglia);
            prodotto.setPuntoVendita(punto_vendita);
            prodotto.setPrezzo(prezzo);
            prodotto.setFkEmail(fkEmail);
            prodotto.setData(data);
            prodotto.setPathImmagine(pathImmagine);
            
            System.out.println(prodotto);
            ProdottoManager.getInstance().insert(prodotto);
            session.setAttribute("messaggio", "Prodotto inserito correttamente");
            response.sendRedirect("/Occhio_al_prezzo/gestioneProdotti.jsp");
        } catch (SQLException ex) {
            out.print("<h1> errore database </h1>");
        } catch (ValueNullException ex) {
            out.print("<h1> campo/i mancante/i </h1>");
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
