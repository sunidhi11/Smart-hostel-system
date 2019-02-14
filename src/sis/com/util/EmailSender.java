package sis.com.util;

import java.util.Properties;


import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public final class EmailSender {
	// nitrr.hostelsystem@gmail.com
	final static String username = "nitrr.hostelsystem@gmail.com";
	final static String password = "captainsunidhi";
	static Properties  props = new Properties();
	public static boolean sendEmail(String sendTo,String msg,String subject) {
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Session email_session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				  });
		
		try {
			Message message = new MimeMessage(email_session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(sendTo));
			message.setSubject(subject);
			message.setText(msg);
			Transport.send(message);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}//send email
}
