/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Antonio
 */
@WebServlet(name="eliminaProdottoServlet", urlPatterns={"/eliminaProdottoServlet"})
public class EliminaProdottoServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        PrintWriter out = response.getWriter();
        
        Carrello car = null;
        Prodotto prod = null;
        
        car.setID((String)session.getAttribute("ID"));
        prod.setID((Integer)session.getAttribute("ID"));
        
        CarrelloManager instance = CarrelloManager.getInstance();
        
        try {
            instance.eliminaProdotto(prod);
        }catch(ConnectionException ex){
            out.print("<h1> Errore di Connessione </h1>");
        }catch(SQLException ex){
                out.print("<h1> Databese Errore </h1>");
        }catch(ValueNullException ex){
            out.print("<h1> Valori Nulli </h1>");
        }
 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    
    
  
    
    

}
    


