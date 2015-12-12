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
    
    private ArrayList<Prodotto> carrello;
    private String ID;
    private String email;

    public Carrello(){
        
        carrello = new ArrayList<Prodotto>();
    }
    
    public void addProdotto(Prodotto prod){
        boolean presente = false;
        
        for(int i=0; i <= carrello.size(); i++){
            if(prod.getID() == carrello.get(i).getID())
                presente = true;
            else presente = false;
        }
        
        if(presente)
            carrello.add(prod);
        }
    
    public void eliminaProdotto(Prodotto prod){
        for(int i= 0; i <= carrello.size(); i++){
            if(prod.getID() == carrello.get(i).getID())
                carrello.remove(prod);
            else return;
        }
    }
    
    public void svuotaCarrello(){
        if(carrello.size() > 0)
           carrello.removeAll(carrello);
    }
    
    public double getTot(){
        double totale=0;
     
        for(int i=0; i <= carrello.size(); i++)
               totale += carrello.get(i).getPrezzo();
        
        return totale;
    }
    
    public int getNumeroProdotto(){
        return carrello.size();
    }
    
    public void setID(String ID){
        this.ID = ID;
    }
    
    public String getID(){
        return ID;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getEmail(){
        return email;
    }
}
