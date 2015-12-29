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

@WebServlet(name = "deleteAccountServlet", urlPatterns = {"/deleteAccountServlet"})
public class EliminaAccountServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
          
        String email=request.getParameter("email");
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
    
        AccountManager instance =  AccountManager.getInstance();
        Account acc=null;
        
        String x = request.getParameter("x");
        if(x == null){
                try {
                acc = instance.ottieniAccountDaEmail(email);
           
                instance.eliminaAccount(acc);
            
                out.print("SI");
            } catch (SQLException ex) {
                out.print("ERDB");
            } catch (ValueNullException ex) {
                out.print("NOVAL");
            } catch (ConnectionException ex) {
                out.print("ERCON");
            }
        }
        else{
            try {
                acc = instance.ottieniAccountDaEmail(email);
           
                instance.eliminaAccount(acc);
            
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Account eliminato correttamente')");
                out.println("</script>");
                
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.forward(request, response);
        } catch (SQLException ex) {
            
            out.print("<h1>errore database: </h1>" + ex.getMessage());
        } catch (ValueNullException ex) {
            
            out.print("<h1>non hai inserito qualche valore</h1>");
        }
        catch (ConnectionException ex) {
                out.print("<h1errore di connessione</h1>");
            }
        }
         
    
 
}

    }
    

   