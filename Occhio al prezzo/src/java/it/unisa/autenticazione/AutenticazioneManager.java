/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.autenticazione;

import it.unisa.Account.Account;
import it.unisa.exception.ConnectionException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author michele
 */
public class AutenticazioneManager {
    
    private static AutenticazioneManager instance;

    public static AutenticazioneManager getInstance() {

        if (instance == null) {
            instance = new AutenticazioneManager();
        }
        return instance;

    }
    
    public Account login(String email, String password) throws SQLException {
        
        Connection connection = null;
        Statement stmt = null;
        ResultSet rs = null;
        Account account = null;

        String query = "select * from Account where email='" + email + "' and password='" + password + "'";

        try{
            connection = DBConnection.getConnection();

            if (connection == null){
                throw new ConnectionException();
        }

        stmt = connection.createStatement();
        rs = stmt.executeQuery(query);

        if (rs.next()){
        account = new Account();
        account.setEmail(rs.getString("email"));
        account.setPassword(rs.getString("password"));
        account.setRuolo(rs.getString("ruolo"));
        account.setNome(rs.getString("nome"));
        account.setCognome(rs.getString("cognome"));
        account.setData_di_nascita(rs.getDate("data di nascita"));
        account.setDomicilio(rs.getString("domicilio"));
        account.setComune_di_residenza(rs.getString("comune di residenza"));

        }

        } 
        finally {
            DBConnection.releaseConnection(connection);
        }

        return account;
    }   
}