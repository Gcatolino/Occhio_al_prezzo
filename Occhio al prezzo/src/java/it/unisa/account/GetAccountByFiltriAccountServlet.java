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
            if(accounts.size()==0) {out.print("nessunrisultato");
            return;
            }
            String temp="";
            for(Account a : accounts){
            temp+="<tr><td>"+a.getEmail()+"</td>"+
                            "<td>"+a.getNome()+"</td>"+
                            "<td>"+a.getCognome()+"</td>"+
                            "<td>"+a.getComuneDiResidenza()+"</td>"+
                            "<td>"+a.getDomicilio()+"</td>"+
                            "<td>"+a.getRuolo()+"</td>"+
                            "<td>"+a.getDataDiNascita()+"</td>"+
                           // "<td>"+"<a href='deleteAccountServlet?email="+a.getEmail()+"'>elimina</a>"+"</td>"+
                            "<td><button  type='submit' name='ciao' OnClick='deleteAccount2(this)' value='"+a.getEmail()+"'><span class=\"glyphicon glyphicon-trash\"></span></button></td>"+
                            "</tr>";
            }
            out.print(temp);
            
        } catch (SQLException ex) {
            out.print("ERDB");
        } catch (ValueNullException ex) {
            
            out.print("NOVAL");
        }
        catch (ConnectionException ex) {
                out.print("ERCON");
            }
        catch (Exception ex) {
                Logger.getLogger(GetAccountByFiltriAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
         
    }

    
 
}
