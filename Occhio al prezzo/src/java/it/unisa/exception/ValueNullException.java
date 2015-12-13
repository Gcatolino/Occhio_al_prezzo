/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.exception;

/**
 *
 * @author raffaele
 */
public class ValueNullException extends Exception{

    public ValueNullException() {
        
        super("Non puoi passare un riferimento null ");
    }
    
    public ValueNullException(String mess){
        super(mess);
    }
    
    
    
}
