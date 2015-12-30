/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.prodotto;

import it.unisa.exception.ValueNullException;
import it.unisa.utility.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import it.unisa.utility.UtilityVar;
import java.util.Collection;
import java.util.Collections;
import java.util.Objects;

/**
 * ProdottoManager
 
 Classe che si occupa delle operazioni da svolgere 
 sul DB, riguardanti l'oggetto Prodotto.
 * 
 * @author andreapilato
 * @version 1.0
 * 
 */
public class ProdottoManager {
    
    /**
     * Il nome della tabella
     */
    private static final String TABELLA_PRODOTTO = "Prodotto";
    
    //  istanza della classe
    private static ProdottoManager instance;
    
    /**
     * Il costruttore della classe e' dichiarato privato, per evitare
     * l'istanziazione di oggetti della classe.
     */
    private ProdottoManager() {
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
    public static synchronized ProdottoManager getInstance(){
        if(instance == null){
            instance = new ProdottoManager();
        }
        return instance;
    }
    
    /**
     * Metodo della classe incaricato di inserire nuovi Prodotti
     * all'interno del DB.
     *
     * @param prodotto
     * 
     * @throws java.sql.SQLException
     * @throws it.unisa.exception.ValueNullException
     */
    public synchronized void inserimento(Prodotto prodotto) throws SQLException, ValueNullException {
        try(Connection connessione = DBConnection.getConnection()) {
            /*
             * Prepariamo la stringa SQL per inserire un nuovo record 
             * nella tabella Prodotto
             */
            if(valoriNonNulli(prodotto)){
                    
                StringBuilder insertSQL = new StringBuilder("INSERT INTO ");
                    insertSQL.append(ProdottoManager.TABELLA_PRODOTTO);
                    insertSQL.append(" (marca, nome, taglia, prezzo, ");
                    insertSQL.append(" punto_vendita, fk_email, data, path_immagine)");
                    insertSQL.append(" VALUES ('");
                    insertSQL.append(prodotto.getMarca());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getNome());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getTaglia());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getPrezzo());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getPuntoVendita());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getFkEmail());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getData());
                    insertSQL.append("','");
                    insertSQL.append(prodotto.getPathImmagine());
                    insertSQL.append("')");
            
                try{
                    System.out.println("La query "+insertSQL);
                    UtilityVar.execute(connessione, insertSQL.toString());
                
                    connessione.commit();
                } catch (SQLException e){
                    System.out.println(e.getMessage());
                } finally {
                DBConnection.releaseConnection(connessione);
                }
            } else{
                throw new ValueNullException("Campi NULL o vuoti non sono consentiti");
            }
        }
    }
    
    /**
     * Metodo della classe incaricato di aggiornare un Prodotto
     * all'interno del DB.
     *
     * @param vecchioIdProdotto
     * @param prodotto
     * 
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     * @throws it.unisa.exception.ValueNullException
     */
    public synchronized void modifica(int vecchioIdProdotto, Prodotto prodotto) throws  SQLException, IOException, ValueNullException {
        try (Connection connessione = DBConnection.getConnection()) {

            /*
             * Prepariamo la stringa SQL per modificare un record 
             * della tabella Prodotto
             */
            if(valoriNonNulli(prodotto)){
                StringBuilder updateSQL = new StringBuilder("UPDATE ");
                        updateSQL.append(ProdottoManager.TABELLA_PRODOTTO );
                        updateSQL.append(" set marca = '");
                        updateSQL.append(prodotto.getMarca());
                        updateSQL.append("', nome = '");
                        updateSQL.append(prodotto.getNome());
                        updateSQL.append("', taglia = '");
                        updateSQL.append(prodotto.getTaglia());
                        updateSQL.append("', prezzo = ");
                        updateSQL.append(prodotto.getPrezzo());
                        updateSQL.append(", punto_vendita ='");
                        updateSQL.append(prodotto.getPuntoVendita());
                        updateSQL.append("', fk_email = '");
                        updateSQL.append(prodotto.getFkEmail());
                        updateSQL.append("', data = '");
                        updateSQL.append(prodotto.getData());
                        updateSQL.append("', path_immagine= '");
                        updateSQL.append(prodotto.getPathImmagine());
                        updateSQL.append("'  WHERE idProdotto = ");
                        updateSQL.append(vecchioIdProdotto);         
                    
                try{
                    System.out.println("La query "+updateSQL);
                
                    //Inviamo la Query al DataBase
                    UtilityVar.execute(connessione, updateSQL.toString());
                
                    connessione.commit(); 
                } catch (SQLException e){
                    System.out.println(e.getMessage());
                } finally {
                DBConnection.releaseConnection(connessione);
                }
            } else{
                controlla(prodotto);
                throw new ValueNullException("Campi NULL o vuoti non sono consentiti");     
            }
        }
    }
    
    /**
     * Metodo della classe incaricato di eliminare un Prodotto
     * all'interno del DB, in base ad un ID.
     *
     * @param idProdotto
     * 
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     */
    public synchronized void elimina(int idProdotto) throws SQLException, IOException {
        Connection connessione = null;
        try{
            // Otteniamo una Connessione al DataBase
            connessione = DBConnection.getConnection();
            
            /*
             * Prepariamo la stringa SQL per eliminare un record 
             * della tabella Prodotto
             */
            StringBuilder deleteSQL = new StringBuilder("DELETE FROM ");
                    deleteSQL.append(ProdottoManager.TABELLA_PRODOTTO);
                    deleteSQL.append(" WHERE idProdotto = ");
                    deleteSQL.append(idProdotto);

            System.out.println("La query "+deleteSQL);
            
            //Inviamo la Query al DataBase
            UtilityVar.execute(connessione, deleteSQL.toString());
            
            connessione.commit();
        } finally {
            DBConnection.releaseConnection(connessione);
        }
    }
    
    /**
     * Metodo della classe incaricato di ricercare Prodotti
     * all'interno del DB, in base al campo nome.
     *
     * @param nomeProdotto
     * 
     * @throws java.sql.SQLException
     * 
     * @return ArrayList contenente il risultato della ricerca.
     * 
     */
    public synchronized ArrayList<Prodotto> ricercaProdottiPerNome(String nomeProdotto) throws SQLException {
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        
        Connection connessione = null;
        try {
            // Otteniamo una Connessione al DataBase
            connessione = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per ricercare i record 
             * nella tabella Prodotto, in base al campo "nome"
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProdottoManager.TABELLA_PRODOTTO);
                    querySQL.append(" WHERE nome = '");
                    querySQL.append(nomeProdotto);
                    querySQL.append("'");

            System.out.println("La query "+querySQL);
            
            //Inviamo la Query al DataBase
            ResultSet risultato = UtilityVar.executeQuery(connessione,querySQL.toString());

            /*
             * Scorriamo il risultato della query, per ogni tupla viene creato
             * un nuovo oggetto Prodotto, che a sua volta è aggiunto ad un 
             * ArrayList di Prodotto
             */
            while (risultato.next()) {
                prodotti.add(riempiRisultato(risultato));
            }
            
            Collections.sort(prodotti);

        } finally {
            DBConnection.releaseConnection(connessione);
        }
        
        return prodotti;
    }
    
    /**
     * Metodo della classe incaricato di ricercare Prodotti
     * inseriti all'interno del DB, da parte di un venditore.
     *
     * @param fkEmail
     * 
     * @throws java.sql.SQLException
     * 
     * @return ArrayList contenente il risultato della ricerca.
     */
    public synchronized ArrayList<Prodotto> ricercaProdottiPerPuntoVendita(String fkEmail) throws SQLException {
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        
        Connection connessione = null;
        try {
            // Otteniamo una Connessione al DataBase
            connessione = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per ricercare i record 
             * nella tabella Prodotto, in base al campo "nome"
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProdottoManager.TABELLA_PRODOTTO);
                    querySQL.append(" WHERE fk_email = '");
                    querySQL.append(fkEmail);
                    querySQL.append("'");

            System.out.println("La query "+querySQL);
            
            //Inviamo la Query al DataBase
            ResultSet risultato = UtilityVar.executeQuery(connessione,querySQL.toString());

            /*
             * Scorriamo il risultato della query, per ogni tupla viene creato
             * un nuovo oggetto Prodotto, che a sua volta è aggiunto ad un 
             * ArrayList di Prodotto
             */
            while (risultato.next()) {
                prodotti.add(riempiRisultato(risultato));
            }

        } finally {
            DBConnection.releaseConnection(connessione);
        }
        
        return prodotti;
    }
      
    /**
     * Metodo della classe incaricato di ricercare l'ultimo
     * prodotto inserito all'interno del DB.
     *
     * @throws java.sql.SQLException
     * 
     * @return ultimo prodotto inserito.
     */
    public synchronized Prodotto ricercaUltimoProdottoInserito() throws SQLException {
        Prodotto p = new Prodotto();
        Connection connessione = null;
        try {
            // Otteniamo una Connessione al DataBase
            connessione = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per ricercare i record 
             * nella tabella Prodotto, in base al campo "nome"
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProdottoManager.TABELLA_PRODOTTO);
                    querySQL.append(" ORDER BY idProdotto DESC LIMIT 1");
            
            //Inviamo la Query al DataBase
            ResultSet risultato = UtilityVar.executeQuery(connessione,querySQL.toString());
            if(risultato.next()){
                p = riempiRisultato(risultato);
                risultato.close();
            }
            return p;
        } finally {
            DBConnection.releaseConnection(connessione);
        }
    }
    
    public synchronized Prodotto ricercaProdottoPerID(int idProdotto) throws SQLException {
        Prodotto p = new Prodotto();
        Connection connessione = null;
        try {
            // Otteniamo una Connessione al DataBase
            connessione = DBConnection.getConnection();

            /*
             * Prepariamo la stringa SQL per ricercare i record 
             * nella tabella Prodotto, in base al campo "nome"
             */
            StringBuilder querySQL = new StringBuilder("SELECT * FROM ");
                    querySQL.append(ProdottoManager.TABELLA_PRODOTTO);
                    querySQL.append(" WHERE idProdotto = '");
                    querySQL.append(idProdotto);
                    querySQL.append("'");
            
            //Inviamo la Query al DataBase
            ResultSet risultato = UtilityVar.executeQuery(connessione,querySQL.toString());
            if(risultato.next()){
                p = riempiRisultato(risultato);
                risultato.close();
            }
            return p;
        } finally {
            DBConnection.releaseConnection(connessione);
        }
    }
    /**
     * Metodo della classe incaricato di controllare
     * se ci sono campi NULL dove non sarebbero consentiti 
     * all'interno del DB.
     *
     * @param prodotto
     * 
     * @throws 
     * 
     * @return true se non ci sono valori NULL, false altrimenti.
     */
    private boolean valoriNonNulli(Prodotto prodotto){
        if(!Objects.isNull(prodotto.getMarca()) && !Objects.isNull(prodotto.getNome()) &&
                    !Objects.isNull(prodotto.getPuntoVendita()) && !Objects.isNull(prodotto.getTaglia()) &&
                    (prodotto.getPrezzo() != 0) ){
            return true;
        }
        return false;
    }
    
    
    private Prodotto riempiRisultato (ResultSet risultato) throws SQLException{
        Prodotto prodotto = new Prodotto();
        risultato.getInt("idProdotto");
        prodotto.setId(risultato.getInt("idProdotto"));
        prodotto.setMarca(risultato.getString("marca"));
        prodotto.setNome(risultato.getString("nome"));
        prodotto.setTaglia(risultato.getString("taglia"));
        prodotto.setPuntoVendita(risultato.getString("punto_vendita"));
        prodotto.setPrezzo(risultato.getFloat("prezzo"));
        prodotto.setFkEmail(risultato.getString("fk_email"));
        prodotto.setData(risultato.getDate("data"));
        prodotto.setPathImmagine(risultato.getString("path_immagine"));

        return prodotto;
    }
    
    private void controlla(Prodotto prodotto){
        if(prodotto.getNome() == null)
            System.out.println("nome null");
        if(prodotto.getMarca()== null)
            System.out.println("marca null");
        if(prodotto.getData()== null)
            System.out.println("data null");
        if(prodotto.getFkEmail() == null)
            System.out.println("fk null");
        if(prodotto.getPrezzo() == 0)
            System.out.println("prezzo null");
        if(prodotto.getPuntoVendita() == null)
            System.out.println("punto vendita null");
        if(prodotto.getTaglia()== null)
            System.out.println("taglia null");
        
    }
}
