/**
 *CarrelloManager
 * 
 * Questa classe ha lo scopo di aggiornare e modificare i dati 
 * presenti nel database relativi alla gestione del Carrello.
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
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


public class CarrelloManager {
    
    private static CarrelloManager instance;
    
    public static CarrelloManager getInstance(){
        if(instance == null){
            instance = new CarrelloManager();
        }
        return instance;
    }
    

    public void aggiungiCarrello(Carrello carrello) throws SQLException,ValueNullException{
        
        Connection conn = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(carrello.getEmail())){
            
            
            String sql = "INSERT INTO carrello (idCarrello,fk_email) VALUES ('"
                          + carrello.getID() + "','"
                          + carrello.getEmail() + "')";
            
            try{
                Statement stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                conn.commit();
            } finally {
                DBConnection.releaseConnection(conn);
            }
                    
        }else throw new ValueNullException();
    }
    
    public void aggiungiProdotto(Prodotto prod, Carrello car) throws SQLException, ConnectionException, ValueNullException{
        Connection conn = DBConnection.getConnection();
        
        
        if(!UtilityVar.isNull(prod.getId()) && !UtilityVar.isNull(car.getID())){
            
            String sql = "INSERT INTO Composizione (fk_idCarrello, fk_idProdotto) VALUES ('"
                         + car.getID() + "','" + prod.getId() + "')";
            
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
                
                while(rs.next()){
                    prod = new Prodotto();
                    prod.setId(rs.getInt("fk_idProdotto"));
                    prod = riempiRisultato(prod);
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
                         + prod.getId() + "'";
            
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
    
    
    public void eliminaCarrello(Carrello carr) throws SQLException, ConnectionException, ValueNullException{
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

    private Prodotto riempiRisultato(Prodotto prod) throws SQLException, ConnectionException {
        Connection conn = DBConnection.getConnection();
        
        String sql = "SELECT * FROM Prodotto WHERE idProdotto = '" 
                   + prod.getId() + "'";
        
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        
        while(rs.next()){
            prod.setNome(rs.getString("nome"));
            prod.setMarca(rs.getString("marca"));
            prod.setTaglia(rs.getString("taglia"));
            prod.setPrezzo(rs.getDouble("prezzo"));
            prod.setPuntoVendita(rs.getString("punto_vendita"));
            prod.setPathImmagine(rs.getString("path_immagine"));
        }
        
        return prod;
    }
    
    public String recuperoID()throws SQLException, ConnectionException{
        Connection conn = DBConnection.getConnection();
        Carrello car = new Carrello();
        String sql = "SELECT count(idCarrello) FROM Carrello";
        
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);
        
        if(rs.next()){
            car.setID(rs.getString("count(idCarrello)"));
        }
        
        return car.getID();
                 
    }
    
}
