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

@WebServlet(name = "deleteAccountServlet", urlPatterns = {"/deleteAccountServlet"})
public class DeleteAccountServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
        String email=request.getParameter("email");
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
    
       
       
        AccountManager instance =  AccountManager.getInstance();
        Account acc=null;
        try {
            acc = instance.getAccountByEmail(email);
           
                instance.deleteAccount(acc);
            
            out.print("SI");
        } catch (SQLException ex) {
            out.print("ERDB");
        } catch (ValueNullException ex) {
            
            out.print("NOVAL");
        }
        catch (ConnectionException ex) {
                out.print("ERCON");
            }
        
         
    
 
}

    }
    

   