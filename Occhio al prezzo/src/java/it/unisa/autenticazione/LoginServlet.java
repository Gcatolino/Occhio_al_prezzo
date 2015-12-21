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

@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html");  
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AutenticazioneManager m = AutenticazioneManager.getInstance();
        PrintWriter out=response.getWriter();
        try {
            Account a = m.login(email, password);
            if(a == null){
                out.print("<h1>Non sei ancora registrato. Cosa aspetti a farlo?</h1>");
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.forward(request, response);
            }
            else{
                HttpSession session = request.getSession();
                String r = a.getRuolo();
                session.setAttribute("email", email);  // just a marker object
                session.setAttribute("ruolo", r);
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
                        RequestDispatcher rs = request.getRequestDispatcher("utenteLoggato.jsp");
                        rs.forward(request,response);
                    }
                }
                out.print("login effettuato");
            }
            
        } catch (SQLException ex) {
            out.print("<h1>errore database</h1>");
        } catch (ConnectionException ex) {
             out.print("<h1>errore connessione</h1>");
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