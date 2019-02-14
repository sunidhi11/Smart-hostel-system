  
   <%@include file="commonHeader.jsp" %> 
  <title>student_form</title>
<style>

td{
 padding-left:100px;
} 

</style>


   
 <% if(session.getAttribute("result")!=null){
	%>
	 <div class="alert alert-info alert-dismissable">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <%if(((Boolean)(session.getAttribute("result"))==true)){ %>
    <strong>Success!</strong>Your Submission is sucessful.<%}else{%>
    <strong>Sorry!</strong>problem in submission...try next time.<%} %>
  </div>
	<%} session.removeAttribute("result");%>
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
<b>Personal Details</b></p></legend>

 <%
 Map<String,String> error_unique = new HashMap<String,String>();
 
 Map<String,String> value_backup = new HashMap<String,String>();
 Map<String,String> error_format = new HashMap<String,String>();
 
	if(request.getAttribute("value_backup")!=null){
		value_backup= (HashMap<String,String>)request.getAttribute("value_backup");
	}
	

 if(request.getAttribute("error_unique")!=null){
	 error_unique=(HashMap<String,String>)request.getAttribute("error_unique");
 }
 if(request.getAttribute("error_format")!=null){
	 error_format=(HashMap<String,String>)request.getAttribute("error_format");
 }
%>
 
<form action="stuform2.jsp" method="post">
<table style="width:80%">
<tr>
<td><br><b style="padding-right: 52px;">Name :</b> <input style="" type="text" name="stu_name" class="form-control"
 <%if(value_backup!=null && value_backup.containsKey("name")==true ){ %>
	      value="<%= value_backup.get("name")%>" 
	      <%} %> 
>
</td>
        
      
  
    <td><br><b>Roll no: </b><input style="" type="text" name="stu_roll" class="form-control"
    <%if(value_backup!=null && value_backup.containsKey("roll")==true ){ %>
	      value="<%= value_backup.get("roll")%>" 
	      <%} %> 
	  <%if(error_unique!=null && error_unique.get("unique_rollno")!=null){%>
     autofocus="autofocus"
      <%}%>
    >
       <%if(error_unique!=null && error_unique.get("unique_rollno")!=null){%>
      <p style="color:red;"><%=error_unique.get("unique_rollno")%></p>
      <%}%>     
      <%if(error_format!=null && error_format.get("format_error_roll")!=null){%>
      <p style="color:red;"><%=error_format.get("format_error_roll")%></p>
      <%}%>               
     </td>   
  
     </tr>
   
 <tr> <td><br><b style="padding-right: 47px;">Course :</b>
 
   <select style="padding-right: 114px;" name="course" class="form-control">
  <option value="-1"
   <%if(value_backup!=null && value_backup.containsKey("course")==true){
  	if(value_backup.get("course").equalsIgnoreCase("-1")==true){%>selected="selected"<%
	  } }%>>
  select</option>
	    
  <option value="M-Tech"   
  <%if(value_backup!=null && value_backup.containsKey("course")==true){
  	if(value_backup.get("course").equalsIgnoreCase("MTech")==true){%>selected="selected"<%
	  } }%>>
  	M-Tech
  </option>
  
  <option value="B-Arch" 
  <%if(value_backup!=null && value_backup.containsKey("course")==true){
	if(value_backup.get("course").equalsIgnoreCase("BArch")==true){%>selected="selected"<%
	  } }%>>
  B-Arch
  </option>
  
  <option value="B-Tech"
  <%if(value_backup!=null && value_backup.containsKey("course")==true){
	  	if(value_backup.get("course").equalsIgnoreCase("BTech")==true){%>selected="selected"<%
		  } }%>>
  B-Tech
  </option> 
  
  <option value="MCA"
  <%if(value_backup!=null && value_backup.containsKey("course")==true){
	if(value_backup.get("course").equalsIgnoreCase("MCA")==true){%>selected="selected"<%
	  } }%>>
  MCA
  </option>
   
   </select> 
   
   </td>
 <td><br><b>Branch : </b><select name="branch" style="" class="form-control">
  <option value="-1"
   <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("-1")==true){%>selected="selected"<%
	  } }%>
  >select</option>
  <option value="Geology"
    <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Geology")==true){%>selected="selected"<%
	  } }%>
  >Applied Geology</option>
  <option value="Architecture"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Architecture")==true){%>selected="selected"<%
	  } }%>
  >Architecture</option>
  <option value="Bio Medical"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Bio Medical")==true){%>selected="selected"<%
	  } }%>
  >Bio Medical Engineering</option>
  
  <option value="Chemical"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Chemical")==true){%>selected="selected"<%
	  } }%>
  >Chemical Engineering</option>
  <option value="Civil"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Civil")==true){%>selected="selected"<%
	  } }%>
  >Civil Engineering</option>
  <option value="Computer Science"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Computer Science")==true){%>selected="selected"<%
	  } }%>
  >Computer Science & Engineering</option>
  <option value="Electrical"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Electrical")==true){%>selected="selected"<%
	  } }%>
  >Electrical Engineering</option>
  <option value="Electronics And Telecommunication"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Electronics And Telecommunication")==true){%>selected="selected"<%
	  } }%>
  >Electronics And Telecommunication Engineering</option>
  <option value="Information Technology"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Information Technology")==true){%>selected="selected"<%
	  } }%>
  >Information Technology</option>
  <option value="MCA"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("MCA")==true){%>selected="selected"<%
	  } }%>
  >Master in Computer Application</option>
  <option value="Mechanical"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Mechanical")==true){%>selected="selected"<%
	  } }%>
  >Mechanical Engineering</option>
  <option value="Mining "
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Mining")==true){%>selected="selected"<%
	  } }%>
  >Mining Engineering</option>
  <option value="Metallurgical"
      <%if(value_backup!=null && value_backup.containsKey("branch")==true){
  	if(value_backup.get("branch").equalsIgnoreCase("Metallurgical")==true){%>selected="selected"<%
	  } }%>
  >Metallurgical Engineering</option> 
  </select> </td> </tr>
  
 <tr> <td><br><b style="padding-right: 29px;">Mobile no:</b> <input type="number" name="stu_mob" maxlength="10" class="form-control"
  <%if(value_backup!=null && value_backup.containsKey("mobile")==true ){ %>
	      value="<%= value_backup.get("mobile")%>" 
	      <%} %> 
 maxlength="10">
  <%if(error_format!=null && error_format.get("format_error_mobile")!=null){%>
      <p style="color:red;"><%=error_format.get("format_error_mobile")%></p>
      <%}%>  
 </td>
 <td><br><b style="padding-right: 20px;">email:</b> <input type="email" name="stu_email"  class="form-control"
  <%if(value_backup!=null && value_backup.containsKey("email")==true ){ %>
	      value="<%= value_backup.get("email")%>"
	      <%} %> 
	  <%if(error_unique!=null && error_unique.get("unique_email")!=null){%>
     autofocus="autofocus"
      <%}%>
 >
