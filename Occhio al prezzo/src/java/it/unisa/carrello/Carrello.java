/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;


import it.unisa.prodotto.Prodotto;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class Carrello {
    
    private String ID;
    private String fk_email;

    public Carrello(){
        
    }
    
    public void setID(String ID){
        this.ID = ID;
    }
    
    public String getID(){
        return ID;
    }
    
    public void setEmail(String email){
        this.fk_email = email;
    }
    
    public String getEmail(){
        return fk_email;
    }
}
