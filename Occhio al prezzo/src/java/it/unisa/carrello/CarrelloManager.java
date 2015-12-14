/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;


import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import it.unisa.utility.DBConnection;
import it.unisa.utility.UtilityVar;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Antonio
 */
public class CarrelloManager {
    
    private static CarrelloManager instance;
    private int IDcarrello;
    
    public static CarrelloManager getInstance(){
        if(instance == null){
            instance = new CarrelloManager();
        }
        return instance;
    }
    
    public void add(Carrello carrello) throws SQLException,ValueNullException{
        
        Connection conn = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(carrello.getID()) && !UtilityVar.isNull(carrello.getEmail())){
            
            String sql = "INSERT INTO Carrello (idCarrello,fk_email) VALUES('"
                         + carrello.getID() + "','" + carrello.getEmail() + "')";
            
            try{
                Statement stmt = conn.createStatement();
                stmt.executeQuery(sql);
                conn.commit();
            } finally {
                DBConnection.releaseConnection(conn);
            }
                    
        }else throw new ValueNullException();
    }
    
    public void deleteCarrello(Carrello carr) throws SQLException, ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(carr)){
            
            String sql = "DELETE FROM Carrello WHERE fk_email = '"
                         + carr.getEmail()
                         + "'";
            
            try{
                Statement stmt = conn.createStatement();
                stmt.executeQuery(sql);
                conn.commit();
            }finally {
                DBConnection.releaseConnection(conn);
            }
        }else throw new ValueNullException();
    }
    
}
