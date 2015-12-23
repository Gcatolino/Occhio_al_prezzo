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
        
        idUltimoProdottoPrimaDiInserimento = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getId();
    }
    
    @After
    public void tearDown() {
        try {
            int idUltimoProdotto = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getId();
            if(idUltimoProdotto > idUltimoProdottoPrimaDiInserimento){
                try {
                    ProdottoManager.getInstance().elimina(idUltimoProdotto);
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
     * Test di inserimento della classe ProdottoManager.
     *
     */
    @Test
    public void testInserimento() throws Exception{
        System.out.println("insert");
        setUp();
        ProdottoManager.getInstance().inserimento(prodotto);
        Prodotto inserito = ProdottoManager.getInstance().ricercaUltimoProdottoInserito();
        
        assertEquals(prodotto.getNome(),inserito.getNome());
    }
    
     /**
     * Test di modifica della classe ProdottoManager.
     * 
     * 
     */
    @Test
    public void testModifica() throws Exception {
        int idProdottoDaAggiornare;
        System.out.println("update");
        
        ProdottoManager.getInstance().inserimento(prodotto);
        prodotto.setNome("Pesce");
        
        idProdottoDaAggiornare = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getId();
        
        ProdottoManager.getInstance().modifica(idProdottoDaAggiornare, prodotto);
        Prodotto aggiornato = ProdottoManager.getInstance().ricercaUltimoProdottoInserito();
        
        assertEquals("Pesce", aggiornato.getNome());
        
    }
    
     /**
     * Test di elimina della classe ProdottoManager.
     * 
     * 
     */
    @Test
    public void testElimina() throws Exception {
        int idProdottoDaEliminare;
        int idUltimoProdottoPrimaInserimento;
        int idUltimoProdottoDopoInserimento;
        
        System.out.println("delete");
        
        idUltimoProdottoPrimaInserimento = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getId();
        ProdottoManager.getInstance().inserimento(prodotto);
        
        idProdottoDaEliminare = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getId();
        ProdottoManager.getInstance().elimina(idProdottoDaEliminare);
        
        idUltimoProdottoDopoInserimento = ProdottoManager.getInstance().ricercaUltimoProdottoInserito().getId();
        
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
        
        ProdottoManager.getInstance().inserimento(prodotto);
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
        String fkEmail = prodotto.getFkEmail();
        
        ProdottoManager.getInstance().inserimento(prodotto);
        prodotti = ProdottoManager.getInstance().ricercaProdottiPerPuntoVendita(fkEmail);
        
        assertTrue(!prodotti.isEmpty());
    }
}