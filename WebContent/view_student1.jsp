
    <%@page import="java.util.*" %>
    <%@page import="sis.com.bo.*" %>
    <%@ include file="adminHeader.jsp" %>
<style type="text/css">

 .alert{
 height:50px;
 }
 </style>

<body>
  	
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">REGISTERED STUDENTS</h1>
	</header><hr>
  <div class="panel-body" id="accordion">
    <div class="well">
 <br>
<%  
 if( session.getAttribute("number")!=null){ 
 int number = Integer.parseInt(""+session.getAttribute("number"));
   %>
	<div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
   <h5>Please fill the required field</h5></div>
 <%} session.removeAttribute("number");%>
<form action="ShowRegisteredStudentController" method="post">
<button class="button btn btn-default" type="submit" style="float:right">Show All</button></form>

<form action="view_tabulation.jsp" method="post">
<button class="button btn btn-info" type="submit">Tabulation</button></form>

<div style="background-color:#d8cbcb21 ">
   
  <form action="sortStuController" method="post">
  <table>
  <tr> <td><br> <b>Sort By</b>
         <select name="sortby" class="form-control" required>
         <option disabled selected="selected">Select</option>
         <option value="pointer">Pointer</option>
         <option value="category" >Category</option>
          </select> </td>
               
           <td><br><b>
             Semester:</b><select name="sem" class="form-control" required>
            <option disabled selected="selected">Select</option>
          <option value="1">1</option>
          <option value="2">2</option>
         <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
         <option value="6">6</option>
           <option value="7">7</option>
          <option value="8">8</option></select>
          </td>
           <td><br><b>
           Course :</b><select  name="course" class="form-control" required>
           <option disabled selected="selected">Select</option>
           <option value="M-Tech">M-Tech</option>
         <option value="B-Arch">B-Arch</option>
         <option value="B-Tech">B-Tech</option>
          <option value="MCA">MCA</option></select>
            </td>
   
   <td><br><b>Branch : </b><select name="branch"  class="form-control" required>
  <option disabled selected="selected">Select</option>
  <option value="Geology">Applied Geology</option>
  <option value="Architecture">Architecture</option>
  <option value="Bio Medical">Bio Medical Engineering</option>
  
  <option value="Chemical">Chemical Engineering</option>
  <option value="Civil">Civil Engineering</option>
  <option value="Computer Science">Computer Science & Engineering</option>
  <option value="Electrical">Electrical Engineering</option>
  <option value="Electronics And Telecommunication">Electronics And Telecommunication Engineering</option>
  <option value="Information Technology">Information Technology</option>
  <option value="MCA">Master in Computer Application</option>
  <option value="Mechanical">Mechanical Engineering</option>
  <option value="Mining">Mining Engineering</option>
  <option value="Metallurgical">Metallurgical Engineering</option> 
  </select> </td></tr>
  
 <td> <b>Category :</b><br>(if want to sort by category please select this field otherwise ignore)</b>
 <select name="category"  class="form-control" >
  <option disabled selected="selected">select</option>
  <option value="General">General</option>
  <option value="Obc">Obc</option>
  <option value="Sc">Sc</option>
  <option value="St">St</option>
  <option value="Pwd">Pwd</option>
  <option value="Dasa">Dasa</option>
  </select></td> <td><button class="button btn btn-success" type="submit" style="float:right">Show</button></td></tr>
 </table> </form>
  </div>
  
 <%  if(session.getAttribute("msg")!=null){ %>
	<br><div class="alert alert-danger alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
   <h5>Please fill the required field</h5>
  </div> 
 <%} session.removeAttribute("msg");%></div>

 <div class="panel-body" id="accordion">
    <div class="well">
<% if(session.getAttribute("list")!=null){
	ArrayList<RegStudent> show= (ArrayList<RegStudent>)session.getAttribute("list");%>
	<br><div class="alert alert-success alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
   <h5><%=show.size() %> Students Selected</h5>
  </div>
	<hr>
	<%if(show.size()>0){ %>
	 <div style="overflow-x:auto;">
	 <table class="table table-striped">
   <thead>
    <tr>
       <th>ID</th>
        <th>Roll no</th>
        <th>Name</th>
        <th>Course</th>
        <th>Branch</th>
        <th>Mobile no</th>
        <th>Email-id</th>
        <th>Semester</th>
        <th>Cgpa</th>
        <th>Enrollment no</th>
        <th>Category</th>
        <th>Date Of Birth</th>
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
	<td>	<%=w.getMobileno() %></td>
	<td>	<%= w.getEmail()%></td>
    <td>    <%=w.getSemester() %></td>
	<td>	<%=w.getCgpa() %></td>
    <td>	<%=w.getEnrollment() %></td>
	<td>	<%= w.getCategory()%></td>
	<td>	<%= w.getBirth()%></td>
         </tr>
         <% } } 
        	 } 
        	session.removeAttribute("list") ;
      %></tbody></table></div>
         
  
 </table>
 </div>
<div class="panel-body" id="accordion">
    <div class="well">
 
  <form action="SelectStuController" method="post">
  <table width="80%">
 <tr><td> Select no of Student : <br><input name ="number"></td>
   <%if(request.getParameter("nuError")!=null) {%>
	  <div class="alert alert-danger alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
   <h5> Please fill a proper number</h5></div>
  <% }%>
   
   <td> Select hostel : <select name="hostel" class="form-control">
  <option disabled selected="selected" >select</option>
  <option value="E">E</option>
  <option value="G">G</option>
  <option value="PG">PG</option>
  </select></td></tr></table>
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">submit</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Confirm to select</h4>
        </div>
        <div class="modal-body">
          <input type="submit">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
   </form>
  
 </div>
 </div></div></div></div></div>
 
 <script type="text/javascript">
 function myDisable(option){
	 if(option==="pointer"){
		 document.getElementById("dis1").disabled="true";
	 }
	 else{
		 document.getElementById("dis1").disabled="false"; 
	 }
 }
 </script>
<%@include file="footer.jsp" %>