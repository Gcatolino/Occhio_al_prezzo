package it.unisa.autenticazione;
import java.io.IOException;  
import java.io.IOException;
import java.io.PrintWriter;  
import javax.servlet.RequestDispatcher;
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {  
        protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
              
            HttpSession session = request.getSession();
            session.setAttribute("messaggio", "Logout effettuato con successo");
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request,response); 
              
            session.invalidate();
              
            out.print("Logout effettuato con successo");  
              
            out.close();  
    }  
}