package it.unisa.account;

import java.util.Date;





/**
 *
 * @author raffaeledonadio
 */
public class Account {

    private String nome;
    private String cognome;
    private Date dataDiNascita;
    private String domicilio;
    private String comuneDiResidenza;
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

    public Date getDataDiNascita() {
        return dataDiNascita;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public String getComuneDiResidenza() {
        return comuneDiResidenza;
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
    public void setDataDiNascita(Date data_di_nascita) {
        this.dataDiNascita = data_di_nascita;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public void setComuneDiResidenza(String comune_di_residenza) {
        this.comuneDiResidenza = comune_di_residenza;
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
    /*è sufficiente che l'email sia uguale affinchè due oggetti di tipo Account
    siano uguali, questo per definizione del dominio applicativo*/
    public boolean equals(Object obj) {
        //System.out.println("passo da qua");
        if (!(obj instanceof Account))
            return false;
        Account temp=(Account)obj;
        return this.email.equals(temp.email);
}
    
   
  

  
}
