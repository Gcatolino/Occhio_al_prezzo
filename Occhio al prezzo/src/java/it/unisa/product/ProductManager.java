/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.product;

import it.unisa.utility.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import it.unisa.utility.UtilityVar;

/**
 * ProductManager
 * 
 * Classe che si occupa delle operazioni da svolgere 
 * sul DB, riguardanti l'oggetto Prodotto.
 * 
 * @author andreapilato
 * @version 1.0
 * 
 * 2015 - Copyright by University of Salerno
 */
public class ProductManager {
    
    /**
     * Il nome della tabella
     */
    private static final String TABLE_PRODUCT = "Prodotto";
    
    //  istanza della classe
    private static ProductManager instance;
    
    /**
     * Il costruttore della classe e' dichiarato privato, per evitare
     * l'istanziazione di oggetti della classe.
     */
    private ProductManager() {
        super();
    }
    
    /**
     * Metodo della classe incaricato della produzione degli oggetti, tale
     * metodo deve essere chiamato per restituire l'istanza del Singleton.
     * L'oggetto Singleton sara' istanziato solo alla prima invocazione del
     * metodo, nelle successive invocazioni, invece, sara' restituito un
     * riferimento allo stesso oggetto.
     *
     * @return L'istanza della classe
     */
    public static synchronized ProductManager getInstance(){
        if(instance == null){
            instance = new ProductManager();
        }
        return instance;
    }
    
    /**
     * Metodo della classe incaricato di inserire nuovi Prodotti
     * all'interno del DB.
     *
     * @param product
     * 
     * @throws java.sql.SQLException
     */
    public synchronized void insert(Product product) throws SQLException {
        try(Connection conn = DBConnection.getConnection()) {
            /*
             * Prepariamo la stringa SQL per inserire un nuovo record 
             * nella tabella Prodotto
             */
            StringBuilder insertSQL = new StringBuilder("INSERT INTO ");
                    insertSQL.append(ProductManager.TABLE_PRODUCT);
                    insertSQL.append(" (idProdotto, marca, nome, taglia, prezzo, ");
                    insertSQL.append(" punto_vendita, fk_email, data)");
                    insertSQL.append(" VALUES ('");
                    insertSQL.append(product.getID());
                    insertSQL.append("','");
                    insertSQL.append(product.getMarca());
                    insertSQL.append("','");
                    insertSQL.append(product.getName());
                    insertSQL.append("','");
                    insertSQL.append(product.getSize());
                    insertSQL.append("','");
                    insertSQL.append(product.getPrice());
                    insertSQL.append("','");
                    insertSQL.append(product.getStore());
                    insertSQL.append("','");
                    insertSQL.append(product.getFkEmail());
                    insertSQL.append("','");
                    insertSQL.append(product.getDate());
                    insertSQL.append("')");
            
            try{
                System.out.println("La query "+insertSQL);
                UtilityVar.execute(conn, insertSQL.toString());
                conn.commit();
            } catch (SQLException e){
                System.out.println(e.getMessage());
            }
        }
    }
    
    /**
     * Metodo della classe incaricato di aggiornare un Prodotto
     * all'interno del DB.
     *
     * @param oldProductID
     * @param product
     * 
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     */
    public synchronized void update(int oldProductID, Product product) throws ClassNotFoundException, SQLException, IOException {
        try (Connection conn = DBConnection.getConnection()) {

            /*
             * Prepariamo la stringa SQL per modificare un record 
             * della tabella Prodotto
             */
            StringBuilder updateSQL = new StringBuilder("UPDATE ");
                    updateSQL.append(ProductManager.TABLE_PRODUCT );
                    updateSQL.append(" set idProdotto = ");
                    updateSQL.append(product.getID());
                    updateSQL.append(", marca = '");
                    updateSQL.append(product.getMarca());
                    updateSQL.append("', nome = '");
                    updateSQL.append(product.getName());
                    updateSQL.append("', taglia = '");
                    updateSQL.append(product.getSize());
                    updateSQL.append("', prezzo = ");
                    updateSQL.append(product.getPrice());
                    updateSQL.append(", punto_vendita ='");
                    updateSQL.append(product.getStore());
                    updateSQL.append("', fk_email = '");
                    updateSQL.append(product.getFkEmail());
                    updateSQL.append("'  WHERE idProdotto = ");
                    updateSQL.append(oldProductID);         
                    
           try{
                System.out.println("La query "+updateSQL);
                
                //Inviamo la Query al DataBase
                UtilityVar.execute(conn, updateSQL.toString());
                conn.commit();
            } catch (SQLException e){
                System.out.println(e.getMessage());
            } 
        }
    }
    
