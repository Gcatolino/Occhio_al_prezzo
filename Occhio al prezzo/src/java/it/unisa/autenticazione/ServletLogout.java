package it.unisa.autenticazione;
import it.unisa.carrello.Carrello;
import it.unisa.carrello.CarrelloManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import java.io.IOException;
import java.io.PrintWriter;  
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class ServletLogout extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            try {
                response.setContentType("text/html");
                PrintWriter out=response.getWriter();
                
                HttpSession session = request.getSession();
                CarrelloManager instance = CarrelloManager.getInstance();
                Carrello carr = new Carrello();
                session.setAttribute("carrello", null);
                carr.setID(instance.recuperoID());
                instance.eliminaCarrello(carr);
                session.setAttribute("messaggio", "Logout effettuato con successo");
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.forward(request,response);
                
                session.invalidate();
                
                out.print("Logout effettuato con successo");
                  
                out.close();
            } catch (SQLException ex) {
                Logger.getLogger(ServletLogout.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ConnectionException ex) {
                Logger.getLogger(ServletLogout.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ValueNullException ex) {
                Logger.getLogger(ServletLogout.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
        
    
}