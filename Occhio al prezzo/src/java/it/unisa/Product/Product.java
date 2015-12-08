/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.Product;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author andreapilato
 */
public class Product implements Serializable{
    
    private int ID;
    private String marca;
    private String name;
    private String size;
    private float price;
    private String store;
    private String fkEmail;
    private Date date;

    public Product() {
        super();
    }

    
    public void setID(int ID) {
        this.ID = ID;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public void setFkEmail(String fkEmail) {
        this.fkEmail = fkEmail;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getID() {
        return ID;
    }

    public String getMarca() {
        return marca;
    }

    public String getName() {
        return name;
    }

    public String getSize() {
        return size;
    }

    public float getPrice() {
        return price;
    }

    public String getStore() {
        return store;
    }

    public String getFkEmail() {
        return fkEmail;
    }

    public Date getDate() {
        return date;
    }
}
