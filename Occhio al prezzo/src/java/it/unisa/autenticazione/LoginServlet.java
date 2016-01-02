package it.unisa.autenticazione;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import it.unisa.account.Account;
import it.unisa.autenticazione.AutenticazioneManager;
import it.unisa.carrello.Carrello;
import it.unisa.carrello.CarrelloManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
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
 * @author  michele galiano
 */

@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html");  
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AutenticazioneManager m = AutenticazioneManager.getInstance();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            Account a = m.login(email, password);
            if(a == null){
                session.setAttribute("messaggio", "Non sei ancora registrato oppure hai sbagliato password");
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.forward(request, response);
            }
            else{
                String r = a.getRuolo();
                /*session.setAttribute("email", email);  // just a marker object
                session.setAttribute("ruolo", r);*/
                session.setAttribute("account", a);
                if(r.equalsIgnoreCase("admin")){
                    response.sendRedirect("adminLoggato.jsp");
                    //RequestDispatcher rs = request.getRequestDispatcher("adminLoggato.jsp");
                    //rs.forward(request,response);
                } 
                else {
                    if(r.equalsIgnoreCase("venditore")){
                        RequestDispatcher rs = request.getRequestDispatcher("venditoreLoggato.jsp");
                        rs.forward(request,response);
                    }
                    else{
                        session.setAttribute("messaggio", "Login effettuato con successo");
                        RequestDispatcher rs = request.getRequestDispatcher("utenteLoggato.jsp");
                        rs.forward(request,response);
                        Carrello car = new Carrello();
                        CarrelloManager instance = CarrelloManager.getInstance();
                        
                        int idCarrello = instance.recuperoID();
                        
                        car.setEmail(email);
                        car.setID(idCarrello);
                        Integer prodottiCarr = 0;
                        
                        try {
                            instance.aggiungiCarrello(car);
                            session.setAttribute("carrello", car);
                            session.setAttribute("prodottiCarr", prodottiCarr);
                            rs.forward(request,response);
                        } catch (ValueNullException ex) {
                            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
                out.print("login effettuato");
            }
            
        } catch (SQLException ex) {
            session.setAttribute("messaggio", "Errore database: " + ex.getMessage());
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request,response);
        } catch (ConnectionException ex) {
            session.setAttribute("messaggio", "Errore connessione");
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request,response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);   
    }
}