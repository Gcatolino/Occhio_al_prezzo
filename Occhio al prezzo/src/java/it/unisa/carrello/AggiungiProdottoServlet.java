/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Antonio
 */

@WebServlet(name="aggiungiProdottoServlet", urlPatterns={"/aggiungiProdottoServlet"})
public class AggiungiProdottoServlet extends HttpServlet{
    
    protected void processRequest(HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        Prodotto prod = new Prodotto();
        Carrello car = null;
        
        car.setID((String)session.getAttribute("ID"));
        car.setEmail((String)session.getAttribute("fk_email"));
        
        prod.setID((int) request.getAttribute("ID"));
        
        CarrelloManager instance = CarrelloManager.getInstance();
        
        try{
            instance.addProdotto(prod,car);
            out.print("<h1> Aggiunto Prodotto al Carrello </h1>");
        }catch(SQLException ex){
            out.print("<h1> errore database </h1>");
        }catch(ConnectionException ex){
            out.print("<h1> errore connessione </h1>");
        }catch(ValueNullException ex){
            out.print("<h1> Valori mancanti </h1>");
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(resp, req);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(resp, req);
    }
    
    
    
    
}
