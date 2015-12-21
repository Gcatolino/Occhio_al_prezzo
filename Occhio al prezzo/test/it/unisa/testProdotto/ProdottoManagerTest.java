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
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
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
    private Prodotto prodotto;
    private int idUltimoProdottoPrimaDiInserimento;
    
    public ProdottoManagerTest() {
        
    }
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() throws Exception{
        prodotto = new Prodotto();
        prodotto.setMarca("RIO MARE");
        prodotto.setNome("Tonno");
        prodotto.setTaglia("3");
        prodotto.setPrezzo(4.29);
        prodotto.setPuntoVendita("Carrefour");
        prodotto.setFkEmail("a@gmail.com");
        prodotto.setData("2015-12-15");
        prodotto.setPathImmagine("C:\\\\immagini");
        
        idUltimoProdottoPrimaDiInserimento = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getID();
    }
    
    @After
    public void tearDown() {
        try {
            int idUltimoProdotto = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getID();
            if(idUltimoProdotto > idUltimoProdottoPrimaDiInserimento){
                try {
                    ProdottoManager.getInstance().delete(idUltimoProdotto);
                } catch (SQLException ex) {
                    Logger.getLogger(ProdottoManagerTest.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(ProdottoManagerTest.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdottoManagerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    public void testInsert() throws Exception{
        System.out.println("insert");
        
        ProdottoManager.getInstance().insert(prodotto);
        Prodotto inserito = ProdottoManager.getInstance().ricercaUltimoProdottoInserito();
        
        assertEquals(prodotto.getNome(),inserito.getNome());
    }
    
     /**
     * Test di update della classe ProdottoManager.
     * 
     * 
     */
    @Test
    public void testUpdate() throws Exception {
        int idProdottoDaAggiornare;
        System.out.println("update");
        
        ProdottoManager.getInstance().insert(prodotto);
        prodotto.setNome("Pesce");
        
        idProdottoDaAggiornare = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getID();
        
        ProdottoManager.getInstance().update(idProdottoDaAggiornare, prodotto);
        Prodotto aggiornato = ProdottoManager.getInstance().ricercaUltimoProdottoInserito();
        
        assertEquals("Pesce", aggiornato.getNome());
        
    }
    
     /**
     * Test di delete della classe ProdottoManager.
     * 
     * 
     */
    @Test
    public void testDelete() throws Exception {
        int idProdottoDaEliminare;
        int idUltimoProdottoPrimaInserimento;
        int idUltimoProdottoDopoInserimento;
        
        System.out.println("delete");
        
        idUltimoProdottoPrimaInserimento = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getID();
        ProdottoManager.getInstance().insert(prodotto);
        
        idProdottoDaEliminare = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getID();
        ProdottoManager.getInstance().delete(idProdottoDaEliminare);
        
        idUltimoProdottoDopoInserimento = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getID();
        
        assertEquals(idUltimoProdottoDopoInserimento, idUltimoProdottoPrimaInserimento);
        
    }
    
    /**
     * Test di ricercaProdottiPerNome della classe ProdottoManager
     * 
     * 
     */
    @Test
    public void testRicercaProdottiPerNome() throws Exception {
        System.out.println("ricercaProdottiPerNome");
        
        ArrayList<Prodotto> prodotti;
        String nomeProdottoDaRicerca = prodotto.getNome();
        
        ProdottoManager.getInstance().insert(prodotto);
        prodotti = ProdottoManager.getInstance().ricercaProdottiPerNome(nomeProdottoDaRicerca);
 
        assertTrue(!prodotti.isEmpty());
    }
    
    /**
     * Test di ricercaProdottiPerPuntoVendita della classe ProdottoManager
     * 
     * 
     */
    @Test
    public void testRicercaProdottiPerPuntoVendita() throws Exception{
        System.out.println("ricercaProdottiPerPuntoVendita");
        
        ArrayList<Prodotto> prodotti;
        String puntoVendita = prodotto.getPuntoVendita();
        
        ProdottoManager.getInstance().insert(prodotto);
        prodotti = ProdottoManager.getInstance().ricercaProdottiPerPuntoVendita(puntoVendita);
        
        assertTrue(!prodotti.isEmpty());
    }
}