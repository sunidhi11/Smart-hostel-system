<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page import="sis.com.bo.Complain"%>
<%@page import="sis.com.dao.*"%>
<%@page import="sis.com.util.SisDbUtil"%>
<%@page import="java.util.*"%>


<body>

	
<% String stuComplain=null;
String email = null;
if(request.getAttribute("complain")!=null){
	Complain complain=(Complain)request.getAttribute("complain");
	stuComplain=complain.getComplain();
	String department=complain.getDepartment();
	
System.out.println("department"+department);

if(department.equalsIgnoreCase("Electric")){
	
email="gargtwinkle11@gmail.com";
}

if(department.equalsIgnoreCase("mess")){
	
email="seema25dewangan@gmail.com";
}
if(department.equalsIgnoreCase("Cleanliness")){
	
email="mj04031997@gmail.com";
}
}
final String username = "sunidhi10garg@gmail.com";
final String password = "sunidhigarg10";

Properties props = new Properties();
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
	message.setFrom(new InternetAddress("sunidhi10garg@gmail.com"));
	message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
	message.setSubject("Complain for your department");
	message.setText(stuComplain);
	Transport.send(message);

	String msg="Message Send Successfully.";
	session.setAttribute("msg", msg);
	response.sendRedirect("ShowComplainController");

//response.sendRedirect("view_complain.jsp");
} catch (MessagingException e) {
	//throw new RuntimeException(e);
	System.out.print(e.getMessage());
}

%>
</body>
</html>