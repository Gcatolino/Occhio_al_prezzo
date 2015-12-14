/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import java.sql.SQLException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Antonio
 */
public class CarrelloManagerTest {
    
    private Carrello carr;
    
    public CarrelloManagerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        carr = new Carrello();
        carr.setID("00001");
        carr.setEmail("antonio94c@gmail.com");
        
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getInstance method, of class CarrelloManager.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        CarrelloManager result = CarrelloManager.getInstance();
        assertNotNull(result);
    }

    /**
     * Test of add method, of class CarrelloManager.
     */
    @Test
    public void testAdd() throws Exception {
        System.out.println("add");
        try{
             CarrelloManager.getInstance().add(carr);
        } catch (SQLException ex){
            ex.getMessage();
        }
       
        
    }

    /**
     * Test of deleteCarrello method, of class CarrelloManager.
     */
    @Test
    public void testDeleteCarrello() throws Exception {
        System.out.println("deleteCarrello"); 
        
        try{
           CarrelloManager.getInstance().deleteCarrello(carr);
        }catch (SQLException ex){
            ex.getMessage();
        }
    }
    
}
