package it.unisa.account;
import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.utility.UtilityVar;
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
 /*
        NOTA SUPER SUPER IMPORTANTISSIMA!!!!!!!!!!!!!!!!!!!!!!!!!!!
        POSSIBILE FAULT
        per il controllo sulla password che solo l'utente deve controllare,
        non si puo fare solo al livello grafico che non puo modificare il campo
        data??? cioe l'admin non la modifica
        OPPURE FACCIAMO QUI IL CONTROLLO?????????????????????????*/



/**
 *
 * @author  raffaele donadio
 */

@WebServlet(name = "modificaAccountServlet", urlPatterns = {"/modificaAccountServlet"})
public class ModificaAccountServlet extends HttpServlet {

 /*
        NOTA SUPER SUPER IMPORTANTISSIMA!!!!!!!!!!!!!!!!!!!!!!!!!!!
        POSSIBILE FAULT
        per il controllo sulla password che solo l'utente deve controllare,
        non si puo fare solo al livello grafico che non puo modificare il campo
        data??? cioe l'admin non la modifica
        OPPURE FACCIAMO QUI IL CONTROLLO?????????????????????????*/
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
         /*
        NOTA SUPER SUPER IMPORTANTISSIMA!!!!!!!!!!!!!!!!!!!!!!!!!!!
        POSSIBILE FAULT
        per il controllo sulla password che solo l'utente deve controllare,
        non si puo fare solo al livello grafico che non puo modificare il campo
        data??? cioe l'admin non la modifica
        OPPURE FACCIAMO QUI IL CONTROLLO?????????????????????????*/
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        Account acc=new Account();
        acc.setNome(request.getParameter("nome"));
        acc.setEmail(request.getParameter("email"));
        acc.setDomicilio(request.getParameter("domicilio"));
        /*il ruolo non lo settiamo perchè di default è un utente*/
        acc.setComuneDiResidenza(request.getParameter("comune"));
        acc.setCognome(request.getParameter("cognome"));
        acc.setDataDiNascita(UtilityVar.parseData(request.getParameter("nascita")));
        /*
        NOTA SUPER SUPER IMPORTANTISSIMA!!!!!!!!!!!!!!!!!!!!!!!!!!!
        POSSIBILE FAULT
        per il controllo sulla password che solo l'utente deve controllare,
        non si puo fare solo al livello grafico che non puo modificare il campo
        data??? cioe l'admin non la modifica
        OPPURE FACCIAMO QUI IL CONTROLLO?????????????????????????*/
       
          acc.setPassword(request.getParameter("password"));
          HttpSession session = request.getSession();
        session.setAttribute("account", acc);
   
        AccountManager instance =  AccountManager.getInstance();
        try {
            
                instance.modificaAccount(acc);
           
            out.print("<h1>account modificato correttamente</h1>");
            RequestDispatcher rs = request.getRequestDispatcher("profilo.jsp");
            rs.forward(request, response);
        } catch (SQLException ex) {
            out.print("<h1>errore database</h1>");
        } catch (ValueNullException ex) {
            
            out.print("<h1>non hai inserito qualche valore</h1>");
        }
          catch (ConnectionException ex) {
                out.print("<h1>errore di connession</h1>");
            }
        
         
    }

    
 
}
