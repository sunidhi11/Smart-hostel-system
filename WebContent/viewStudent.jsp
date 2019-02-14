   <%@include file="adminHeader.jsp" %>
    
  <title>student profile in admin</title>


<style type="text/css">
 * {
    box-sizing: border-box;
}
.nav-pills>li>a {
    border-radius: 0px;
  
}
/* .gallery {
    margin: 0;
    font-family: Arial;

} */


/* Style the images inside the grid */
.columnsg img {
    opacity: 0.8; 
    cursor: pointer; 
}

.columnsg img:hover {
    opacity: 1;
} 

/* Clear floats after the columns */
 .rowsg:after {
    content: "";
    display: table;
    clear: both;
} 

/* The expanding image container */
.containersg {
    position: relative;
    display: none;
}

/* Expanding image text */
#imgtext {
    position: absolute;
    bottom: 15px;
    left: 15px;
    color: white;
    font-size: 20px;
}

/* Closable button inside the expanded image */
.closebtn {
    position: absolute;
    top: 10px;
    right: 15px;
    color: black;
    font-size: 35px;
    cursor: pointer;
}


.inset img {

  z-index: 998;
  float:left;
  float:top;
  height:140px;
}

/* .nav  {
   
    background-color: black;
} */
 .row {
    margin-right: -15px;
    margin-left: -15px;
    padding-bottom: 1px; 
}
.tab-pane{
	padding:20px;
} 
</style>
<div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENT PROFILE</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
 <div class="well" style="border:2px">

 <!-- <div class=" container panel panel-default"> -->
<ul class="nav nav-pills" style="background-color:#18192f;">
  <li
  <% if(session.getAttribute("flag")==null) { %>
   class="active"<%}if(session.getAttribute("flag")!=null){
	  	long flag= (Long)session.getAttribute("flag");
	  	if(flag==0){
   %>
   class="active"<%}} %>
   ><a data-toggle="pill" href="#home">Personal</a></li>
  <li <%
   if(session.getAttribute("flag")!=null) {
	  	long flag= (Long)session.getAttribute("flag");
  if(flag==1){%>class="active"<%}}%>> <a data-toggle="pill" href="#menu1">Family</a></li>
  
  <li <%
   if(session.getAttribute("flag")!=null) {
	  	long flag= (Long)session.getAttribute("flag");
  if(flag==2){%>class="active"<%}}%>> <a data-toggle="pill" href="#menu2">Documents</a></li>
  
 
</ul>

<div class="tab-content">
  <div id="home" 
     <%if(session.getAttribute("flag")!=null) {
	  	long flag= (Long)session.getAttribute("flag");
   if(flag==0){%>class="tab-pane fade in active" <%}if(flag!=0){%> class="tab-pane fade"<%}}%>
    <%if(session.getAttribute("flag")==null){%>class="tab-pane fade in active"<%}%>
    >
 
