package it.unisa.account;

import it.unisa.exception.*;
import java.sql.Connection;
import it.unisa.exception.ValueNullException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import it.unisa.utility.DBConnection;
import it.unisa.utility.UtilityVar;
import java.util.ArrayList;

/**
 *
 * @author raffaeledonadio
 */
public class AccountManager {

    private static AccountManager instance;

    public static AccountManager getInstance() {

        if (instance == null) {
            instance = new AccountManager();
        }
        return instance;

    }

    /*può essere considerata come registrazione? SI alla fine nn c 'è nemmeno di controllare il ruolo o strategie
    perchè nella tabella account il valore di default è utente per l'account, poi dovrà essere l'admin a metterlo
    venditore QUINDI VA BENE COSI*/
    public void add(Account account) throws SQLException,ValueNullException{
        Connection connect = DBConnection.getConnection();
        
        if(!UtilityVar.isNull(account.getEmail()) && !UtilityVar.isNull(account.getPassword()) && !UtilityVar.isNull(account.getRuolo()))
        {
        
            String sql = "INSERT INTO Account (email,password,nome,cognome,data_di_nascita,"
                    + "domicilio,comune_di_residenza,ruolo) VALUES ('" + account.getEmail()
                    + "','" + account.getPassword() + "','" + account.getNome()
                    + "','" + account.getCognome()+ "','" + "1993-12-12"
                    +"','" + account.getDomicilio()+ "','" + account.getComune_di_residenza()
                    +"','"+account.getRuolo()+"')";

            try {
                Statement stmt = connect.createStatement();
                stmt.executeUpdate(sql);
                connect.commit();
            } finally {
                DBConnection.releaseConnection(connect);
            }
        }
        else throw new ValueNullException();
     } 
    
    public Account getAccountByEmail(String email) throws SQLException, ConnectionException, ValueNullException {
        Statement stmt = null;
        ResultSet rs = null;
        Connection connection = null;
        Account account = null;
        if(!UtilityVar.isNull(email))
        {
                
            String query = "select * from Account where email = '" + email + "'";

            try {
                connection = DBConnection.getConnection();

                if (connection == null) {
                    throw new ConnectionException();
                }

                stmt = connection.createStatement();
                rs = stmt.executeQuery(query);

                if (rs.next()) {
                    account = new Account();
                    account.setEmail(rs.getString("email"));
                    account.setPassword(rs.getString("password"));
                    account.setNome(rs.getString("nome"));
                    account.setCognome(rs.getString("cognome"));
                    account.setData_di_nascita(rs.getDate("data_di_nascita").toString());
                    account.setDomicilio(rs.getString("domicilio"));
                    account.setComune_di_residenza(rs.getString("comune_di_residenza"));
                    account.setRuolo(rs.getString("ruolo"));
                
                    }
                } 
                finally {

                DBConnection.releaseConnection(connection);
                }

            return account;
        }
        else throw new ValueNullException();
 }     
    
    /*NOTA IMPORTANTISSIMA: qui si dovrebbe passare la regione o provincia, pero dopo
    si dovrebbe far un controllo incrociato per vede se qll domicilio preso è prp della regione o
    provincia passaata perchè così è stato specificato nel rad*/
     public ArrayList<Account> getAccoutnByFiltri(String domicilio) throws SQLException, ConnectionException, Exception {
        Statement stmt = null;
        ResultSet rs = null;
        Connection connection = null;
        Account account = null;
        ArrayList<Account> accounts=new ArrayList<Account>();
        String query = "select * from Account where domicilio = '" + domicilio + "'";
        
        if(!UtilityVar.isNull(domicilio))
        {
        try {
            connection = DBConnection.getConnection();

            if (connection == null) {
                throw new ConnectionException();
            }

            stmt = connection.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                account = new Account();
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setNome(rs.getString("nome"));
                account.setCognome(rs.getString("cognome"));
                account.setData_di_nascita(rs.getDate("data di nascita").toString());
                account.setDomicilio(rs.getString("domicilio"));
                account.setComune_di_residenza(rs.getString("comune_di_residenza"));
                account.setRuolo(rs.getString("ruolo"));
                accounts.add(account);
                
            }
        } finally {

         DBConnection.releaseConnection(connection);
        }

        return accounts;
        }
        else throw new ValueNullException();
  }
     
     public void modificaAccount(Account account) throws SQLException, ConnectionException, ValueNullException {
        Connection connect = DBConnection.getConnection();
      
         if(!UtilityVar.isNull(account))
        {
        /*Assumiamo che:
        L'email non venga modificata*/
        
        String sql = "UPDATE Account "
                
                + "', password = '"
                + account.getPassword()
                + "', nome = '"
                + account.getNome()
                + "', cognome = '"
                + account.getCognome()
                + "', data_di_nascita = '"
                + account.getData_di_nascita()
                + "', domicilio = '"
                + account.getDomicilio()
                + "', comune_di_residenza = '"
                + account.getComune_di_residenza()
                + "', ruolo = '"
                + account.getRuolo()
                + "'";
        


        sql += " WHERE email = '"
                + account.getEmail()
                + "'";

        try {
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(sql);
            connect.commit();
        } finally {
            DBConnection.releaseConnection(connect);
        }
        }else throw new ValueNullException();
}
     
    public void deleteAccount(Account account) throws SQLException, ConnectionException, ValueNullException {
        Connection connect = DBConnection.getConnection();
      
        if(!UtilityVar.isNull(account))
        {
        
        String sql = "DELETE FROM Account WHERE email = '"
                + account.getEmail()
                + "'";

        try {
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(sql);
            connect.commit();
        } finally {
            DBConnection.releaseConnection(connect);
        }
         }else throw new ValueNullException();
    }
          

   
}
