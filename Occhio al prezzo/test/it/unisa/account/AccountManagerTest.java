
package it.unisa.account;

import it.unisa.account.Account;
import it.unisa.account.AccountManager;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author raffaele donadio
 */
public class AccountManagerTest {
    private Account acc;
    private String email;
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
        email="salernitana22@gmaiil.com";
    }
    
    @After
    public void tearDown() {
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
        Account result = instance.getAccountByEmail(email);
        assertEquals(acc,result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getAccountByEmail method, of class AccountManager.
     */
   @Test
    public void testGetAccountByEmail() throws Exception {
        System.out.println("getAccountByEmail");
        AccountManager instance = new AccountManager();
        Account result = instance.getAccountByEmail(email);
        assertEquals(acc, result);
        // TODO review the generated test code and remove the default call to fail.
       
    }

    /**
     * Test of getAccoutnByFiltri method, of class AccountManager.
     */
    @Test
    public void testGetAccoutnByFiltri() throws Exception {
        System.out.println("getAccoutnByFiltri");
        String domicilio = "mercato san severino";
        AccountManager instance = new AccountManager();
        ArrayList<Account> expResult = new ArrayList<Account>();
        expResult.add(acc);
        ArrayList<Account> result = instance.getAccoutnByFiltri(domicilio);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of modificaAccount method, of class AccountManager.
     */
    @Test
    public void testModificaAccount() throws Exception {
        System.out.println("modificaAccount");
        AccountManager instance = new AccountManager();
        acc.setNome("ciao");
        instance.modificaAccount(acc);
        Account ac=instance.getAccountByEmail("salernitana22@gmail.com");
        assertEquals(acc,ac);
        
        
        
        // TODO review the generated test code and remove the default call to fail.
      
    }

    /**
     * Test of deleteAccount method, of class AccountManager.
     */
    @Test
       public void testDeleteAccount() throws Exception {
        System.out.println("deleteAccount");
        AccountManager instance = new AccountManager();
        instance.deleteAccount(acc);
        Account ac=instance.getAccountByEmail("salernitana22@gmail.com");
        assertEquals(null,ac);
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
