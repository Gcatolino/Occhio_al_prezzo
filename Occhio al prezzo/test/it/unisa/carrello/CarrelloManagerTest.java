/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.utility.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        Statement stmt = null;
        ResultSet rs = null;
        carr = new Carrello();
        carr.setID("2");
        carr.setEmail("a@gmail.com");
        CarrelloManager instance = CarrelloManager.getInstance();
        instance.add(carr);
        Connection connection = DBConnection.getConnection();
        String sql = "select * from Carrello where (idCarrello='"+carr.getID()+"')";
          if (connection == null) {
                    throw new ConnectionException();
                }

                stmt = connection.createStatement();
                rs = stmt.executeQuery(sql);

                if (rs.next())
                    assertEquals("2",rs.getString("idCarrello"));  
        
         instance.deleteCarrello(carr);
    }

    /**
     * Test of deleteCarrello method, of class CarrelloManager.
     */
    @Test
    public void testDeleteCarrello() throws Exception {
        System.out.println("delete");
        Statement stmt = null;
        ResultSet rs = null;
        carr = new Carrello();
        carr.setID("2");
        carr.setEmail("a@gmail.com");
        CarrelloManager instance =CarrelloManager.getInstance();
        instance.deleteCarrello(carr);
        
        
        Connection connection = DBConnection.getConnection();
        String sql = "select * from Carrello where (idCarrello='"+carr.getID()+"')";
          if (connection == null) {
                    throw new ConnectionException();
                }

                stmt = connection.createStatement();
                rs = stmt.executeQuery(sql);

                assertEquals(rs.next(),false);
                 
            }
    
}
