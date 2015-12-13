package it.unisa.account;

import java.util.Date;

/**
 *
 * @author raffaeledonadio
 */
public class Account {

    private String nome;
    private String cognome;
    private String data_di_nascita;
    private String domicilio;
    private String comune_di_residenza;
    private String ruolo;
    private String email;
    private String password;
    
    
    public Account(){
        
    }
    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public String getData_di_nascita() {
        return data_di_nascita;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public String getComune_di_residenza() {
        return comune_di_residenza;
    }

    public String getRuolo() {
        return ruolo;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }
    
    /*la data deve essere della forma aaaa-mm-gg*/
    public void setData_di_nascita(String data_di_nascita) {
        this.data_di_nascita = data_di_nascita;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public void setComune_di_residenza(String comune_di_residenza) {
        this.comune_di_residenza = comune_di_residenza;
    }

    public void setRuolo(String ruolo) {
        this.ruolo = ruolo;
    }

      public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    
   
  

  
}
