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
    
    private String ID;
    private String fkEmail;

    public Carrello(){
        
    }
    
    public void setID(String ID){
        this.ID = ID;
    }
    
    public String getID(){
        return ID;
    }
    
    public void setEmail(String email){
        this.fkEmail = email;
    }
    
    public String getEmail(){
        return fkEmail;
    }
}
