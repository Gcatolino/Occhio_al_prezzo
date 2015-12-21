/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;

/**
 *
 * @author Antonio
 */

@WebServlet(name="svuotaCarrelloServlet", urlPatterns={"/svuotaCarrelloServlet"})
public class SvuotaCarrelloServlet extends HttpServlet{
    
    protected void processRequest(HttpServletResponse response, HttpServletRequest request)
            throws SQLException, IOException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        
        Carrello car = null;
        car.setID((String)session.getAttribute("ID"));
        
        CarrelloManager instance = CarrelloManager.getInstance();
        
        try{
           instance.svuotaCarrello(car);
        }catch(ConnectionException ex){
            out.print("<h1> Errore Connesione </h1>");
        }catch(SQLException ex){
            out.print("<h1> Errore Database </h1>");
        }catch(ValueNullException ex){
            out.print("<h1> Valori Nulli </h1>");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(resp, req);
        } catch (SQLException ex) {
            Logger.getLogger(SvuotaCarrelloServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(resp, req);
        } catch (SQLException ex) {
            Logger.getLogger(SvuotaCarrelloServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
