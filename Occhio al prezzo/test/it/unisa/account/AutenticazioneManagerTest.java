/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.autenticazione.tester;

import it.unisa.account.Account;
import it.unisa.autenticazione.AutenticazioneManager;
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
        AutenticazioneManager expResult = AutenticazioneManager.getInstance();
        AutenticazioneManager result = AutenticazioneManager.getInstance();
        assertEquals(expResult, result);
    }

    /**
     * Test of login method, of class AutenticazioneManager.
     */
    @Test
    public void testLogin() throws Exception {
        System.out.println("login");
        String email = "miao@gmail.com";
        String password = "baobao";
        AutenticazioneManager instance = new AutenticazioneManager();
        Account expResult = instance.login(email, password);
        Account result = instance.login(email, password);
        assertEquals(expResult.getEmail(), result.getEmail());
    }  
}