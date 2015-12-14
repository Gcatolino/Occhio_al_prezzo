/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.testProdotto;

import it.unisa.exception.ValueNullException;
import it.unisa.prodotto.Prodotto;
import it.unisa.prodotto.ProdottoManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author andreapilato
 */
public class ProdottoManagerTest {
    
    public ProdottoManagerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    
     /**
     * Test di getInstance della classe ProdottoManager.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        
        ProdottoManager result = ProdottoManager.getInstance();
        assertNotNull(result);
    }
    
     /**
     * Test di insert della classe ProdottoManager.
     *
     */
    @Test
    public void testInsert() {
        
            System.out.println("insert");
            
            Prodotto prodotto = new Prodotto();
            
            prodotto.setMarca("Bauli");
            prodotto.setNome("Pandoro");
            prodotto.setTaglia("1");
            prodotto.setPrezzo(3.99);
            prodotto.setPuntoVendita("Carrefour");
            prodotto.setFkEmail("a@gmail.com");
            prodotto.setData("2016-12-12");
            prodotto.setPathImmagine("C:\\\\immagini");
        try {
            ProdottoManager.getInstance().insert(prodotto);
        } catch (SQLException | ValueNullException ex) {
            Logger.getLogger(ex.getMessage());
        }
    }
    
     /**
     * Test di update della classe ProdottoManager.
     * 
     * 
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        
        int idProdottoDaAggiornare = 1;
        Prodotto prodotto = new Prodotto();
        
        prodotto.setMarca("Bauli");
        prodotto.setNome("Pandoro");
        prodotto.setTaglia("1");
        prodotto.setPrezzo(4.99);
        prodotto.setPuntoVendita("Carrefour");
        prodotto.setFkEmail("a@gmail.com");
        prodotto.setData("2015-12-12");
        prodotto.setPathImmagine("C:\\\\immagini");
       
        try {
            ProdottoManager.getInstance().update(idProdottoDaAggiornare, prodotto);
        } catch (ClassNotFoundException | SQLException | IOException | ValueNullException ex) {
            Logger.getLogger(ex.getMessage());
        }
    }
    
     /**
     * Test di delete della classe ProdottoManager.
     * 
     * \
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        
        int idProdottoDaEliminare = 5;
        
        try {
            ProdottoManager.getInstance().delete(idProdottoDaEliminare);
        } catch (ClassNotFoundException | SQLException | IOException ex) {
            Logger.getLogger(ex.getMessage());
        }
    }
    
    /**
     * Test di ricercaProdottiPerNome della classe ProdottoManager
     * 
     * 
     */
    @Test
    public void testRicercaProdottiPerNome() {
        System.out.println("ricercaProdottiPerNome");
        
        ArrayList<Prodotto> prodotti;
        String nomeProdottoDaRicerca = "Birra";
        
        try {
            prodotti = ProdottoManager.getInstance().ricercaProdottiPerNome(nomeProdottoDaRicerca);
            
            for(Prodotto p : prodotti){
                assertEquals(p.getNome(), nomeProdottoDaRicerca);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ex.getMessage());
        }
        
        
    }
    
    /**
     * Test di ricercaProdottiPerPuntoVendita della classe ProdottoManager
     * 
     * 
     */
    @Test
    public void testRicercaProdottiPerPuntoVendita() {
        System.out.println("ricercaProdottiPerPuntoVendita");
        
        ArrayList<Prodotto> prodotti;
        String puntoVendita = "Carrefour";
        
        try {
            prodotti = ProdottoManager.getInstance().ricercaProdottiPerPuntoVendita(puntoVendita);
            
            for(Prodotto p : prodotti){
                assertEquals(p.getPuntoVendita(), puntoVendita);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ex.getMessage());
        }
    }
}
