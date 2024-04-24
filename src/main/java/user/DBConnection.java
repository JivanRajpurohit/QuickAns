package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import java.sql.ResultSet;


import java.util.Properties;
import java.util.Random;

import javax.mail.*;    
import javax.mail.internet.*;    
public class DBConnection 
{
	
	public static void query(String q)
	{
		
		   Connection con=null;
			Statement stmt=null;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quickans","root","");
				stmt=con.createStatement();
				stmt.execute(q);
				con.close();
			}
			catch(Exception ex)
			{
			   System.out.println(ex.toString());
			}
		   
		
	}
	
	
	public static CachedRowSet selectquery(String q)
	{
		
		   Connection con=null;
			Statement stmt=null;
			ResultSet rs=null;
			CachedRowSet crs=null;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quickans","root","");
				stmt=con.createStatement();
				rs=stmt.executeQuery(q);
				
			    crs = RowSetProvider.newFactory().createCachedRowSet();
		        crs.populate(rs);
				
				con.close();
			}
			catch(Exception ex)
			{
			   System.out.println(ex.toString());
			}
			return crs;
		   
		
	}
	
	
	public static void sendmail(String to,String sub,String msg)
	{
		   Properties props = new Properties();    
		  
		   
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.port", "587");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.starttls.enable", "true");
		   props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		  
		      props.put("mail.smtp.socketFactory.port", "465");    
	          props.put("mail.smtp.socketFactory.class",    
	                    "javax.net.ssl.SSLSocketFactory");    
	          props.put("mail.smtp.port", "587");    
		   
		   
		      //get Session   
	          Session session = Session.getDefaultInstance(props,    
	           new javax.mail.Authenticator() {    
	           protected PasswordAuthentication getPasswordAuthentication() {    
	           //return new PasswordAuthentication("quickansnks@gmail.com","qfsfobizasuhtclo");  
	           return new PasswordAuthentication("quickansnks@gmail.com","qfsfobizasuhtclo");  
	           
	           }    
	          });    
	          //compose message    
	          try {    
	           MimeMessage message = new MimeMessage(session);    
	           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
	           message.setSubject(sub);    
	           message.setText(msg);    
	           //send message  
	           Transport.send(message);    
	           System.out.println("message sent successfully");    
	          } catch (MessagingException e) {throw new RuntimeException(e);}    
	             
		
	}
	
	

}