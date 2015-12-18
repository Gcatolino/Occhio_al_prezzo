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
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class CarrelloManager {
    
    private static CarrelloManager instance;
    
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
                stmt.executeUpdate(sql);
                conn.commit();
            } finally {
                DBConnection.releaseConnection(conn);
            }
                    
        }else throw new ValueNullException();
    }
    
    public void addProdotto(Prodotto prod, Carrello car) throws SQLException, ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        
        
        if(!UtilityVar.isNull(prod.getID()) && !UtilityVar.isNull(car.getID())){
            
            String sql = "INSERT INTO Composizione (fk_idCarrello, fk_idProdotto) VALUES ('"
                         + car.getID() + "','" + prod.getID() + "')";
            
            try{
                Statement st = conn.createStatement();
                st.executeUpdate(sql);
                conn.commit();
            } finally{
                DBConnection.releaseConnection(conn);
            }
            
        }
        
    }
    
    public ArrayList<Prodotto> visualizzaCarrello(Carrello carr) throws SQLException, ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        Prodotto prod = null;
        ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
        
        if(!UtilityVar.isNull(carr)){
            
            String sql = "SELECT fk_idProdotto FROM Composizione WHERE fk_idCarrello= '" + carr.getID() + "'";
            
            try{
                
                Statement st = conn.createStatement();
                ResultSet rs  = st.executeQuery(sql);
                
                if(rs.next()){
                    prod = new Prodotto();
                    prod.setID(rs.getInt("fk_idProdotto"));
                    prodotti.add(prod);
                }
            }finally{
                DBConnection.releaseConnection(conn);
            }
            
            return prodotti;
        }else  {
            DBConnection.releaseConnection(conn);
            throw new ValueNullException();
        }
    }
    
    public void eliminaProdotto(Prodotto prod) throws SQLException, ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(prod)){
            
            String sql = "DELETE FROM Composizione WHERE fk_idProdotto = '"
                         + prod.getID() + "'";
            
            try{
                Statement st = conn.createStatement();
                st.executeUpdate(sql);
                conn.commit();
                
            }finally{
                DBConnection.releaseConnection(conn);
            }
        }else{
            DBConnection.releaseConnection(conn);
            throw new ValueNullException();
        }
    }
    
    public void svuotaCarrello(Carrello carr) throws SQLException,ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(carr)){
            
            String sql = "DELETE FROM Composizione WHERE fk_idCarrello = '"
                          + carr.getID() + "'";
            
            try{
                Statement st = conn.createStatement();
                st.executeUpdate(sql);
                conn.commit();
            }finally{
                DBConnection.releaseConnection(conn);
            }
                    
        }else{
            DBConnection.releaseConnection(conn);
            throw new ValueNullException();
        }
    }
    
    
    public void deleteCarrello(Carrello carr) throws SQLException, ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(carr)){
            
            String sql = "DELETE FROM Carrello WHERE fk_email = '"
                         + carr.getEmail()
                         + "'";
            
            try{
                Statement stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                conn.commit();
            }finally {
                DBConnection.releaseConnection(conn);
            }
        }else throw new ValueNullException();
    }
    
}
