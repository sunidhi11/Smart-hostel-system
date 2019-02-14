
  <%@include file="header.jsp" %> 
  <%
studentLoginCheck=false;
if(session.getAttribute("studentLoginCheck")!=null){
 studentLoginCheck=(Boolean)session.getAttribute("studentLoginCheck");}
if(studentLoginCheck==false){
	response.sendRedirect("studentLogin.jsp");
}
%>
  <title>student profile</title>

<style type="text/css">
* {
    box-sizing: border-box;
}
.nav-pills>li>a {
    border-radius: 0px;
  
}
.gallery {
    margin: 0;
    font-family: Arial;

}


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
    color: white;
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
</style>


  <!--   <form action="ViewStudentController" method="get">
    <input type="hidden" name="id" value="1067">
    <input type="hidden" name="flag_admin" value="0">
     <input type="hidden" name="flag_student" value="1">
    <button class="btn btn-default btn-md pull-left pad" type="submit" value="Student" >view</button>
   </form> -->
<div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENT PROFILE</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">

  
<% if((Long)(session.getAttribute("flag_student1"))!=null){ 
if((Long)(session.getAttribute("flag_student1"))==1){ 
/* long n=(Long)session.getAttribute("number"); */

%> 

<ul class="nav nav-pills" style="background-color:#18192f;">
  <li class="active" ><a data-toggle="pill" href="#home">Personal</a></li>
  <li> <a data-toggle="pill" href="#menu1">Family</a></li>
  <li> <a data-toggle="pill" href="#menu2">Documents</a></li>
  <li><a data-toggle="pill" href="#menu3">Notification
  <%if(session.getAttribute("number")!=null){%>
  <span class="badge"><%=session.getAttribute("number")%></span><%}%>
  </a></li>
</ul>
 <%session.removeAttribute("number");%>
<div class="tab-content">
  <div id="home"  class="tab-pane fade in active">
 
 <div class="row">
    <div class="col-sm-12">
     <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-top: 25px;">
   <b>Personal Details</b></p>
    </div>
  </div>     
<% 
if(session.getAttribute("student")!=null){ 
Student student= (Student)session.getAttribute("student");
%>
        

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
  
  <div id="menu1" class="tab-pane fade"> 
          
     <div class="row">
    <div class="col-sm-12">
    <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-top: 25px;">
   <b>Parent Details</b></p>
    </div>
 
     </div> 
 
<hr>
<%if(session.getAttribute("stuparent")!=null){ 
Student stu_parent= (Student)session.getAttribute("stuparent"); %>
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
    <%}%>
  </div>
 
</div>


  <div id="menu2" class="tab-pane fade" >
    
    <div class="row">
    <div class="col-sm-12">
     <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-top: 25px;">
   <b>Documents</b></p>
    </div>
     </div>

<hr>
 <%if(session.getAttribute("studoc")!=null){ 
Student stu_doc= (Student)session.getAttribute("studoc"); %> 
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
  
    <div id="menu3" class="tab-pane fade">
       <div class="row">
    <div class="col-sm-12">
    <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-top: 25px;">
   <b>Notifiacations</b></p>
    </div>
   
  </div>
<hr>
 <div>
   <table class="table table-hover table-striped table-responsive">
    <thead>
      <tr>
        <th>Date</th>
        <th>Subject</th>
        <th>View</th>
        <th>Delete</th>
      </tr>
    </thead>
     <tbody>
<%if(session.getAttribute("leave_list")!=null){ 
List<Leave> leave_list= (List<Leave>)session.getAttribute("leave_list");%>
  
   
    <%for(Leave leave:leave_list){%>
      <tr>
      <%	
		  	java.util.Date date =new java.util.Date(leave.getSendToStudentEmailTime().getTime());
		    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("d MMM, yyyy");
		    String d = sdf.format(date);
		 %>
		 <td><%=d%></td>
        <td>Reagrding leave Confirmation</td>
       
        <td><button type="button" class="btn btn-xs btn-info" data-toggle="modal" data-target="#<%=leave.getLeaveId()%>">VIEW</button></td>
       <td> <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="myFunction(this.id)" id="<%=leave.getLeaveId()%>" value="DeleteStudentController?id=<%=leave.getLeaveId()%>"><span class="glyphicon glyphicon-trash"></span></button></td>
      	<div id="<%=leave.getLeaveId()%>" class="modal fade" role="dialog">
							  <div class="modal-dialog modal-lg">
							    <!-- Modal content-->
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal">&times;</button>
							        <h4 class="modal-title">SUBJECT::&nbsp<b>Regarding Leave</b></h4>
							      </div>
							      <div class="modal-body">
							        <p>Your leave has been confirmed</p>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
      
      </tr>
     
    </tbody>
     <%}} %>
  </table>
 
  </div>
  
   
  </div>
</div>

</div>
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        
                  <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
          
        </div>
        <div class="modal-body">
          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
          
        </div>
        <div class="modal-footer">
       <!--  <a href="" id="toChange" >yes</a> -->
       <a href="" id="toChange" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span> Yes</a> 
         <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
        </div>
      </div>
      
    </div>
  </div>
<%}}%> 
   </div>
   </div>
   </div>
   
   
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