package hostAlarm;


import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import java.sql.*;

public class SendMail
{
	
	public static String getEmail(String userName) throws SQLException, ClassNotFoundException
	{
		String driverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/test";
	    String user = "";
	    String dbpsw = "";
	    Connection con= null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    
	    String sql1 = "select * from users where userName=?";
	    String email = "";
	    
	    Class.forName(driverName);
	    con = DriverManager.getConnection(url, user, dbpsw);
	    ps = con.prepareStatement(sql1);
	    ps.setString(1, userName);
	    rs = ps.executeQuery();
	    while(rs.next())
	    {
	        email = rs.getString("email");
	    }
	     
	    return email;
	}
	
	
	
public static void sendMail(String msg, String vm, String userName) throws ClassNotFoundException, SQLException
{    
	
   
	
   String from = "chanikya.mandapathi@sjsu.edu";
   //String to = "chanu.reds@gmail.com";
   
   String to = SendMail.getEmail(userName);
  
   Properties properties = new Properties();
   properties.put("mail.smtp.auth", "true");
   properties.put("mail.smtp.starttls.enable", "true");
   properties.put("mail.smtp.host", "smtp.gmail.com");
   properties.put("mail.smtp.port", "587");

   // Get the default Session object.
   //Session session = Session.getDefaultInstance(properties);
   
   
   Session session = Session.getInstance(properties,
	          new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("chanikya.mandapathi@sjsu.edu", "Chanu120");
	            }
	          });


   try{
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(session);

      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));

      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));

      // Set Subject: header field
      message.setSubject("Warning! An Alarm has been generated on your vHost");

      // Now set the actual message
      message.setText(vm + "  " + msg);

      // Send message
      Transport.send(message);
      System.out.println("Sent message successfully to the email address...." + to);
   }catch (MessagingException mex) {
      mex.printStackTrace();
   }
}

}