<%if(error_unique!=null && error_unique.get("unique_email")!=null){%>
      <p style="color:red;"><%=error_unique.get("unique_email")%></p>
      <%}%>
 </td></tr>

 <tr> <td><br><b style="padding-right: 36px;">Semester:</b><select name="sem" style="padding-right: 120px; " class="form-control">
  <option value="-1"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("-1")==true){%>selected="selected"<%
	  } }%>
  >select</option>
  <option value="1"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("1")==true){%>selected="selected"<%
	  } }%>
  >1</option>
  <option value="2"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("2")==true){%>selected="selected"<%
	  } }%>
  >2</option>
  <option value="3"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("3")==true){%>selected="selected"<%
	  } }%>
  >3</option>
  <option value="4"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("4")==true){%>selected="selected"<%
	  } }%>
  >4</option>
  <option value="5"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("5")==true){%>selected="selected"<%
	  } }%>
  >5</option>
  <option value="6"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("6")==true){%>selected="selected"<%
	  } }%>
  >6</option>
  <option value="7"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("7")==true){%>selected="selected"<%
	  } }%>
  >7</option>
  <option value="8"
      <%if(value_backup!=null && value_backup.containsKey("sem")==true){
  	if(value_backup.get("sem").equalsIgnoreCase("8")==true){%>selected="selected"<%
	  } }%>
  >8</option>
