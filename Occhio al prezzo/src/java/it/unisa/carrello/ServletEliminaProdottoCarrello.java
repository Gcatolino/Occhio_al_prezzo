/**
 *ServletAggiungiCarrello
 * 
 * Interagisce che si pone tra la web application ed il DB.
 * Consente di eliminare un prodotto da un carrello. 
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
 */
package it.unisa.carrello;

import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@WebServlet(name="eliminaProdottoServlet", urlPatterns={"/eliminaProdottoServlet"})
public class ServletEliminaProdottoCarrello extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ConnectionException, ValueNullException {
         
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        CarrelloManager instance = CarrelloManager.getInstance();
        
        Carrello carr = new Carrello();
        carr =(Carrello) session.getAttribute("carrello");
        int prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
         
        ArrayList<Prodotto> prodotti = instance.visualizzaCarrello(carr);
        
        Prodotto prod = new Prodotto();
        prod.setId(Integer.valueOf(request.getParameter("idProdotto")));
        
        prodottiCarr = prodottiCarr - 1;
        session.setAttribute("prodottiCarr", prodottiCarr);
        
        PrintWriter out = response.getWriter();
        
       for(Prodotto p:prodotti){
           if(prod.getId() == p.getId()){
               try {
                   instance.eliminaProdotto(prod);
                   session.setAttribute("prodottiCarr", prodottiCarr);
                   RequestDispatcher re = request.getRequestDispatcher("carrello.jsp");
                   re.forward(request, response);
                  }catch(ConnectionException ex){
                   out.print("<h1> Errore di Connessione </h1>");
                  }catch(SQLException ex){
                   out.print("<h1> Databese Errore </h1>");
                  }catch(ValueNullException ex){
                   out.print("<h1> Valori Nulli </h1>");
                  }
           }
 
        }
    }

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @throws ConnectionException
     * @throws ValueNullException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            processRequest(req, resp);
        } catch (SQLException ex) {
            Logger.getLogger(ServletEliminaProdottoCarrello.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ConnectionException ex) {
            Logger.getLogger(ServletEliminaProdottoCarrello.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ValueNullException ex) {
            Logger.getLogger(ServletEliminaProdottoCarrello.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    
    
  
    
    

}
    


