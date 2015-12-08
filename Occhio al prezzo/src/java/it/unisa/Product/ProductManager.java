/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.lang.StringBuilder;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author andreapilato
 */
public class ProductManager {
    
    /**
     * Il nome della tabella
     */
    private static final String TABLE_PRODUCT = "prodotto";
    
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

    public synchronized void insert(Product product) throws SQLException {
        try(Connection conn = DBConnection.getConnection()) {
            /*
             * Prepariamo la stringa SQL per inserire un nuovo record 
             * nella tabella phdCycle
             */
            StringBuilder insertSQL = new StringBuilder("INSERT INTO ");
                    insertSQL.append(ProductManager.TABLE_PRODUCT);
                    insertSQL.append(" (marca, nome, taglia, prezzo, ");
                    insertSQL.append(" punto vendita, fk_email, data)");
                    insertSQL.append(" VALUES ('");
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
                    
                    System.out.println("La query "+insertSQL);
                    
                    
                    conn.commit();
        }
    }
    
    public synchronized void update(int oldProductID, Product product) throws ClassNotFoundException, SQLException, IOException {
        try (Connection conn = DBConnection.getConnection()) {

            /*
             * Prepariamo la stringa SQL per modificare un record 
             * nella tabella phdCycle
             */
            StringBuilder updateSQL = new StringBuilder("UPDATE ");
                    updateSQL.append(ProductManager.TABLE_PRODUCT);
                    updateSQL.append(" set marca = '");
                    product.getMarca();
                    updateSQL.append(" set nome = '");
                    product.getName();
                    updateSQL.append(" set taglia = '");
                    product.getSize();
                    updateSQL.append(" set prezzo = '");
                    product.getPrice();
                    updateSQL.append(" set punto vendita = '");
                    product.getStore();
                    updateSQL.append(" set fk_email = '");
                    product.getFkEmail();
                    updateSQL.append(" ' WHERE idProdotto = ");
                    updateSQL.append(oldProductID);         

            System.out.println("La query "+updateSQL);
            //Inviamo la Query al DataBase

            conn.commit();
        }
    }
    
    public synchronized void delete(String idProduct) throws ClassNotFoundException, SQLException, IOException {
        Connection conn = null;
        try {
            // Otteniamo una Connessione al DataBase
            conn = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per modificare un record 
             * nella tabella phdCycle
             */
            StringBuilder deleteSQL = new StringBuilder("DELETE FROM ");
                    deleteSQL.append(ProductManager.TABLE_PRODUCT);
                    deleteSQL.append(" WHERE idProdotto = '");
                    deleteSQL.append(idProduct);
                    deleteSQL.append("'");

            //Inviamo la Query al DataBase
            System.out.println("La query "+deleteSQL);

            conn.commit();
        } finally {
            DBConnection.releaseConnection(conn);
        }
    }
    
    public synchronized List<Product> getProductsByName(String productName) throws SQLException {
        List<Product> products = new ArrayList<Product>();
        
        Connection conn = null;
        try {
            // Otteniamo una Connessione al DataBase
            conn = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per modificare un record 
             * nella tabella phdCycle
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProductManager.TABLE_PRODUCT);
                    querySQL.append(" WHERE nome = '");
                    querySQL.append(productName);
                    querySQL.append("'");

            //Inviamo la Query al DataBase
            System.out.println("La query "+querySQL);
            ResultSet result;

            while (result.next()) {
                Product product = new Product();
                
                product.setID(result.getInt("idProduct"));
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
