
package it.unisa.account;

import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import it.unisa.exception.ConnectionException;
import it.unisa.exception.ValueNullException;
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
 * @author raffaele donadiO
 */
public class AccountManagerTest {
    private Account acc;
    
    public AccountManagerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail("salernitana22@gmail.com");
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComune_di_residenza("salerno");
        acc.setCognome("donadio");
        acc.setData_di_nascita("1993-12-12");
    }
    
    @After
    public void tearDown() {
        AccountManager instance = new AccountManager();
        try {
            if (instance.getAccountByEmail(acc.getEmail()) != null){
                
                instance.deleteAccount(acc);}
        } catch (SQLException ex) {
            Logger.getLogger(AccountManagerTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ConnectionException ex) {
            Logger.getLogger(AccountManagerTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ValueNullException ex) {
            Logger.getLogger(AccountManagerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Test of getInstance method, of class AccountManager.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        AccountManager result = AccountManager.getInstance();
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of add method, of class AccountManager.
     */
    @Test
    public void testAdd() throws Exception {
        System.out.println("add");
        AccountManager instance = new AccountManager();
        instance.add(acc);
        Account result = instance.getAccountByEmail(acc.getEmail());
        assertEquals(acc.getEmail(),result.getEmail());
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAccountByEmail method, of class AccountManager.
     */
   @Test
    public void testGetAccountByEmail() throws Exception {
        System.out.println("getAccountByEmail");
        AccountManager instance = new AccountManager();
        instance.add(acc);
        Account result = instance.getAccountByEmail(acc.getEmail());
        assertEquals(acc.getEmail(), result.getEmail());
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of getAccoutnByFiltri method, of class AccountManager.
     */
    @Test
    public void testGetAccoutnByFiltri() throws Exception {
        System.out.println("getAccoutnByFiltri");
        AccountManager instance = new AccountManager();
        instance.add(acc);
        ArrayList<Account> result = instance.getAccoutnByFiltri(acc.getDomicilio());
        assertEquals(1, result.size());
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of modificaAccount method, of class AccountManager.
     */
    @Test
    public void testModificaAccount() throws Exception {
        System.out.println("modificaAccount");
        AccountManager instance = new AccountManager();
        instance.add(acc);
        acc.setNome("ciao");
        instance.modificaAccount(acc);
        Account ac=instance.getAccountByEmail(acc.getEmail());
        assertEquals("ciao",ac.getNome());
        
        
        
        // TODO review the generated test code and remove the default call to fail.
      
    }

    /**
     * Test of deleteAccount method, of class AccountManager.
     */
    @Test
       public void testDeleteAccount() throws Exception {
        System.out.println("deleteAccount");
        AccountManager instance = new AccountManager();
        instance.add(acc);
        instance.deleteAccount(acc);
        Account ac=instance.getAccountByEmail(acc.getEmail());
        assertEquals(null,ac);
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
