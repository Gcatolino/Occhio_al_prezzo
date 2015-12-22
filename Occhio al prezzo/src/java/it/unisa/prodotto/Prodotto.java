/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.prodotto;

import it.unisa.utility.UtilityVar;
import java.io.Serializable;
import java.sql.Date;

/**
 * Prodotto
 * 
 * Classe che definisce la struttura e i metodi setter
 * e getter dell'oggetto Prodotto.
 * 
 * @author andreapilato
 * @version 1.0
 * 
 */
public class Prodotto implements Serializable{
    
    private int id;
    private String marca;
    private String nome;
    private String taglia;
    private double prezzo;
    private String puntoVendita;
    private String fkEmail;
    private Date data;
    private String pathImmagine;

    public Prodotto() {
        super();
    }

    
    public void setId(int id) {
        this.id = id;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setTaglia(String taglia) {
        this.taglia = taglia;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public void setPuntoVendita(String puntoVendita) {
        this.puntoVendita = puntoVendita;
    }

    public void setFkEmail(String fkEmail) {
        this.fkEmail = fkEmail;
    }

    public void setData(String data) {
        this.data = UtilityVar.parseData(data);
    }
    
    public void setData(Date data){
        this.data = data;
    }
    public void setPathImmagine(String pathImmagine) {
        this.pathImmagine = pathImmagine;
    }

    public int getId() {
        return id;
    }

    public String getMarca() {
        return marca;
    }

    public String getNome() {
        return nome;
    }

    public String getTaglia() {
        return taglia;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public String getPuntoVendita() {
        return puntoVendita;
    }

    public String getFkEmail() {
        return fkEmail;
    }

    public Date getData() {
        return data;
    }
    
    public String getPathImmagine() {
        return pathImmagine;
    }
}
