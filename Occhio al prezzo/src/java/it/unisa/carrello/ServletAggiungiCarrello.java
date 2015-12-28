/**
 *ServletAggiungiCarrello
 * 
 * Interagisce che si pone tra la web application ed il DB.
 * Consente di instanziare un nuovo carrello.
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
 */

package it.unisa.carrello;

import it.unisa.exception.ValueNullException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

@WebServlet(name = "aggiungiCarrello", urlPatterns = {"/aggiungiCarrello"})
public class ServletAggiungiCarrello extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException,ValueNullException{
        
        PrintWriter out = response.getWriter();
        
        try{
            response.setContentType("text/html;charset=UTF-8");
            
            //String ID = request.getParameter("ID");
            
            HttpSession session = request.getSession();
            String fk_email = (String) session.getAttribute("fk_email");
            
            Carrello car = new Carrello();
            
            //car.setID(ID);
            car.setEmail(fk_email);
            
            CarrelloManager.getInstance().aggiungiCarrello(car);
            
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try{
            processRequest(req, resp);
        }catch(ValueNullException ex){
            ex.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try{
           processRequest(req, resp);
        }catch(ValueNullException ex){
            ex.getMessage();
        }
    }
}
