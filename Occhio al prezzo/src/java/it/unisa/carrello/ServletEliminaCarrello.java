/**
 *ServletEliminaCarrello
 * 
 * Interagisce che si pone tra la web application ed il DB.
 * Consente di eliminare un carrello.
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws ValueNullException if there are value null
     * @throws ConnectionException if an connection error occurs
     */
@WebServlet(name="DeleteCarrello")
public class ServletEliminaCarrello extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ValueNullException, ConnectionException{
        
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String ID = request.getParameter("ID");
        String fk_email = request.getParameter("fk_email");
        
        try{
            Carrello carr = new Carrello();
            carr.setID(Integer.valueOf(ID));
            carr.setEmail(fk_email);
            
            CarrelloManager.getInstance().eliminaCarrello(carr);
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
           processRequest(req, resp);
        }catch(ValueNullException ex){
            ex.getMessage();
        }catch(ConnectionException ex){
            ex.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
           processRequest(req, resp);
        }catch(ValueNullException ex){
            ex.getMessage();
        }catch(ConnectionException ex){
            ex.getMessage();
        }
    }
    
    
    
    
}

