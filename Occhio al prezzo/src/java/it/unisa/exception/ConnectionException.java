/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.exception;

/**
 *
 * @author Antonio
 */
public class ConnectionException extends Exception{

    public ConnectionException() {
        
        super("Unable to connect to the database ");
    }
    
    public ConnectionException(String mess){
        super(mess);
    }
    
    
    
}
