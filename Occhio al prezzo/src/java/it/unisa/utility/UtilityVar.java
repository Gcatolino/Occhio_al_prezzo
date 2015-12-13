/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * UtilityVar
 * 
 * Classe che si occupa delle operazioni di eseguire 
 * query SQL sul DB.
 * 
 * @author andreapilato
 * @version 1.0
 * 
 * 2015 - Copyright by University of Salerno
 */
public class UtilityVar {
    
    /**
     * Metodo della classe incaricato di eseguire 
     * le query di tipo INSERT,UPDATE e DELETE.
     *
     */
    
    public static void execute (Connection connection, String query) throws SQLException {
        
        Statement stmt = connection.createStatement();
        stmt.execute(query);
    }
    
    /**
     * Metodo della classe incaricato di eseguire 
     * le query di RICERCA.
     *
     * @return ResultSet della query
     */
    public static ResultSet executeQuery (Connection connection, String query) throws SQLException {
        
        Statement stmt = connection.createStatement();
        return stmt.executeQuery(query.toString());
    }
    
    public static boolean isNull(Object obj){
        if(obj==null) return true;
        else return false;
    }
}
