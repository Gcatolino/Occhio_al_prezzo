/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.email;

import java.io.IOException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/ServletContatti")
public class ServletContatti extends HttpServlet {
    private String host;
    private String porta;
    private String user;
    private String password;
 
    public void init() {

        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        porta = context.getInitParameter("port");
        user = context.getInitParameter("user");
        password = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String emailMittente = request.getParameter("email");
        String nomeMittente = request.getParameter("nome");
        String messaggio = request.getParameter("messaggio");
        messaggio = messaggio + " . Email inviata da " + nomeMittente + " " + emailMittente + ".";
        HttpSession session = request.getSession(true);
        try {
            Email.inviaEmail(host, porta, user, password, user, nomeMittente,
                    messaggio);
            session.setAttribute("messaggio", "Email inviata correttamente");
        } catch (Exception ex) {
            session.setAttribute("messaggio", "Email non inviata");
        } finally {
            response.sendRedirect("/Occhio_al_prezzo/index.jsp");
        }
    }
}
