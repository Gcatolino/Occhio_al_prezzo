package it.unisa.account;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import it.unisa.autenticazione.AutenticazioneManager;
import it.unisa.utility.UtilityVar;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author michele
 */
public class AutenticazioneManagerTest {
    
    public AutenticazioneManagerTest() {
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
     * Test of getInstance method, of class AutenticazioneManager.
     */
    @Test
    public void testGetInstance() {
         System.out.println("getInstance");
        AccountManager result = AccountManager.getInstance();
        assertNotNull(result);
    }

    /**
     * Test of login method, of class AutenticazioneManager.
     */
    @Test
    public void testLogin() throws Exception {
        System.out.println("login");
         Account acc;
        acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail("prova");
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComuneDiResidenza("salerno");
        acc.setCognome("donadio");
        acc.setDataDiNascita(UtilityVar.parseData("1993-12-12"));
        String email = "prova";
        String password = "1111";
        AccountManager instance = AccountManager.getInstance();
        instance.aggiungi(acc);
        AutenticazioneManager inst=AutenticazioneManager.getInstance();
        Account result = inst.login(email, password);
        assertEquals(result, acc);
        instance.eliminaAccount(acc);
    }  
}