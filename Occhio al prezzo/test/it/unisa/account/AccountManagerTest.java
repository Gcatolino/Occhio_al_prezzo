package it.unisa.account;

import it.unisa.utility.UtilityVar;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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
/*NOTA IMPORTANTISSIMA:*/

public class AccountManagerTest {
 
    private String email;
    public AccountManagerTest() {
        
        email="prova";
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
     * Test of getAccountByEmail method, of class AccountManager.
     */
   @Test
    public void testGetAccountByEmail() throws Exception {
        System.out.println("getAccountByEmail");
        Account acc;
        acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail(email);
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComuneDiResidenza("salerno");
        acc.setCognome("donadio");
        acc.setDataDiNascita(UtilityVar.getDateSqlByString("1993-12-12"));
        
        AccountManager instance =  AccountManager.getInstance();
        instance.add(acc);
        Account result = instance.getAccountByEmail(email);
        assertEquals(acc, result);
        instance.deleteAccount(acc);
        // TODO review the generated test code and remove the default call to fail.
       
    }
 /**
     * Test of add method, of class AccountManager.
     */
    @Test/*non c'è bisogno di aggiungere l'account perchè prima che questo metodo venga 
    chiamato già viene aggiunto l'elemento*/
    public void testAdd() throws Exception {
        System.out.println("add");
        Account acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail(email);
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComuneDiResidenza("salerno");
        acc.setCognome("donadio");
        acc.setDataDiNascita(UtilityVar.getDateSqlByString("1993-12-12"));
        //---------------------------------
        AccountManager instance =  AccountManager.getInstance();
        instance.add(acc);
        Account result = instance.getAccountByEmail(email);
        assertEquals(acc,result);
        instance.deleteAccount(acc);

        
        // TODO review the generated test code and remove the default call to fail.
    }
    /**
     * Test of getAccoutnByFiltri method, of class AccountManager.
     */
    @Test
    public void testGetAccoutnByFiltri() throws Exception {
        System.out.println("getAccoutnByFiltri");
        String domicilio = "mercato san severino";
        Account acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail(email);
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComuneDiResidenza("salerno");
        acc.setCognome("donadio");
        acc.setDataDiNascita(UtilityVar.getDateSqlByString("1993-12-12"));
        AccountManager instance = AccountManager.getInstance();
        instance.add(acc);
        ArrayList<Account> expResult = new ArrayList<Account>();
        expResult.add(acc);
        ArrayList<Account> result = instance.getAccoutnByFiltri(domicilio);
        Iterator<Account> iter=expResult.iterator();
        for(Account t:result)
            if(iter.hasNext())
            assertEquals(t, iter.next());
        // TODO review the generated test code and remove the default call to fail.
        instance.deleteAccount(acc);
    }

    /**
     * Test of modificaAccount method, of class AccountManager.
     */
    @Test
    public void testModificaAccount() throws Exception {
        System.out.println("modificaAccount");
       
        Account acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail(email);
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComuneDiResidenza("salerno");
        acc.setCognome("donadio");
        acc.setDataDiNascita(UtilityVar.getDateSqlByString("1993-12-12"));
        AccountManager instance =  AccountManager.getInstance();
        instance.add(acc);
        acc.setNome("ciao");
        instance.modificaAccount(acc);
        Account ac=instance.getAccountByEmail(email);
        System.out.println(ac.getEmail()+" "+acc.getEmail());
        assertEquals(acc,ac);
        instance.deleteAccount(acc);
        
        
        
        // TODO review the generated test code and remove the default call to fail.
      
    }

    /**
     * Test of deleteAccount method, of class AccountManager.
     */
    @Test
       public void testDeleteAccount() throws Exception {
        System.out.println("deleteAccount");
    
        Account acc=new Account();
        acc.setNome("raffaele");
        acc.setEmail(email);
        acc.setPassword("1111");
        acc.setDomicilio("mercato san severino");
        acc.setRuolo("venditore");
        acc.setComuneDiResidenza("salerno");
        acc.setCognome("donadio");
        acc.setDataDiNascita(UtilityVar.getDateSqlByString("1993-12-12"));
        AccountManager instance =  AccountManager.getInstance();
        instance.deleteAccount(acc);
        Account ac=instance.getAccountByEmail(email);
        assertEquals(null,ac);
        // TODO review the generated test code and remove the default call to fail.
       
    }
    
}
