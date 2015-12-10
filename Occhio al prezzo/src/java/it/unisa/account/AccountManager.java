package it.unisa.Account;

import it.unisa.exception.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    /*può essere considerata come registrazione?*/
    public void add(Account account) throws SQLException {
        Connection connect = DBConnection.getConnection();

        String sql = "INSERT INTO Account (email,password,nome,cognome,data di nascita,"
                + "domicilio,comune di residenza,ruolo) VALUES ('" + account.getEmail()
                + "','" + account.getPassword() + "','" + account.getNome()
                + "'," + account.getCognome()+ "','" + account.getData_di_nascita()
                +"'," + account.getDomicilio()+ "','" + account.getComune_di_residenza()
                +"',"+account.getRuolo()+")";

        try {
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(sql);
            connect.commit();
        } finally {
            DBConnection.releaseConnection(connect);
        }
    } 
    
    public Account getAccountByEmail(String email) throws SQLException, ConnectionException {
        Statement stmt = null;
        ResultSet rs = null;
        Connection connection = null;
        Account account = null;

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
                account.setData_di_nascita(rs.getDate("data di nascita"));
                account.setDomicilio(rs.getString("domicilio"));
                account.setComune_di_residenza(rs.getString("comune di residenza"));
                account.setRuolo(rs.getString("ruolo"));
                
            }
        } finally {

         DBConnection.releaseConnection(connection);
        }

        return account;
    }
    
    /*NOTA IMPORTANTISSIMA: qui si dovrebbe passare la regione o provincia, pero dopo
    si dovrebbe far un controllo incrociato per vede se qll domicilio preso è prp della regione o
    provincia passaata perchè così è stato specificato nel rad*/
     public Account getAccoutnByFiltri(String domicilio) throws SQLException, ConnectionException {
        Statement stmt = null;
        ResultSet rs = null;
        Connection connection = null;
        Account account = null;
        ArrayList<Account> accounts=new ArrayList<Account>();
        String query = "select * from Account where domicilio = '" + domicilio + "'";

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
                account.setData_di_nascita(rs.getDate("data di nascita"));
                account.setDomicilio(rs.getString("domicilio"));
                account.setComune_di_residenza(rs.getString("comune di residenza"));
                account.setRuolo(rs.getString("ruolo"));
                accounts.add(account);
                
            }
        } finally {

         DBConnection.releaseConnection(connection);
        }

        return account;
    }
     
     public void modificaAccount(Account account) throws SQLException, ConnectionException {
        Connection connect = DBConnection.getConnection();
      
        
        /*Assumiamo che:
        L'email non si deve modificare*/
        
        String sql = "UPDATE Account "
                
                + "', password = '"
                + account.getPassword()
                + "', nome = '"
                + account.getNome()
                + "', cognome = '"
                + account.getCognome()
                + "', data di nascita = '"
                + account.getData_di_nascita()
                + "', domicilio = '"
                + account.getDomicilio()
                + "', comune di residenza = '"
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
    }
     
    public void deleteAccount(Account account) throws SQLException, ConnectionException {
        Connection connect = DBConnection.getConnection();
      
        
        
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
    }
}