    /**
     * Metodo della classe incaricato di eliminare un Prodotto
     * all'interno del DB, in base ad un ID.
     *
     * @param idProduct
     * 
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     */
    public synchronized void delete(int idProduct) throws ClassNotFoundException, SQLException, IOException {
        Connection conn = null;
        try{
            // Otteniamo una Connessione al DataBase
            conn = DBConnection.getConnection();
            /*
             * Prepariamo la stringa SQL per eliminare un record 
             * della tabella Prodotto
             */
            StringBuilder deleteSQL = new StringBuilder("DELETE FROM ");
                    deleteSQL.append(ProductManager.TABLE_PRODUCT);
                    deleteSQL.append(" WHERE idProdotto = ");
                    deleteSQL.append(idProduct);

            System.out.println("La query "+deleteSQL);
            
            //Inviamo la Query al DataBase
            UtilityVar.execute(conn, deleteSQL.toString());
            conn.commit();
        } finally {
            DBConnection.releaseConnection(conn);
        }
    }
    
    /**
     * Metodo della classe incaricato di ricercare Prodotti
     * all'interno del DB, in base al campo nome.
     *
     * @param productName
     * 
     * @throws java.sql.SQLException
     * 
     * @return ArrayList contenente il risultato della ricerca.
     * 
     */
    public synchronized ArrayList<Product> getProductsByName(String productName) throws SQLException {
        ArrayList<Product> products = new ArrayList<Product>();
        
        Connection conn = null;
        try {
            // Otteniamo una Connessione al DataBase
            conn = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per ricercare i record 
             * nella tabella Prodotto, in base al campo "nome"
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProductManager.TABLE_PRODUCT);
                    querySQL.append(" WHERE nome = '");
                    querySQL.append(productName);
                    querySQL.append("'");

            System.out.println("La query "+querySQL);
            
            //Inviamo la Query al DataBase
            ResultSet result = UtilityVar.executeQuery(conn,querySQL.toString());

            /*
             * Scorriamo il risultato della query, per ogni tupla viene creato
             * un nuovo oggetto Product, che a sua volta è aggiunto ad un 
             * ArrayList di Product
             */
            while (result.next()) {
                Product product = new Product();
                
                product.setID(result.getInt("idProdotto"));
                product.setMarca(result.getString("marca"));
                product.setName(result.getString("nome"));
                product.setSize(result.getString("prezzo"));
                product.setPrice(result.getFloat("prezzo"));
                product.setFkEmail(result.getString("fk_email"));
                product.setDate(result.getDate("data"));
                
                products.add(product);
            }

        } finally {
            DBConnection.releaseConnection(conn);
        }
        
        return products;
    }
    
    /**
     * Metodo della classe incaricato di ricercare Prodotti
     * inseriti all'interno del DB, da parte di un venditore.
     *
     * @param productStore
     * 
     * @throws java.sql.SQLException
     * 
     * @return ArrayList contenente il risultato della ricerca.
     */
    public synchronized ArrayList<Product> getSellerProducts(String productStore) throws SQLException {
        ArrayList<Product> products = new ArrayList<Product>();
        
        Connection conn = null;
        try {
            // Otteniamo una Connessione al DataBase
            conn = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per ricercare i record 
             * nella tabella Prodotto, in base al campo "nome"
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProductManager.TABLE_PRODUCT);
                    querySQL.append(" WHERE punto_vendita = '");
                    querySQL.append(productStore);
                    querySQL.append("'");

            System.out.println("La query "+querySQL);
            
            //Inviamo la Query al DataBase
            ResultSet result = UtilityVar.executeQuery(conn,querySQL.toString());

            /*
             * Scorriamo il risultato della query, per ogni tupla viene creato
             * un nuovo oggetto Product, che a sua volta è aggiunto ad un 
             * ArrayList di Product
             */
            while (result.next()) {
                Product product = new Product();
                
                product.setID(result.getInt("idProdotto"));
                product.setMarca(result.getString("marca"));
                product.setName(result.getString("nome"));
                product.setSize(result.getString("prezzo"));
                product.setPrice(result.getFloat("prezzo"));
                product.setFkEmail(result.getString("fk_email"));
                product.setDate(result.getDate("data"));
                
                products.add(product);
            }

        } finally {
            DBConnection.releaseConnection(conn);
        }
        
        return products;
    }
    
    
}
