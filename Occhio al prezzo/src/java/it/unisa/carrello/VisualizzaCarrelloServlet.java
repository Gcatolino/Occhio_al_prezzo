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
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;


/**
 *
 * @author Antonio
 */

@WebServlet(name="visualizzaCarrelloServlet", urlPatterns={"/visualizzaCarrelloServlet"})
public class VisualizzaCarrelloServlet extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String ID = request.getParameter("ID");
        
        Carrello car = new Carrello();
        car.setID(ID);
        
        CarrelloManager instance = CarrelloManager.getInstance();
        ArrayList<Prodotto> prodotti = null;
        try{
            prodotti = instance.visualizzaCarrello(car);
            String temp ="";
            for(Prodotto p:prodotti){
                temp+= p.getNome() + "<br/>" + p.getMarca() 
                        + "<br/>" + p.getTaglia() + "<br/>"
                        + p.getPrezzo() + "<br/>" + p.getPuntoVendita()
                        + "<br/>";
            }out.print(temp);
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
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(VisualizzaCarrelloServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try{  
          processRequest(req, resp);
      }catch(SQLException ex){
           Logger.getLogger(VisualizzaCarrelloServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
    }
    
    
    
}
