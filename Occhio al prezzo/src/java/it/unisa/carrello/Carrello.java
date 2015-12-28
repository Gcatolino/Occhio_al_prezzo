/**
 *CarrelloManager
 * 
 * Questa classe rappresenta l'astrazione di un carrello.
 * 
 * @author  Antonio Calabria
 *
 *2015 - Copyright
 */

package it.unisa.carrello;


import it.unisa.prodotto.Prodotto;
import java.util.ArrayList;

public class Carrello {
    
    private int ID;
    private String fkEmail;

    public Carrello(){
        
    }
    
    public void setID(int ID){
        this.ID = ID;
    }
    
    public int getID(){
        return ID;
    }
    
    public void setEmail(String email){
        this.fkEmail = email;
    }
    
    public String getEmail(){
        return fkEmail;
    }
}
