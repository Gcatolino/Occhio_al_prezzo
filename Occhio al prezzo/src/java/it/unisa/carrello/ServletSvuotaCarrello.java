/**
 *ServletAggiungiCarrello
 * 
 * Interagisce che si pone tra la web application ed il DB.
 * Consente di svuotare un carrello. 
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
 */
package it.unisa.carrello;

import it.unisa.account.Account;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

@WebServlet(name="svuotaCarrelloServlet", urlPatterns={"/svuotaCarrelloServlet"})
public class ServletSvuotaCarrello extends HttpServlet{
    
    protected void processRequest(HttpServletResponse response, HttpServletRequest request)
            throws SQLException, IOException, ServletException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        
        Carrello car = new Carrello();
        car = (Carrello) session.getAttribute("carrello");
        int prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
        CarrelloManager instance = CarrelloManager.getInstance();
        
        try{
           instance.svuotaCarrello(car);
           prodottiCarr = 0;
           session.setAttribute("prodottiCarr", prodottiCarr);
           session.setAttribute("messaggio", "Carrello svuotato con successo");
           RequestDispatcher re = request.getRequestDispatcher("carrello.jsp");
           re.forward(request, response);
        }catch(ConnectionException ex){
            out.print("<h1> Errore Connesione </h1>");
        }catch(SQLException ex){
            out.print("<h1> Errore Database </h1>");
        }catch(ValueNullException ex){
            out.print("<h1> Valori Nulli </h1>");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(resp, req);
        } catch (SQLException ex) {
            Logger.getLogger(ServletSvuotaCarrello.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(resp, req);
        } catch (SQLException ex) {
            Logger.getLogger(ServletSvuotaCarrello.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
