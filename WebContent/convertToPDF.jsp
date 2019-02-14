<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.*" %>
    <%@page import="sis.com.bo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.showH{
       text-align: center;
       font-weight: bold;
       font-family: Century;
  }
  
</style>
<body>
<div class="container"><br>
<span style="float:right">
<button class="button btn btn-success" onclick="convertToPDF()">
<span class="glyphicon glyphicon-save"></span> Save</button>
 </span>
 <hr>
<% if(session.getAttribute("stuList")!=null){
	ArrayList<RegStudent> show= (ArrayList<RegStudent>)session.getAttribute("stuList");%>
	<%if(show.size()>0){ %>
	<div class="well well-sm">
	<h3 class="showH"> Hostel-<%=session.getAttribute("hostel") %></h3></div>
 <br><div  style="overflow-x:auto;">
	 <table class="table table-striped">
   <thead>
    <tr>
       <th>ID</th>
        <th>Roll no</th>
        <th>Name</th>
        <th>Course</th>
        <th>Branch</th>
        <th>Semester</th>
        <th>Cgpa</th>
        <th>Hostel</th>
        <th>Mobile no</th>
        <th>Category</th>
        <th>Date Of Birth</th>
        <th>Email-id</th>
                </tr>
    </thead>
<tbody>
	<% 
	int count=0;
	for(RegStudent w:show){%>
	<tr>
	<td>	<%=++count%></td>
	     <td><%=w.getRollno() %></td>
		<td><%=w.getName() %></td>
	<td>	<%= w.getCourse()%></td>
	<td>	<%= w.getBranch()%></td>
    <td>    <%=w.getSemester() %></td>
	<td>	<%=w.getCgpa() %></td>
	<td>	<%=w.getHostel() %></td>
	<td>	<%=w.getMobileno() %></td>
	<td>	<%= w.getCategory()%></td>
	<td>	<%= w.getBirth()%></td>
	<td>	<%= w.getEmail()%></td>
         </tr>
         <% }  
	} }  
	session.removeAttribute("hostel");
	session.removeAttribute("stuList");
	%></tbody></table></div>
         
  

 </div>
  
  <script type="text/javascript">

  function convertToPDF() {
      window.print();
  }

  </script>
</body>
</html>