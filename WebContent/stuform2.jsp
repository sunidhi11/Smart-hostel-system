
     <%@include file="commonHeader.jsp" %> 
     <%@page import="java.sql.Date"%>
     <%@page import="java.util.*"%>
     <%@page import=" sis.com.daoFactory.DaoFactory"%>
  <title>student_form</title>
<style>

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
<b>Gaurdian Details</b></p></legend>
	<% 
		Map<String,String> value_backup= new HashMap<String,String>();
	Map<String,String> error_format = new HashMap<String,String>();
		
		 String roll=request.getParameter("stu_roll"); 
		 value_backup.put("roll", roll);
		 String	name=request.getParameter("stu_name");
		 value_backup.put("name",name);
		 String course=request.getParameter("course");
		 System.out.println("get of course"+course);
		 value_backup.put("course",course);
		 System.out.println("in page 2 value of course"+value_backup.get("course"));
		 String branch =request.getParameter("branch");
		 value_backup.put("branch",branch);
		 String mobile=  request.getParameter("stu_mob");//parsing
		 value_backup.put("mobile",mobile);
		 String email=     request.getParameter("stu_email");
		 value_backup.put("email",email);
		 String sem =     request.getParameter("sem");
		 value_backup.put("sem",sem);
		 String cgpa=   request.getParameter("stu_cgpa");
		 value_backup.put("cgpa",cgpa);
		 String enroll=    request.getParameter("stu_enroll");
		 value_backup.put("enroll",enroll);
		 String hostel=request.getParameter("stu_hostel");
		 value_backup.put("hostel",hostel);
		 String category=  request.getParameter("category");
		 value_backup.put("category",category);
		 String gender=    request.getParameter("gender");
		 value_backup.put("gender",gender);
     	 String bday = request.getParameter("stu_birth");
		 value_backup.put("bday",bday);
     	String address=request.getParameter("stu_address");
		 value_backup.put("address",address);
     	String accno=request.getParameter("stu_accno");
		 value_backup.put("accno",accno);
		 request.setAttribute("value_backup",value_backup); 
		 
		 try{
			Long proll_no= Long.parseLong(roll);	
		 }catch(NumberFormatException e){
			 error_format.put("format_error_roll","must enter number not string"); 
		 }

		/*  try{
			 Long pmobile_no= Long.parseLong(mobile);
			 }catch(NumberFormatException e){
				 error_format.put("format_error_mobile","must enter number  not string"); 
			 } */
		 try{
			 Float pcgpa_no= Float.parseFloat(cgpa);
			 }catch(NumberFormatException e){
				 error_format.put("format_error_cgpa","must enter number not string"); 
				
			 }
		 try{
			 Long penroll_no= Long.parseLong(enroll);
			 }catch(NumberFormatException e){
				 error_format.put("format_error_enroll","must enter number not string"); 
			 }
		/*  try{
				Long paccno_no= Long.parseLong(accno);
		 }catch(NumberFormatException e){
				 error_format.put("format_error_accno","must enter number not string"); 
			 } */
		 try{
			 Date birth=Date.valueOf(bday);
		 }catch(IllegalArgumentException e){
			 error_format.put("format_error_bday","must enter in valid format"); 
	        }
		 
			if(!(error_format.isEmpty())){
				 request.setAttribute("error_format",error_format);
				 RequestDispatcher rd = request.getRequestDispatcher("stuform1.jsp");
					rd.forward(request,response);
			}
			
			else{
		Map<String,String> error_unique = new HashMap<String,String>();
     	RegStudentDao dao=DaoFactory.getRegStudentDao();
        List<RegStudent> s2=dao.getAllRegStudents();
        for (RegStudent regstudent2 : s2) {
 		if(Long.parseLong(roll)==regstudent2.getRollno()){
 			error_unique.put("unique_rollno","roll no must be unique");
 		}
 		if(request.getParameter("stu_email")==regstudent2.getEmail()){
 			error_unique.put("unique_email","email must be unique");

 		}
 		
 		if(Long.parseLong(request.getParameter("stu_enroll"))==regstudent2.getEnrollment()){
 			error_unique.put("unique_enroll","enrollment no no must be unique");
 			} // if
 		}   // for loop
 		
 		if(!(error_unique.isEmpty())){
 			request.setAttribute("error_unique", error_unique);
 			
 			RequestDispatcher rd = request.getRequestDispatcher("stuform1.jsp");
			rd.forward(request,response);
 		}
			}
		%>
<form action="stuform3.jsp" method="post">
<table style="width:80%">


<!-- <br><hr>
<fieldset><legend>
<p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;">
<b>Gaurdian Details</b></p></legend> -->
<table style="width:80%">
	

	<tr><td><input type="hidden" name="stu_roll"  value='<%=roll%>' ></td>
 <td><input type="hidden" name="stu_name"  value='<%=name%>'></td></tr>
 
 	<tr><td><input type="hidden" name="course"  value='<%=course%>' ></td>
 <td><input type="hidden" name="branch"  value='<%=branch%>' ></td></tr>
 
 	<tr><td><input type="hidden" name="stu_mob"  value='<%=mobile%>' ></td>
 <td><input type="hidden" name="stu_email"  value='<%=email%>' ></td></tr>
 
 	<tr><td><input type="hidden" name="sem"  value='<%=sem%>'></td>
 <td><input type="hidden" name="stu_cgpa"  value='<%=cgpa%>' ></td></tr>
 
 	<tr><td><input type="hidden" name="stu_enroll"  value='<%=enroll%>'></td>
 <td><input type="hidden" name="stu_hostel"  value='<%=hostel%>' ></td></tr>
 	
 		<tr><td><input type="hidden" name="category"  value='<%=category%>'></td>
 <td><input type="hidden" name="gender"  value='<%=gender%>'></td></tr>
 
 	 	<tr><td><input type="hidden" name="stu_birth"  value='<%=bday%>'></td>
 <td><input type="hidden" name="stu_address"  value='<%=address%>'></td></tr>
 	
 	<tr> <td><input type="hidden" name="stu_accno"  value='<%=accno%>' ></td></tr> 
 	 
 <tr> <td><br><b>Father's Name :</b> <input type="text" name="father" value="ram" required class="form-control"></td>
 <td><br><b>Mother's Name :</b> <input type="text" name="mother" value="sita" required class="form-control"></td></tr>

 <tr> <td><br><b>Father Contact: </b><input type="text" name="f_no" value="8951" required class="form-control">
 <h4 style="color: red; padding-left: 154px; ">
 
      </h4> 
 </td>

<tr><td><br><b>Address :</b> <input type="text" name ="f_address" value="jkssj" class="form-control"></td>
<td><br><b>Father Email :</b> <input type="email" name ="f_email" value="b@gmail.com" class="form-control"></td>
</tr>

 <tr> <td><br><b>Local Gaurdian name: </b><input type="text" name="l_name" value="uio" class="form-control"></td>
 <td><br><b>Local Gaurdian Contact : </b><input type="text" name="l_no" value="895999" class="form-control"></td></tr>

<tr>
 <td><a href="stuform1.jsp" class="btn btn-info" role="button">Back</a></td>
<td><br><br><input type="submit" value="next" onclick="myfunction();"></td></tr>



</table>
</form>
</fieldset>
</div>
</div>
</div>

</div>
 <%@include file="footer.jsp" %>