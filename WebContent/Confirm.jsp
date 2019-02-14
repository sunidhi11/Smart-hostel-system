
     <%@include file="header.jsp" %>
      <title>Confirmation page</title>
      
<% if(request.getAttribute("multipleupdate")!=null){
   			  %>  	
<div class="alert alert-warning alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Warning!</strong>You have already confirmed ur seat.....
  </div><%}session.removeAttribute("multipleupdate");%>
  
<% if(session.getAttribute("hostelid")!=null){
   			 String message=(String)session.getAttribute("hostelid"); %>  			
<div class="alert alert-info">
  <strong>Info!</strong> <%=message%>.
</div><%}session.removeAttribute("hostelid"); %>

 <% if(session.getAttribute("select_student")!=null){
   			 SelectedStudent found_student=(SelectedStudent)session.getAttribute("select_student"); 
   			 if(found_student.isFound()==false){%>
  <div class="alert alert-warning alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>Warning!</strong>Wrong DuNo...correct that.......
  </div><%}}session.removeAttribute("select_student");%>
  
   <div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENT FORM</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">
 
 <table class="table table-bordered table table-hover table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Enrollment No</th>
        <th>Hostel</th>
        <th>Pay Your Fees</th>
        <th>Confirm Your Seat</th>
        <th>Confimation Status</th>
        <th>Book Your Room</th>
      </tr>
    </thead>
 <%
AllotStudentDao dao=DaoFactory.getAllotedStudentDao();
List<RegStudent> selected_Student= dao.getAllSelectedStudents();
%> 
      <tbody>
     <%for(RegStudent s_student:selected_Student){%> 
          <tr>
        <td><%=s_student.getName()%></td>
         <td><%=s_student.getEnrollment()%></td>
        <td><%=s_student.getHostel()%></td>
        <td><a href="https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=301885" style="color:blue;">Click For Payment</a></td>
        <td>
        <form action="DuCheckController" method="post">
         <input type="hidden" name="h_enroll" value="<%=s_student.getEnrollment()%>"> <br>
          DUNO:<input type="text" name="duno"
         <% boolean confirm=dao.getConfirmStatus(s_student.getEnrollment());
         if(confirm==true){
         %>disabled<%}%>
         <% if(request.getAttribute("select_student")!=null){
   			 SelectedStudent found_student=(SelectedStudent)request.getAttribute("select_student"); 
   			 if(found_student.isFound()==true){
   			 if(s_student.getEnrollment()==found_student.getEnrollment_no()){%>
   			 disabled<%}}}%>
        >
       
        <input type ="submit" value="Go">
   		 </form></td>
   		 <td><input type="checkbox" value="" disabled 
   		<% if(confirm==true){%>checked<%}%>
   		 <% if(request.getAttribute("select_student")!=null){
   			 SelectedStudent found_student=(SelectedStudent)request.getAttribute("select_student"); 
   			 if(found_student.isFound()==true){
   			 if(s_student.getEnrollment()==found_student.getEnrollment_no()){%>
   			checked<%
   			 }}}%>
   		>Confirmation</td>
     
        <td><button type="button" value="roomAllot"
        <% if(confirm==false){%>disabled<%}%>
   		 <% if(request.getAttribute("select_student")!=null){
   			 SelectedStudent found_student=(SelectedStudent)request.getAttribute("select_student"); 
   			 if(found_student.isFound()==false){
   			 if(s_student.getEnrollment()==found_student.getEnrollment_no()){%>
   			disabled<%}}}%>
        >Book Your Room</button></td>

      </tr>
          </tbody>
     <% }%> 
             

  </table>

</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp" />	 
