/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unisa.carrello;

import it.unisa.exception.ConnectionException;
import it.unisa.prodotto.Prodotto;
import it.unisa.utility.DBConnection;
import java.net.ConnectException;
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
import java.util.ArrayList;
import java.util.Iterator;
/**
 *
 * @author Antonio
 */
public class CarrelloManagerTest {
    
    private Carrello carr;
    private Prodotto prod;
    
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
    
    @Test
    public void testAddProdotto() throws Exception{
        System.out.println("aggiungi prodotto al carrello");
        Statement st = null;
        ResultSet rs = null;
        
        prod = new Prodotto();
        prod.setID(13);
        
        carr = new Carrello();
        carr.setID("1");
        
        CarrelloManager instance = CarrelloManager.getInstance();
        instance.addProdotto(prod, carr);
        Connection conn = DBConnection.getConnection();
        String sql = "select * from Composizione where (fk_idCarrello='" 
                     + carr.getID() + "')"  + "AND" + "(fk_idProdotto = '"
                     + prod.getID() + "')";
        if(conn == null){
            throw new ConnectException();
        }
        
        st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        if(rs.next()){
            assertEquals("1", rs.getString("fk_idCarrello"));
        }
        
        instance.eliminaProdotto(prod);
    }
    
    @Test
    public void testVisualizzaCarrello() throws Exception{
        System.out.println("visualizza Carrello");
        
        Prodotto prod = new Prodotto();
        Prodotto prod1 = new Prodotto();
        
        prod.setID(12);
        prod1.setID(15);
        
        Carrello car = new Carrello();
        car.setID("1");
        
        CarrelloManager instance = CarrelloManager.getInstance();
        
        ArrayList<Prodotto> expResult = new ArrayList<Prodotto>();
        expResult.add(prod);
        expResult.add(prod1);
        
        ArrayList<Prodotto> result = instance.visualizzaCarrello(car);
        Iterator<Prodotto> iter = result.iterator();
        for(Prodotto p:result)
            if(iter.hasNext())
                assertEquals(p, iter.next());
    }
    
    @Test
    public void testEliminaProdotto() throws Exception{
        System.out.println("elimina prodotto");
        
        Statement st = null;
        ResultSet rs = null;
        
        Carrello car = new Carrello();
        car.setID("1");
        
        Prodotto prod = new Prodotto();
        prod.setID(5);
        
        CarrelloManager instance = CarrelloManager.getInstance();
        instance.addProdotto(prod, car);
        instance.eliminaProdotto(prod);
        
        Connection conn = DBConnection.getConnection();
        
        String sql = "SELECT fk_idProdotto FROM Composizione WHERE (fk_idProdotto='"
                      + prod.getID() + "')";
        
        if(conn == null){
            throw new ConnectException();
        }
        
        st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        if(rs.next()){
            assertEquals(rs.next(), false);
        }
        
    }
    
    @Test 
    public void testSvuotaCarrello() throws Exception{
        System.out.println("svuota carrello");
        Statement st = null;
        ResultSet rs = null;
        Carrello car = new Carrello();
        car.setID("1");
        
        CarrelloManager instance = CarrelloManager.getInstance();
        instance.svuotaCarrello(car);
        
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM Composizione WHERE fk_idCarrello='"
                     + car.getID() + "'";
        
        
        if(conn == null){
            throw new ConnectException();
        }
        
        st = conn.createStatement();
        rs = st.executeQuery(sql);
        
        assertEquals(rs.next(), false);
        
        Prodotto prod  = new Prodotto();
        Prodotto prod1 = new Prodotto();
        
        prod.setID(15);
        prod1.setID(12);
        
        instance.addProdotto(prod, car);
        instance.addProdotto(prod1, car);
        
    }

    /**
     * Test of deleteCarrello method, of class CarrelloManager.
     */
    @Test
    public void testDeleteCarrello() throws Exception {
        System.out.println("delete carrello");
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
