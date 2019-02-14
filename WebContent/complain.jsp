 <%@page import="sis.com.bo.*" %>
 <%@include file="header.jsp" %>
 <%
studentLoginCheck=false;
if(session.getAttribute("studentLoginCheck")!=null){
 studentLoginCheck=(Boolean)session.getAttribute("studentLoginCheck");}
if(studentLoginCheck==false){
	response.sendRedirect("studentLogin.jsp");
}
%>
<style>
td{
 padding-left:100px;
}

</style>
<body>

<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">Complain Form</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well"> 
    
 <% if((Complain)session.getAttribute("confirm")!=null){
	%>
	<div class="alert alert-success alert-dismissable fade in" style="text-align: center;background-color: #bedaea;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong></strong> <%="Record inserted successfully"%>
  </div>
	
	
	<% session.removeAttribute("confirm");}%>

<form action="complainController" method="post">
<table>
<tr><td> <b>student email: </b><input type="email" name="stu_email" value="<%=session.getAttribute("email")%>" required="required" class="form-control">   </td>
<td><b>Hostel id:</b><input type="text" name="stu_id" value="<%=session.getAttribute("hostelId")%>"required class="form-control"></td></tr>
   
 <tr> <td><br><b>Date : </b><input type="date" name ="stu_date" required class="form-control"></td>
 <td><br><b>Room no:</b><input type="text" name="stu_room" required class="form-control"></td></tr>

 <tr> <td><br><b>Department :</b><select name="department" class="form-control">
  <option value="Mess">Mess</option>
  <option value="Electric">Electric</option>
  <option value="Cleanliness">Cleanliness</option>
  </select>
   </td>
   
 <td><b><br>Complain:</b> <textarea name ="complain" required class="form-control"></textarea></td>
   
   </tr><tr>
<td></td></tr>
<tr><td><br><br><button class="button btn btn-warning" type="reset">Reset</button>

<button class="button btn btn-warning" type="submit">Submit</button></td></tr>
</table>
</form>
</div>
</div>
</div></div>

<br>
 
 

<%@include file="footer.jsp" %>
    
</body>
</html>
