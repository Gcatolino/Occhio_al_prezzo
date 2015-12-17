package it.unisa.autenticazione;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import it.unisa.account.Account;
import it.unisa.autenticazione.AutenticazioneManager;
import it.unisa.exception.ConnectionException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        response.setContentType("text/html");  
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         AutenticazioneManager m=AutenticazioneManager.getInstance();
         PrintWriter out=response.getWriter();
        try {
            Account a=m.login(email, password);
            if(a==null){
                out.print("<h1>Account non registrato</h1>");
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            }
            else{
                HttpSession session = request.getSession();
                session.setAttribute("email", email);  // just a marker object
                session.setAttribute("ruolo", a.getRuolo());
                out.print("login effettuato");
            }
            
        } catch (SQLException ex) {
            out.print("<h1>errore database</h1>");
        } catch (ConnectionException ex) {
             out.print("<h1>errore connessione</h1>");
        }
         
    }

    
 
}
