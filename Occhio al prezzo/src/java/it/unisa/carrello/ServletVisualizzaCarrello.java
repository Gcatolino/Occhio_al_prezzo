/**
 *ServletAggiungiCarrello
 * 
 * Interagisce che si pone tra la web application ed il DB.
 * Consente di visualizzare un carrello elencando tutti i prodotti pressenti. 
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

@WebServlet(name="visualizzaCarrelloServlet", urlPatterns={"/visualizzaCarrelloServlet"})
public class ServletVisualizzaCarrello extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        HttpSession sess = request.getSession();
        
        Carrello car = (Carrello) sess.getAttribute("carrello");
        
        CarrelloManager instance = CarrelloManager.getInstance();
        ArrayList<Prodotto> prodotti = null;
        
        try{
            prodotti = instance.visualizzaCarrello(car);
            String temp ="";
            for(Prodotto p:prodotti){
                temp+= "<tr><td><img scr='" + p.getPathImmagine() +"'></td>"
                      +"<td>" + p.getNome() + "</td>"
                      +"<td>" + p.getMarca() + "</td>"
                      +"<td>" + p.getTaglia() + "</td>"
                      +"<td>" + p.getPrezzo() + "</td>"
                      +"<td><button type='submit' name='delete' onClick='deleteProdotto(this)' value='" + p.getId() + "'>elimina</button></td></tr>";
            }out.print(temp);
        }catch(ConnectionException ex){
            out.print("ERCON");
        }catch(SQLException ex){
                out.print("ERDB");
        }catch(ValueNullException ex){
            out.print("NOVAL");
        }
    }
}
