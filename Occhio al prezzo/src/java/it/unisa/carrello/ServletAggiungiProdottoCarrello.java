/**
 *ServletAggiungiProdottoCarrello
 * 
 * Interagisce che si pone tra la web application ed il DB.
 * Consente di inserire un nuovo prodotto al carrello.
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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

@WebServlet(name="aggiungiProdottoServlet", urlPatterns={"/aggiungiProdottoServlet"})
public class ServletAggiungiProdottoCarrello extends HttpServlet{
    
    protected void processRequest(HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException, SQLException, ConnectionException, ValueNullException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        CarrelloManager instance = CarrelloManager.getInstance();
        HttpSession session = request.getSession();
        
        Prodotto prod = new Prodotto();
        int prodottiCarr = (Integer) session.getAttribute("prodottiCarr");
        Carrello car = (Carrello) session.getAttribute("carrello");
        prod.setId(Integer.parseInt(request.getParameter("idProdotto")));
        
        instance.aggiungiProdotto(prod, car);
        prodottiCarr = prodottiCarr + 1;
        session.setAttribute("prodottiCarr", prodottiCarr);
        RequestDispatcher rs = request.getRequestDispatcher("ricercaProdotto.jsp");
        rs.forward(request, response);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(resp, req);
        } catch (SQLException ex) {
            Logger.getLogger(ServletAggiungiProdottoCarrello.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ConnectionException ex) {
            Logger.getLogger(ServletAggiungiProdottoCarrello.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ValueNullException ex) {
            Logger.getLogger(ServletAggiungiProdottoCarrello.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
