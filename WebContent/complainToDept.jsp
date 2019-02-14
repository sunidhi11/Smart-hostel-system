<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="sis.com.bo.Complain" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String stuComplain=null;
 if(request.getAttribute("complain")!=null){
	Complain complain=(Complain)request.getAttribute("complain");
	stuComplain=complain.getComplain();
 }

%>
<form action="email_dept_complain.jsp" method="post">
<input type="hidden" name="stuComplain" value='<%=stuComplain%>'>
Choose your Department : <Select name="email">
 <option value="seema25dewangan@gmail.com">Mess</option>
  <option value="gargtwinkle11@gmail.com">Electric</option>
  <option value="mj04031997@gmail.com">Cleanliness</option>
   <input type="submit" value="send">
  
</form>


</body>
</html>