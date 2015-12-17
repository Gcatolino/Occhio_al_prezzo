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
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

@WebServlet(name = "deleteAccountServlet", urlPatterns = {"it/unisa/servlet/deleteAccountServlet"})
public class DeleteAccountServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        HttpSession session=request.getSession();
        String email=(String)session.getAttribute("email");
        String ruolo=(String)session.getAttribute("ruolo");
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        if(!ruolo.equals("admin"))
        {
       
       
        AccountManager instance =  AccountManager.getInstance();
        Account acc=null;
        try {
            acc = instance.getAccountByEmail(email);
           
                instance.deleteAccount(acc);
            
            out.print("<h1>account eliminato correttamente</h1>");
        } catch (SQLException ex) {
            out.print("<h1>errore database</h1>");
        } catch (ValueNullException ex) {
            
            out.print("<h1>non hai inserito qualche valore</h1>");
        }
        catch (ConnectionException ex) {
                out.print("<h1errore di connessione</h1>");
            }
        
         
    }else{
     out.print("<h1> non hai i permessi/h1>"); 
 
}

    }
    
}
   