 <%@include file="header.jsp" %> 
  <title>Preview</title>

<style>
  table, th, td {
    border-collapse: collapse;3 
}
 th,td {
    padding: 10px;
    text-align: left;
} 

td{
 padding-left:100px;
} 

</style>
 <div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENT FORM</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">
<fieldset><legend>
<p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;">
<b>Confirm Your Details</b></p></legend>

<% 
if((RegStudent)session.getAttribute("regstuinfo")!=null){
		RegStudent regstudent=(RegStudent)session.getAttribute("regstuinfo");
		System.out.println("in preview"+regstudent.getRollno());
	%>
	<table style="width:100%">
  <tr>
    <td>Name</td>
    <td><%=regstudent.getName()%></td>
  </tr>
  <tr>
    <td>ROll No</td>
    <td><%=regstudent.getRollno()%></td>
  </tr>
  <tr>
    <td>course</td>
    <td><%=regstudent.getCourse()%></td>
  </tr>
  <tr>
    <td>branch</td>
    <td><%=regstudent.getBranch()%></td>
  </tr>
  <tr>
    <td>Mobile No</td>
    <td><%=regstudent.getMobileno()%></td>
  </tr> 
  <tr>
    <td>email</td>
    <td><%=regstudent.getEmail()%></td>
  </tr>
  <tr>
    <td>semester</td>
    <td><%=regstudent.getSemester()%></td>
  </tr>
  <tr>
    <td>cgpa</td>
    <td><%=regstudent.getCgpa()%></td>
  </tr>
  <tr>
    <td>Enrollment No</td>
    <td><%=regstudent.getEnrollment()%></td>
  </tr>
  <tr>
    <td>Hostel</td>
    <td><%=regstudent.getHostel()%></td>
  </tr>
  <tr>
    <td>Gender</td>
    <td><%=regstudent.getGender()%></td>
  </tr>
  <tr>
    <td>Category</td>
    <td><%=regstudent.getCategory()%></td>
  </tr>
   <tr>
    <td>Date of Birth</td>
    <td><%=regstudent.getBirth()%></td>
  </tr>
     <tr>
    <td>Address</td>
    <td><%=regstudent.getAddress()%></td>
  </tr>
     <tr>
    <td>Account No</td>
    <td><%=regstudent.getAccno()%></td>
  </tr>
     <tr>
    <td>Father Name</td>
    <td><%=regstudent.getFname()%></td>
  </tr>
     <tr>
    <td>Mother Name</td>
    <td><%=regstudent.getMname()%></td>
  </tr>
     <tr>
    <td>Father Mobile</td>
    <td><%=regstudent.getFmobile()%></td>
  </tr>
     <tr>
    <td>Father Address</td>
    <td><%=regstudent.getFaddress()%></td>
  </tr>
     <tr>
    <td>Father Email</td>
    <td><%=regstudent.getFemail()%></td>
  </tr>
     <tr>
    <td>Local Gaurdian Name</td>
    <td><%=regstudent.getLname()%></td>
  </tr>
     <tr>
    <td>Local Gaurdian Mobile</td>
    <td><%=regstudent.getLmobile()%></td>
  </tr>
 <%--  <tr>
    <td><img src='ImagePreviewController?id=<%=regstudent.getEnrollment()%>' width='100' height='100' /> </td>
   
 <!--   <td><img src='userimage' width='100' height='100'></td>-->
  </tr>   --%>

   <tr>
    <td><a href="stuform3.jsp" class="btn btn-info" role="button">Back</a></td>
   <td><form action="PreviewController" method="post">
    <input type="submit" value="Continue">
    </form></td>
  </tr>
   <%}%>
</table>
</fieldset>
</div>
</div>
  </div>
  </div>
   <%@include file="footer.jsp" %>