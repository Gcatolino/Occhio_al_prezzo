/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.account;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import it.unisa.autenticazione.AutenticazioneManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.utility.UtilityVar;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author  raffaele donadio
 */

@WebServlet(name = "addAccountServlet", urlPatterns = {"/addAccountServlet"})
public class ServletAggiungiAccount extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();
        Account acc = new Account();
        acc.setNome(request.getParameter("nome"));
        acc.setEmail(request.getParameter("email"));
        acc.setPassword(request.getParameter("password"));
        acc.setDomicilio(request.getParameter("domicilio"));
        
        /*il ruolo lo settiamo perchè di default è un utente*/
        acc.setRuolo("utente");
        
        acc.setComuneDiResidenza(request.getParameter("comune"));
        acc.setCognome(request.getParameter("cognome"));
        String temp = request.getParameter("nascita");
        String data = temp.substring(6) + "-" + temp.substring(3, 5) + "-" + temp.substring(0, 2);
        acc.setDataDiNascita(UtilityVar.parseData(data));
        //acc.setDataDiNascita(UtilityVar.parseData(request.getParameter("nascita")));
        System.out.println(acc.getEmail()+"  "+acc.getRuolo()+"  "+acc.getPassword());
        
        AccountManager instance =  AccountManager.getInstance();
        HttpSession session = request.getSession();
        try {
            instance.aggiungi(acc);
            session.setAttribute("messaggio", "Registrazione avvenuta con successo! Adesso puoi fare il login.");
            RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
            rs.forward(request, response);
        } catch (SQLException ex) {
            session.setAttribute("messaggio", "Errore database: " + ex.getMessage());
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request, response);
        } catch (ValueNullException ex) {
            session.setAttribute("messaggio", "Non hai inserito qualche valore");
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request, response);
        }    
    }
}