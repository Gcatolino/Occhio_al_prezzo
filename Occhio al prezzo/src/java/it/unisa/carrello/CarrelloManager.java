/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.product.product;
import it.unisa.exception.ConnectionException;
import it.unisa.utility.DBConnection;
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
    
    private CarrelloManager(){
        super();
    }
    
    public static CarrelloManager getInstance(){
        if(instance == null){
            instance = new CarrelloManager();
        }
        return instance;
    }
    
    public void calcolaID() throws SQLException,ConnectionException{
        Connection connect = null;
        Statement stmt = null;
        ResultSet rs = null;
        Carrello car = null;
        
        String query = "selct count(*) from Carrello";
        
        try{
            connect = DBConnection.getConnection();
            
            if(connect == null){
                throw new ConnectionException();
            }
            
            stmt = connect.createStatement();
            rs = stmt.executeQuery(query);
            
            if(rs.next()){
                car = new Carrello();
                int num = Integer.parseInt(rs.getString("*")) + 1;
                car.setID(String.valueOf(num));
            } 
        }finally{
            DBConnection.releaseConnection(connect);
        }
        
        
    }
    
    public void add(Carrello car, Product prod) throws SQLException{
        Connection connect = DBConnection.getConnection();

        String sql = "INSERT INTO Composizione (fk_idCarrello,fk_idProdotto) VALUES ('" + car.getID() + "','" + prod.getID() + ")";

        try {
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(sql);
            connect.commit();
        } finally {
            DBConnection.releaseConnection(connect);
        }
    }
    
    public void deleteProduct(Product prod, Carrello car) throws SQLException, ConnectionException {
        Connection connect = DBConnection.getConnection();
        
        String sql = "DELETE FROM Composizione WHERE fk_idCarrello =  '"
                        + car.getID()
                        + "' AND fk_idProdotto = '" 
                        + prod.getID()
                        + "'";

                        try {
                            Statement stmt = connect.createStatement();
                            stmt.executeUpdate(sql);
                            connect.commit();
                        } finally { 
                            DBConnection.releaseConnection(connect);
                        }
    }
}
