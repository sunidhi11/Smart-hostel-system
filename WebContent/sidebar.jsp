<%-- %@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Abel|Anton|Exo+2|Josefin+Sans|Noto+Sans|Open+Sans|PT+Sans" rel="stylesheet"> 
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 

<!-- <title>Insert title here</title> --> 
<script type="text/javascript">
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}

</script>
<style>
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="StudentLeaveApplication.jsp">Leave Application</a>
  <!-- <form action="allotmentController" method="post">
    <a href="#">Allotment list</form> -->
    
   <a href="Confirm.jsp">Seat Confirm</a>
 <a href="complain.jsp">Complain</a>
 
 
 <form action="Admin_Mess_Menu_Controller" method="get">
      <input type="hidden" name="user" value="1">
    <input type="hidden" name="admin" value="0"> 
    <button class="btn btn-link" type="submit" value="" style="color:grey;text-decoration:none;padding-left: 30px;" ><h3>Mess Menu</h3></button>
   </form>
	<a href="feedback.jsp">FEEDBACK</a>
 
  <a href="workerDetail.jsp">Worker Details</a>
  
  <% studentLoginCheck=false; 
  if(session.getAttribute("studentLoginCheck")!=null){
 studentLoginCheck=(Boolean)session.getAttribute("studentLoginCheck");
  if(studentLoginCheck==true){%>
  <form action="ViewStudentController" method="get">
    <input type="hidden" name="id" value="<%=session.getAttribute("hostelId")%>">
    <input type="hidden" name="flag_admin" value="0">
     <input type="hidden" name="flag_student" value="1">
    <button class="btn btn-link" type="submit" value="Student"  style="color:grey;text-decoration:none;padding-left: 30px;"><h4>My Profile</h4></button>
   </form>
  <%}} %>
</div>

<div id="main">
  
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>
</div>


