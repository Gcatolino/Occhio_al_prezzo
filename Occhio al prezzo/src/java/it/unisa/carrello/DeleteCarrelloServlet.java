/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Antonio
 */
public class DeleteCarrelloServlet extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ValueNullException, ConnectionException{
        
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String ID = request.getParameter("ID");
        String email = request.getParameter("email");
        
        try{
            Carrello carr = new Carrello();
            carr.setID(ID);
            carr.setEmail(email);
            
            CarrelloManager.getInstance().deleteCarrello(carr);
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