<%    
if(session.getAttribute("flag")!=null) {
    	boolean result_student= (Boolean)session.getAttribute("result_student");
	  	long flag= (Long)session.getAttribute("flag");
	  	if(flag==0){
    if(result_student==true){%>
    <div class="alert alert-success alert-dismissable fade in"">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong>Updation is sucessful.
  <%}if(result_student==false){%>
  <div class="alert alert-success alert-dismissable fade in"">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong>Updation problem.<%}%>
</div>
    <%}}%>

 <div class="rowtop">
    <div class="col-sm-8">
    <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-left: 180px;">
<b>Personal Details</b></p>
     
    </div>
    
<%    
if(session.getAttribute("student")!=null){ 
Student student= (Student)session.getAttribute("student");
%>
    <div class="col-sm-4">
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float:right;margin-bottom: 11px; margin-top: 15px; margin-right: 24px; margin-top: -8px;"><span class="glyphicon glyphicon-pencil"></span>
    &nbsp; Edit</button> 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Enter The Details TO Edit</h4>
        </div>
        <div class="modal-body">
<form action="ViewUpdateSubmitController" method="post">
<table style="width:80%">
<tr>
<td><br><b style="padding-right: 52px;">Name :</b> <input style="" type="text" name="stu_name" class="form-control"
 value="<%=student.getName()%>">
</td>
 
    <td><br><b>Roll no: </b><input style="" type="text" name="stu_roll" class="form-control"
   value="<%=student.getRollno()%>">
     </td>   
     </tr>
   
 <tr> <td><br><b style="padding-right: 47px;">Course :</b>
 
   <select style="padding-right: 114px;" name="course" class="form-control">
  <option value="-1"
<% if(student.getCourse().equalsIgnoreCase("-1")==true){%>selected="selected"<%} %>
	  >
  select</option>
	    
  <option value="MTech" 
  <% if(student.getCourse().equalsIgnoreCase("MTech")==true){%>selected="selected"<%} %>  
 >
  	M-Tech
  </option>
  
  <option value="BArch" 
  <% if(student.getCourse().equalsIgnoreCase("BArch")==true){%>selected="selected"<%} %>
 >
  B-Arch
  </option>
  
  <option value="BTech"
  <% if(student.getCourse().equalsIgnoreCase("BTech")==true){%>selected="selected"<%} %>
  >
  B-Tech
  </option> 
  
  <option value="MCA"
  <% if(student.getCourse().equalsIgnoreCase("MCA")==true){%>selected="selected"<%} %>
  >
  MCA
  </option>
   
   </select> 
   
   </td>
 <td><br><b>Branch : </b><select name="branch" style="" class="form-control">
  <option value="-1"
   <% if(student.getBranch().equalsIgnoreCase("-1")==true){%>selected="selected"<%} %>
   
  >select</option>
  <option value="Geology"
   <% if(student.getBranch().equalsIgnoreCase("Geology")==true){%>selected="selected"<%} %>
  >Applied Geology</option>
  
  <option value="Architecture"
   <% if(student.getBranch().equalsIgnoreCase("Architecture")==true){%>selected="selected"<%} %>
  >Architecture</option>
  
  <option value="BioMedical"
    <% if(student.getBranch().equalsIgnoreCase("BioMedical")==true){%>selected="selected"<%} %> 
  >Bio Medical Engineering</option>
  
  <option value="Chemical"
    <% if(student.getBranch().equalsIgnoreCase("Chemical")==true){%>selected="selected"<%} %>
  >Chemical Engineering</option>
  
  <option value="Civil"
  <% if(student.getBranch().equalsIgnoreCase("Civil")==true){%>selected="selected"<%} %>    
  >Civil Engineering</option>
  
  <option value="ComputerScience"
   <% if(student.getBranch().equalsIgnoreCase("ComputerScience")==true){%>selected="selected"<%} %>   
  >Computer Science & Engineering</option>
  
  <option value="Electrical"
     <% if(student.getBranch().equalsIgnoreCase("Electrical")==true){%>selected="selected"<%} %> 
  >Electrical Engineering</option>
  
  <option value="ElectronicsAndTelecommunication"
   <% if(student.getBranch().equalsIgnoreCase("ElectronicsAndTelecommunication")==true){%>selected="selected"<%} %>  
  >Electronics And Telecommunication Engineering</option>
  
  <option value="InformationTechnology"
     <% if(student.getBranch().equalsIgnoreCase("InformationTechnology")==true){%>selected="selected"<%} %>
  >Information Technology</option>
  
  <option value="MCA"
      <% if(student.getBranch().equalsIgnoreCase("MCA")==true){%>selected="selected"<%} %>
  >Master in Computer Application</option>
  
  <option value="Mechanical"
     <% if(student.getBranch().equalsIgnoreCase("Mechanical")==true){%>selected="selected"<%} %> 
  >Mechanical Engineering</option>
  
  <option value="Mining "
  <% if(student.getBranch().equalsIgnoreCase("Mining")==true){%>selected="selected"<%} %>    
  >Mining Engineering</option>
  
  <option value="Metallurgical"
  <% if(student.getBranch().equalsIgnoreCase("Metallurgical")==true){%>selected="selected"<%} %>    
  >Metallurgical Engineering</option> 
  </select> </td> </tr>
  
 <tr> <td><br><b style="padding-right: 29px;">Mobile no:</b> <input type="number" name="stu_mob" maxlength="10" class="form-control"
  value="<%=student.getMobileno()%>" maxlength="10">
 
 </td>
 <td><br><b style="padding-right: 20px;">email:</b> <input type="email" name="stu_email"  class="form-control"
  value="<%=student.getEmail()%>"
 >

 </td></tr>

 <tr> <td><br><b style="padding-right: 36px;">Semester:</b><select name="sem" style="padding-right: 120px; " class="form-control">
  <option value="-1"
<% if(student.getSemester()==-1){%>selected="selected"<%} %>
  >select</option>
  
  <option value="1"
<% if(student.getSemester()==2){%>selected="selected"<%} %>
  >1</option>
  
  <option value="2"
<% if(student.getSemester()==2){%>selected="selected"<%} %>
  >2</option>
  
  <option value="3"
<% if(student.getSemester()==3){%>selected="selected"<%} %>
  >3</option>
  
  <option value="4"
<% if(student.getSemester()==4){%>selected="selected"<%} %>
  >4</option>
  
  <option value="5"
 <% if(student.getSemester()==5){%>selected="selected"<%} %>
  >5</option>
  
  <option value="6"
 <% if(student.getSemester()==6){%>selected="selected"<%} %>
  >6</option>
  
  <option value="7"
<% if(student.getSemester()==7){%>selected="selected"<%} %>
  >7</option>
  
  <option value="8"
<% if(student.getSemester()==8){%>selected="selected"<%} %>
  >8</option>
</td>
 <td><br><b style="padding-right: 20px;">Cgpa:</b> <input type="text" name="stu_cgpa"  class="form-control"
value="<%=student.getCgpa()%>"
 >

 </td>
 </tr>

 <tr> <td><br><b>enrollment no:</b> <input type="text" name="stu_enroll" class="form-control"
  value="<%=student.getEnrollment()%>"   
 >

      </td>
 <td><br><b style="padding-right: 14px;">Hostel :</b><select style="padding-right: 56px;" name="stu_hostel" class="form-control">
  <option value="-1"
   <% if(student.getHostel().equalsIgnoreCase("-1")==true){%>selected="selected"<%} %>
  >select</option>
  <option value="boys"
       <% if(student.getHostel().equalsIgnoreCase("boys")==true){%>selected="selected"<%} %>  
  >boys(A,B,C,D,F)</option>
  
  <option value="girls"
      <% if(student.getHostel().equalsIgnoreCase("girls")==true){%>selected="selected"<%} %>   
  >girls(E,G,PG)</option>
  </select>
   </td></tr>

 <tr> <td><br><b style="padding-right: 32px;">Category :</b><select name="category" style="padding-right: 115px;" class="form-control">
  <option value="-1"
      <% if(student.getCategory().equalsIgnoreCase("-1")==true){%>selected="selected"<%} %>  
  >select</option>
  
  <option value="General"
     <% if(student.getCategory().equalsIgnoreCase("General")==true){%>selected="selected"<%} %>
  >General</option>
  
  <option value="Obc"
   <% if(student.getCategory().equalsIgnoreCase("Obc")==true){%>selected="selected"<%} %>
  >Obc</option>
  
  <option value="Sc"
   <% if(student.getCategory().equalsIgnoreCase("Sc")==true){%>selected="selected"<%} %>
  >Sc</option>
  
  <option value="St"
     <% if(student.getCategory().equalsIgnoreCase("St")==true){%>selected="selected"<%} %>
  >St</option>
  
  <option value="Pwd"
      <% if(student.getCategory().equalsIgnoreCase("Pwd")==true){%>selected="selected"<%} %>   
  >Pwd</option>
  
  <option value="Dasa"
   <% if(student.getCategory().equalsIgnoreCase("Dasa")==true){%>selected="selected"<%} %>     
  >Dasa</option>
  </select>
   </td> 
   
 <td><br><b>Gender:</b> 
 <input type="radio" name="gender" value="male"
     <% if(student.getGender().equalsIgnoreCase("male")==true){%>checked<%} %>        
 > Male<br>
 
  <input type="radio" name="gender" value="female"
   <% if(student.getGender().equalsIgnoreCase("female")==true){%>checked<%} %>           
  > Female<br>
  
  <input type="radio" name="gender" value="other"
   <% if(student.getGender().equalsIgnoreCase("other")==true){%>checked<%} %>           
  > Other</td></tr>

 <tr><td><br><b>Date of Birth :</b><input type="date" name="stu_birth"  class="form-control"
 value="<%=student.getBirth()%>"
 >
 
 </td>
<td><br><b>Address :</b> <input type="text" name ="stu_address"  class="form-control"
value="<%=student.getAddress()%>"></td></tr>

 <tr><td><br><b>Account No :</b><input type="number" name="stu_accno" class="form-control" value="<%=student.getAccno() %>"></td>
 <td><br><b>Hostel Id</b><input type="number" name="stu_hostelId" class="form-control" value="<%=student.getHostelId()%>" readonly="readonly"></td>
</tr>
<tr><td><br><br><input type="reset" value="reset"></td>
<td><br><br><input type="submit" value="Go" onclick="myfunction();"></td></tr>
</table>
</form>
    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

     </div>
  </div>
  <br>
  <br>
<hr>

    <div class="row">
       <div class="col-sm-9">
       
          <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Name</b></div>
          <div class="col-xs-7"><%=student.getName()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>HostelId</b></div>
          <div class="col-xs-7"><%=student.getHostelId()%></div>
          </div>
          </div> 
          </div>
          
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>RollNo</b></div>
          <div class="col-xs-7"><%=student.getRollno()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>EnrollmentNo</b></div>
          <div class="col-xs-7"><%=student.getEnrollment()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Course</b></div>
          <div class="col-xs-7"><%=student.getCourse()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Branch</b></div>
          <div class="col-xs-7"><%=student.getBranch()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>MobileNo</b></div>
          <div class="col-xs-7"><%=student.getMobileno()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Email</b></div>
          <div class="col-xs-7"><%=student.getEmail()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>cgpa</b></div>
          <div class="col-xs-7"><%=student.getCgpa()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Category</b></div>
          <div class="col-xs-7"><%=student.getCategory()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Date Of Birth</b></div>
          <div class="col-xs-7"><%=student.getBirth()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Address</b></div>
          <div class="col-xs-7"><%=student.getAddress()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Account No</b></div>
          <div class="col-xs-7"><%=student.getAccno()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Room No</b></div>
          <div class="col-xs-7"><%=student.getRoomno()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Semester</b></div>
          <div class="col-xs-7"><%=student.getSemester()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Gender</b></div>
          <div class="col-xs-7"><%=student.getGender()%></div>
          </div>
          </div> 
          </div>
          &nbsp;
          &nbsp; 
          &nbsp;
          &nbsp;         
    </div>  
   
    <div "col-sm-3">
    
      <div class="inset" >
   <img  src="ViewImageController?id=<%=student.getHostelId()%>&name=image1" height="150px" width="150px"/>
   
     </div>
    </div> 
  </div>
   <%}%>
  </div>
  
  <div id="menu1"
   <%if(session.getAttribute("flag")!=null) {
	  	long flag= (Long)session.getAttribute("flag");
   if(flag==1){%>class="tab-pane fade in active"<%}if(flag!=1){%> class="tab-pane fade"<%}}%>
    <%if(session.getAttribute("flag")==null){%>class="tab-pane fade"<%}%>
    > 
     
   <% if(session.getAttribute("flag")!=null) {
    	boolean result_parent= (Boolean)session.getAttribute("result_parent");
	  	long flag= (Long)session.getAttribute("flag");
	  	if(flag==1){
    if(result_parent==true){%>
    <div class="alert alert-success alert-dismissable fade in"">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong>Updation is sucessful.
  <%}if(result_parent==false){%>
  <div class="alert alert-success alert-dismissable fade in"">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Ohhh!</strong>Updation problem.<%}%>
</div>
    <%}}%>
         
     <div class="rowtop">
    <div class="col-sm-8">
    <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-left: 180px;">
	<b>Parent Details</b></p>
    </div>
    <div class="col-sm-4">
    
  
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" style="float:right;margin-bottom: 11px; margin-top: 15px; margin-right: 24px; margin-top: -8px;"><span class="glyphicon glyphicon-pencil"></span>
    &nbsp; Edit</button> 

  <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
         <%if(session.getAttribute("stuparent")!=null){ 
Student stu_parent= (Student)session.getAttribute("stuparent");
%> 
        <form action="ViewUpdateParentController" method="post">
<table style="width:80%">
<tr>
      <td><br><input type="hidden" name="hostelId" value="<%=stu_parent.getParentId()%>" required class="form-control"></td>
		</tr>
		<tr> 
		<td><br><b>Father's Name :</b> <input type="text" name="father" value="<%=stu_parent.getFatherName()%>" required class="form-control"></td>
 <td><br><b>Mother's Name :</b> <input type="text" name="mother" value="<%=stu_parent.getMotherName()%>" required class="form-control"></td></tr>

 <tr> <td><br><b>Father Contact: </b><input type="text" name="f_no" value="<%=stu_parent.getFatherMobile()%>" required class="form-control">
 <h4 style="color: red; padding-left: 154px; ">
 
      </h4> 
 </td>

<tr><td><br><b>Address :</b> <input type="text" name ="f_address" value="<%=stu_parent.getFatherAddress()%>" class="form-control"></td>
<td><br><b>Father Email :</b> <input type="email" name ="f_email" value="<%=stu_parent.getFatherEmail()%>" class="form-control"></td>
</tr>

 <tr> <td><br><b>Local Gaurdian name: </b><input type="text" name="l_name" value="<%=stu_parent.getLocalGaurdianName()%>" class="form-control"></td>
 <td><br><b>Local Gaurdian Contact : </b><input type="text" name="l_no" value="<%=stu_parent.getLocalGaurdianMobile()%>" class="form-control"></td></tr>

<tr>
 <td><br><br><input type="reset" value="reset" onclick="myfunction();"></td>
<td><br><br><input type="submit" value="Update" onclick="myfunction();"></td></tr>
</table>
</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
    
     </div>
  </div>
  <br>
  <br>
<hr>

    <div class="row">
       <div class="col-sm-9">
       
          <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Parent Id</b></div>
          <div class="col-xs-7"><%=stu_parent.getParentId()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Father Name</b></div>
          <div class="col-xs-7"><%=stu_parent.getFatherName()%></div>
          </div>
          </div> 
          </div>
          
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Mother Name</b></div>
          <div class="col-xs-7"><%=stu_parent.getMotherName()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Father Mobile</b></div>
          <div class="col-xs-7"><%=stu_parent.getFatherMobile()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Father Address</b></div>
          <div class="col-xs-7"><%=stu_parent.getFatherAddress()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>Father Email</b></div>
          <div class="col-xs-7"><%=stu_parent.getFatherEmail()%></div>
          </div>
          </div> 
          </div>
                    <div class="row">
          <div class="col-sm-6">
          <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>LocalGaurdianName</b></div>
          <div class="col-xs-7"><%=stu_parent.getLocalGaurdianName()%></div>
          </div>
          </div>
           <div class="col-sm-6">
                  <div class="row mgbt-xs-0">
          <div class="col-xs-5"><b>LocalGaurdianMobile</b></div>
          <div class="col-xs-7"><%=stu_parent.getLocalGaurdianMobile()%></div>
          </div>
          </div> 
          </div>
 
   
    
        
          &nbsp;
          &nbsp; 
          &nbsp;
          &nbsp;         
    </div>  
    <div "col-sm-3">
    
      <div class="inset" >
            <img  src="ViewImageController?id=<%=stu_parent.getParentId()%>&name=image2" height="150px" width="150px"/>
         
      </div>
    </div> 
  </div>
  <%}%>
</div>


  <div id="menu2"
  <%if(session.getAttribute("flag")!=null) {
	  	long flag= (Long)session.getAttribute("flag");
   if(flag==2){%>class="tab-pane fade in active"<%}if(flag!=2){%> class="tab-pane fade"<%}}%>
    <%if(session.getAttribute("flag")==null){%>class="tab-pane fade"<%}%>
  >
    <% if(session.getAttribute("flag")!=null) {
    	boolean result_doc= (Boolean)session.getAttribute("result_doc");
	  	long flag= (Long)session.getAttribute("flag");
	  	if(flag==2){
    if(result_doc==true){%>
    <div class="alert alert-success alert-dismissable fade in"">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong>Updation is sucessful.
  <%}if(result_doc==false){%>
  <div class="alert alert-success alert-dismissable fade in"">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Ohhh!</strong>Updation problem.<%}%>
</div>
    <%}}%>
    
    <div class="rowtop">
    <div class="col-sm-8">
    <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-left: 180px;">
	<b>Documents</b></p>
    </div>
    <div class="col-sm-4">
    
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" style="float:right;margin-bottom: 11px; margin-top: 15px; margin-right: 24px; margin-top: -8px;"><span class="glyphicon glyphicon-pencil"></span>
    &nbsp; Edit</button> 

  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
        <%if(session.getAttribute("studoc")!=null){ 
Student stu_doc= (Student)session.getAttribute("studoc");
System.out.println("doc id..........###########"+stu_doc.getStuDocId());
%>
         <form action="ViewUpdateDocController" method="post" enctype="MULTIPART/FORM-DATA">
<table style="width:80%">
<tr> <td><br><input type="hidden" name="hostelId" value="<%=stu_doc.getStuDocId()%>" class="form-control"></td>
		</tr>
        <tr><td><br><b> Student image :</b> 
<input type="file" accept="image/*"  name="simg" onchange="showMyImage(this)" /></td>
 <td><br><b> Student thunmb :</b> 
 <input type="file" accept="image/*"  name="s_timg" onchange="showMyImage(this)" />
</td></tr>

<tr><td><br><b> Student result :</b>
 <input type="file" accept="image/*"  name="s_res" onchange="showMyImage(this)" /></td>
<td><br><b> Category Certificate :</b> 
<input type="file" accept="image/*"  name="s_cat" onchange="showMyImage(this)" /></td></tr>

<tr>
<td><br><b> Father image :</b> 
<input type="file" accept="image/*"  name="f_img" onchange="showMyImage(this)" /></td></tr>

<tr><td><br><br><input type="reset" value="reset"></td>
<td><br><br><input type="submit" value="Go" onclick="myfunction();"></td></tr>
</table>
</form>
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
         </div>
  </div>
  <br>
  <br>
<hr>

<div class="rowsg">
  <div class="columnsg" style=" float: left; width: 25%; padding: 10px;">
  <figure>
    <img src="ViewImageController?id=<%=stu_doc.getStuDocId()%>&name=image1" height="150px" width="150px" alt="Nature" style="width:100%" onclick="myFunction(this);">
	 <figcaption><center>Student Image</center></figcaption>
    </figure>
  </div>
  
  <div class="columnsg" style=" float: left; width: 25%; padding: 10px;">
    <figure>
    <img src="ViewImageController?id=<%=stu_doc.getStuDocId()%>&name=image2" height="150px" width="150px" alt="Fjords" style="width:100%" onclick="myFunction(this);">
       <figcaption><center>Father Image</center></figcaption>
    </figure>
  </div>
  
  <div class="columnsg" style=" float: left; width: 25%; padding: 10px;">
  <figure>
    <img src="ViewImageController?id=<%=stu_doc.getStuDocId()%>&name=image3" height="150px" width="150px" alt="Mountains" style="width:100%" onclick="myFunction(this);">
   <figcaption><center>Student Result</center></figcaption>
    </figure>
  </div>
  
  <div class="columnsg" style=" float: left; width: 25%; padding: 10px;">
  <figure>
    <img src="ViewImageController?id=<%=stu_doc.getStuDocId()%>&name=image4" height="150px" width="150px" alt="Lights" style="width:100%" onclick="myFunction(this);">
   <figcaption><center>Category Certificate</center></figcaption>
    </figure>
  </div>
  
    <div class="columnsg" style=" float: left; width: 25%; padding: 10px;">
    <figure>
    <img src="ViewImageController?id=<%=stu_doc.getStuDocId()%>&name=image5" height="150px" width="150px" alt="Lights" style="width:100%" onclick="myFunction(this);">
  <figcaption><center>Student Thumb</center></figcaption>
    </figure>
  </div>
</div>
<%}%>

<div class="containersg">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <img id="expandedImg" style="width:100%">
  <div id="imgtext"></div>
</div>

  </div>
  </div>
  </div> 
 </div>
 </div>
</div>
</div>
</div>

</div>
   <%session.removeAttribute("flag");%>
   <script>
function myFunction(imgs) {
    var expandImg = document.getElementById("expandedImg");
    var imgText = document.getElementById("imgtext");
    expandImg.src = imgs.src;
    imgText.innerHTML = imgs.alt;
    expandImg.parentElement.style.display = "block";
}
</script>
   
<%@include file="footer.jsp" %>