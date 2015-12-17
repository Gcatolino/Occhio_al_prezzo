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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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

@WebServlet(name = "getAccountByFiltriAccountServlet", urlPatterns = {"/getAccountByFiltriAccountServlet"})
public class GetAccountByFiltriAccountServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        String domicilio=request.getParameter("domicilio");
        AccountManager instance =  AccountManager.getInstance();
        ArrayList<Account> accounts=null;
        try {
            
            accounts = instance.getAccoutnByFiltri(domicilio);
            String temp="";
            for(Account a : accounts){
            temp+="email:<br>"+a.getEmail()+
                            "nome:<br>"+a.getNome()+
                            "cognome:<br>"+a.getCognome()+
                            "residenza:<br>"+a.getComuneDiResidenza()+
                            "domicilio:<br>"+a.getDomicilio()+
                            "ruolo:<br>"+a.getRuolo()+
                            "nascita:<br>"+a.getDataDiNascita()+
                            "<br><hr>";
            }
            out.print(temp);
            
        } catch (SQLException ex) {
            out.print("<h1>errore database</h1>");
        } catch (ValueNullException ex) {
            
            out.print("<h1>non hai inserito qualche valore</h1>");
        }
        catch (ConnectionException ex) {
                out.print("<h1errore di connessione</h1>");
            }
        catch (Exception ex) {
                Logger.getLogger(GetAccountByFiltriAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
         
    }

    
 
}