</td>
 <td><br><b style="padding-right: 20px;">Cgpa:</b> <input type="text" name="stu_cgpa"  class="form-control"
  <%if(value_backup!=null && value_backup.containsKey("cgpa")==true ){ %>
	      value="<%= value_backup.get("cgpa")%>" 
	      <%} %> 
 >
  <%if(error_format!=null && error_format.get("format_error_cgpa")!=null){%>
      <p style="color:red;"><%=error_format.get("format_error_cgpa")%></p>
      <%}%>  
 </td>
 </tr>

 <tr> <td><br><b>enrollment no:</b> <input type="text" name="stu_enroll" class="form-control"
  <%if(value_backup!=null && value_backup.containsKey("enroll")==true ){ %>
	      value="<%= value_backup.get("enroll")%>"
	      <%} %> 
	 <%if(error_unique!=null && error_unique.get("unique_enroll")!=null){%>	
	 autofocus="autofocus"
	  <%}%>      
 >
 <%if(error_unique!=null && error_unique.get("unique_enroll")!=null){%>
      <p style="color:red;"><%=error_unique.get("unique_enroll")%></p>
      <%}%>
       <%if(error_format!=null && error_format.get("format_error_enroll")!=null){%>
      <p style="color:red;"><%=error_format.get("format_error_enroll")%></p>
      <%}%>  
      </td>
 <td><br><b style="padding-right: 14px;">Hostel :</b><select style="padding-right: 56px;" name="stu_hostel" class="form-control">
  <option value="-1">select</option>
  <option value="boys"
      <%if(value_backup!=null && value_backup.containsKey("hostel")==true){
  	if(value_backup.get("hostel").equalsIgnoreCase("boys")==true){%>selected="selected"<%
	  } }%>
  >boys(A,B,C,D,F)</option>
  <option value="girls"
      <%if(value_backup!=null && value_backup.containsKey("hostel")==true){
  	if(value_backup.get("hostel").equalsIgnoreCase("girls")==true){%>selected="selected"<%
	  } }%>
  >girls(E,G,PG)</option>
  </select>
   </td></tr>

 <tr> <td><br><b style="padding-right: 32px;">Category :</b><select name="category" style="padding-right: 115px;" class="form-control">
  <option value="-1"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("-1")==true){%>selected="selected"<%
	  } }%>
  >select</option>
  <option value="General"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("General")==true){%>selected="selected"<%
	  } }%>
  >General</option>
  <option value="Obc"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("Obc")==true){%>selected="selected"<%
	  } }%>
  >Obc</option>
  <option value="Sc"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("Sc")==true){%>selected="selected"<%
	  } }%>
  >Sc</option>
  <option value="St"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("St")==true){%>selected="selected"<%
	  } }%>
  >St</option>
  <option value="Pwd"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("Pwd")==true){%>selected="selected"<%
	  } }%>
  >Pwd</option>
  <option value="Dasa"
      <%if(value_backup!=null && value_backup.containsKey("category")==true){
  	if(value_backup.get("category").equalsIgnoreCase("Dasa")==true){%>selected="selected"<%
	  } }%>
  >Dasa</option>
  </select>
   </td> 
 <td><br><b>Gender:</b> 
 <input type="radio" name="gender" value="male"
     <%if(value_backup!=null && value_backup.containsKey("gender")==true){
  	if(value_backup.get("gender").equalsIgnoreCase("male")==true){%>checked<%
	  } }%>
 > Male<br>
  <input type="radio" name="gender" value="female"
      <%if(value_backup!=null && value_backup.containsKey("gender")==true){
  	if(value_backup.get("gender").equalsIgnoreCase("female")==true){%>checked<%
	  } }%>
  > Female<br>
  <input type="radio" name="gender" value="other"
      <%if(value_backup!=null && value_backup.containsKey("gender")==true){
  	if(value_backup.get("gender").equalsIgnoreCase("other")==true){%>checked<%
	  } }%>
  > Other</td></tr>

 <tr><td><br><b>Date of Birth :</b><input type="date" name="stu_birth"  class="form-control"
  <%if(value_backup!=null && value_backup.containsKey("roll")==true ){ %>
	      value="<%= value_backup.get("bday")%>" 
	      <%} %> 
 >
  <%if(error_format!=null && error_format.get("format_error_bday")!=null){%>
      <p style="color:red;"><%=error_format.get("format_error_bday")%></p>
      <%}%>  
 </td>
<td><br><b>Address :</b> <input type="text" name ="stu_address"  class="form-control"
 <%if(value_backup!=null && value_backup.containsKey("address")==true ){ %>
	      value="<%= value_backup.get("address")%>" 
	      <%} %> 
></td></tr>

 <tr><td><br><b>Account No :</b><input type="number" name="stu_accno" class="form-control"
  <%if(value_backup!=null && value_backup.containsKey("accno")==true ){ %>
	      value="<%= value_backup.get("accno")%>" 
	      <%} %> 
 >
  <%if(error_format!=null && error_format.get("format_error_accno")!=null){%>
      <p style="color:red;"><%=error_format.get("format_error_accno")%></p>
      <%}%>  
 </td>
</tr>
<tr><td><br><br><input type="reset" value="reset"></td>
<td><br><br><input type="submit" value="next" onclick="myfunction();"></td></tr>
</table>


</form>


</fieldset>


</div>
</div>
</div>
</div>


 <jsp:include page="footer.jsp" />	 
