/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

/**
 *
 * @author Antonio
 */
public class AddCarrelloServlet extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException,ValueNullException{
        
        PrintWriter out = response.getWriter();
        
        try{
            response.setContentType("text/html;charset=UTF-8");
            
            String ID = request.getParameter("ID");
            
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            
            Carrello car = new Carrello();
            
            car.setID(ID);
            car.setEmail(email);
            
            CarrelloManager.getInstance().add(car);
            
            out.println("");
            
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

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @throws ValueNullException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try{
           processRequest(req, resp);
        }catch(ValueNullException ex){
            ex.getMessage();
        }
    }
}
