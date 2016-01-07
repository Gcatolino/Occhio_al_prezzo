package it.unisa.email;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class Email {
    public static void inviaEmail(String host, String porta,
            final String userName, final String password, String indirizzo,
            String nome, String testo) throws AddressException,
            MessagingException {
 
        Properties proprieta = new Properties();
        proprieta.put("mail.smtp.host", host);
        proprieta.put("mail.smtp.port", porta);
        proprieta.put("mail.smtp.auth", "true");
        proprieta.put("mail.smtp.starttls.enable", "true");
 
        Authenticator autentica = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(proprieta, autentica);
 
        Message messaggio = new MimeMessage(session);
 
        messaggio.setFrom(new InternetAddress(userName));
        InternetAddress[] indirizzi = { new InternetAddress(indirizzo) };
        messaggio.setRecipients(Message.RecipientType.TO, indirizzi);
        messaggio.setSentDate(new Date());
        messaggio.setText(testo);
 
        Transport.send(messaggio);
 
    }
}