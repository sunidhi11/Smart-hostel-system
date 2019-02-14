<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page 
	import="java.util.*" 
	import="java.sql.*"
	import="sis.com.*"
	import="sis.com.controller.*" 
	import="sis.com.dao.*"
	import="sis.com.dao.impl.*"
	import="sis.com.daoFactory.*"
	import="sis.com.util.*"
	import="sis.com.bo.*"
	import="java.text.SimpleDateFormat"
	 
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<meta name="author" content="Seema Dewangan">
	<meta name="author" content="Sunidhi Garg">
	<meta name="author" content="Monika Jaiswal">
	<meta name="author" content="Shaurya Manhar">
	<meta name="description" content="Hostel Management System for institute based on J2EE">
	<meta name="keywords" content="hostel,system,management,java,j2ee,girl hostel,boys hostel,attendance,leave">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Abel|Anton|Exo+2|Josefin+Sans|Noto+Sans|Open+Sans|PT+Sans" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 
	<link rel="stylesheet" href="css/main.css">
</head>
<style>
.nav-sg li{
	display: inline;
}
</style>
<body data-spy="scroll" data-target=".navbar" data-offset="150">
				<div class="container" style="position: relative;font-family: Arial;width:100%;">
					<img src="images//ii.png" alt="Nature" style="width:100%;-webkit-filter: blur(2px); filter: blur(5px);">
						<div class="container text-block">
							<div class="logo col-md-8" style="float:left;margin:10	px 0px;">
								<img class="img-responsive" src="images//nitrr.gif" style="float: left;width:150pxl;height:138px;padding:2px;margin: 2px;">
									<h2> National Institute of Technology, Raipur</h2>
									<!-- <h2>à¤°à¤¾à¤·à¥à¤à¥à¤°à¥à¤¯ à¤ªà¥à¤°à¥à¤¦à¥à¤¯à¥à¤à¤¿à¤à¥ à¤¸à¤à¤¸à¥à¤¥à¤¾à¤¨, à¤°à¤¾à¤¯à¤ªà¥à¤° </h2> -->
									<!-- <h2>à¤°à¤¾à¤·à¥à¤à¥à¤°à¥à¤¯ à¤ªà¥à¤°à¥à¤¦à¥à¤¯à¥à¤à¤¿à¤à¥ à¤¸à¤à¤¸à¥à¤¥à¤¾à¤¨ à¤°à¤¾à¤¯à¤ªà¥à¤°</h2> -->
									<h2>  
									राष्ट्रीय प्रौद्योगिकी संस्थान ,रायपुर
									</h2>
								</div>
							</div>
						</div>
						<nav class="navbar navbar-default nav-sm " data-spy="affix" data-offset-top="200">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>
								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav">
										<li class="active">
											<a href="parent_home.jsp">
												<span class="glyphicon glyphicon-home">&nbsp;HOME 
												<span class="sr-only">(current)</span>
											</a>
										</li>
										<li>
											<a href="stuform1.jsp">
												<span class="glyphicon glyphicon-user">&nbsp;REGISTER
											</a>
										</li>
										<li>
										 <a href="review.jsp">REVIEWS</a>
											
										</li>
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">FACILITIES 
											<span class="caret"></span>
											</a>
											<ul class="dropdown-menu">
												<li>
													<a href="boys_fac.jsp">BOYS</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a href="girls_fac.jsp">GIRLS</a>
												</li>
												<!-- <li><a href="#">Something else here</a></li> -->
												<!-- <li role="separator" class="divider"></li><li><a href="#">Separated link</a></li><li role="separator" class="divider"></li><li><a href="#">One more separated link</a></li> -->
											</ul>
										</li>
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">HOSTEL
												<span class="caret"></span>
											</a>
											<ul class="dropdown-menu">
												<li>
													<a href="hostelA.html">A<small>MANIPAL</small></a>
												</li>
												<li>
													<a href="hostelB.html">B<small>CHIRTRAKOT</small></a>
												</li>
												<li>
													<a href="hostelC.html">C<small>TIRATHGARH</small></a>
												</li>
												<li>
													<a href="hostelD.html">D<small>MALHAR</small></a>
												</li>
												<li>
													<a href="hostelH.html">H<small>SIRPUR</small></a>
												</li>
												<li>
													<a href="hostelF.html">F<small>KOTUMSAR</small></a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a href="hostelE.html">E</a>
												</li>
												<li>
													<a href="hostelG.jsp">G</a>
												</li>
												<li>
													<a href="#">PG</a>
												</li>
												<!-- <li><a href="#">Something else here</a></li> -->
												<!-- <li role="separator" class="divider"></li><li><a href="#">Separated link</a></li><li role="separator" class="divider"></li><li><a href="#">One more separated link</a></li> -->
											</ul>
										</li>
										<li>
											<a href="contact.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;CONTACT</a>
										</li>
										<li>
											<a href="map.jsp"><span class="glyphicon glyphicon-globe"></span>&nbsp;MAP</a>
										</li>
									</ul>
						<%
						Boolean parentLoginCheck=false;
						if(session.getAttribute("parentLoginCheck")!=null){
							parentLoginCheck=(Boolean)session.getAttribute("parentLoginCheck");
						}//if
						if(parentLoginCheck==false){
						%>
						<ul class="nav navbar-nav navbar-right">
							<!-- <li><a href="#">Link</a></li> -->
							<li class="dropdown">
								<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">LOG IN<span class="caret"></span></a>
								<ul class="dropdown-menu" style="color:white;">
									<li>
										<a href="studentLogin.jsp">STUDENT</a>
									</li>
									<li>
										<a href="parent_login.jsp">PARENT</a>
									</li>
									<li role="separator" class="divider"></li>
									<li>
										<a href="admin_login.jsp">FACULTY</a>
									</li>
								</ul>
							</li>
						</ul>
						<%}//if
						else{%>
						<ul class="nav navbar-nav navbar-right">
							<!-- <li><a href="#">Link</a></li> -->
							<li class="dropdown">
								<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-log-out"></span></a>
								<ul class="dropdown-menu" style="color:white;">
									<li>
										<a href="LogOutController?admin=0&student=1&parent=0">Log Out</a>
									</li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right nav-sg" style="">
						<span style="font-size: 16px;color:#0340ed;">
							<li>
							<li> <img  style="margin-top: 5px;" src="ViewImageController?id=<%=session.getAttribute("parentId")%>&name=image2" class="img-circle" width="40px" height="40px"/></li>

							</li>
						</span>
							<%-- <li><%=session.getAttribute("hostel") %></li> --%>
						</ul>
						<ul class="nav navbar-nav navbar-right nav-sg" style="">
						<span style="font-size: 16px;color:#0340ed;">
							<li>ParentlId: <%=session.getAttribute("parentId") %></li>
							<br>
							<li>UserName: <%=session.getAttribute("username") %></li>
							
						</span>
							<%-- <li><%=session.getAttribute("hostel") %></li> --%>
						</ul>
						<%} %>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>


<!-- START CONTAINER FROM HERE -->
<!-- ADD TITLE ON YOUR PAGE -->

<%-- USE <jsp:include page="header.jsp" /> --%>


<!-- CONTAINER START -->
<!-- <div class="container container-sm border" style=""> -->

<title>PARENT HOME :: WELCOME</title>
<style>
.modal{
	margin-top: 8%;
}
a{
	color:#131313;
}
</style>
<%-- <%@page 
	import="java.util.*" 
	import="java.sql.*"
	import="sis.com.*"
	import="sis.com.controller.*" 
	import="sis.com.dao.*"
	import="sis.com.dao.impl.*"
	import="sis.com.bo.*"
	import="sis.com.daoFactory.*"
	
%>  --%>   

<%
if(session.getAttribute("parentId")==null) {
	session.setAttribute("error", "* login first");
	response.sendRedirect("parent_login.jsp");
}
        Long hostelId=0L;

if(session.getAttribute("parentId")!=null){
	//System.out.println("(String)session.getAttribute(parentId) "+session.getAttribute("parentId"));
	hostelId=Long.parseLong(""+session.getAttribute("parentId"));
}//if
ParentDao parentDao = DaoFactory.getParentDao();
int n=parentDao.newMessage(hostelId);
int leaveNotification=parentDao.newLeaveNotification(hostelId);

Boolean send=false;
if(session.getAttribute("send")!=null){
	send=(Boolean)session.getAttribute("send");
}

%>
<%if(send!=null && send==true){ %>
   <div class="alert alert-success alert-dismissable">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Send!</strong> your complain has been send and check your mail.
   </div>
<%session.putValue("send", false);
}%>
<%if(session.getAttribute("messageDeleted")!=null && (Boolean)session.getAttribute("messageDeleted")==true){ %>
   <div class="alert alert-warning alert-dismissable">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Deleted!</strong>.
   </div>
<%session.removeAttribute("messageDeleted");
}%>

<!-- CONTAINER START -->
<div class="container container-sm border">
	<div class="container" style="height:800px;">
		<div class="well" >
			<ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			  <li><a data-toggle="tab" href="#attendance">Attendance</a></li>
			  <li><a data-toggle="tab" href="#notification">Notification</a></li>
			  <li><a data-toggle="tab" href="#leave_request">Leave Request</a></li>
			  <!-- <li><a data-toggle="tab" href="#services">Services</a></li> -->
			  <li><a data-toggle="tab" href="#complain">Complain and Query</a></li>
			</ul>
			<div class="tab-content">
			  <div id="home" class="tab-pane fade in active">
			  
			  <% StudentDao dao=DaoFactory.getStudentDao();
			  Student student=new Student();
			 student= dao.ShowStudentById(hostelId);
			 System.out.println("*******"+student.getHostelId());
			if(student!=null){%>
			<div class="rowtop">
    <div class="col-sm-12">
    <p style="text-align:center;color:red;font-family:Lucida Calligraphy;font-size:25px;padding-top: 25px;">
<b>Student Details</b></p>
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
			  
			  <!-- ATTENDANCE START -->
			  <%
		        Connection con = null;
		        ResultSet rs=null;
		        
		        int totalDay=0;
		        int totalPresent=0;
		        int totalAbsent=0;
		        int totalLeave=0;
		        //System.out.println("session attribute parentId::"+session.getAttribute("parentId"));
		        
		        List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
		        List<Integer> statusList = new ArrayList<Integer>();
				ParentDao pDao = DaoFactory.getParentDao();
				int a[] = pDao.attendanceCount(hostelId);
				List l[] = pDao.attendanceDetail(hostelId);
				dateList=l[0];
				statusList=l[1];
				totalDay=a[0];
				totalPresent=a[1];
				totalAbsent=a[2];
				totalLeave=a[3];
		     %>
			  
			  <div id="attendance" class="tab-pane fade" style="padding:10px;">
			  <br>
			    <table class="table table-bordered">
	            <tbody>
	              <tr>
	                <td>Total Days</td>
	                <td><%=totalDay %></td>
	              </tr>
	              <tr>
	                <td>Present</td>
	                <td><%=totalPresent %></td>
	              </tr>
	              <tr>
	                <td>Leave</td>
	                <td><%=totalLeave %></td>
	              </tr>
	              <tr>
	                <td>Absent</td>
	                <td><%=totalAbsent %></td>
	              </tr>
	            </tbody>
	          </table>
	          <hr>
	          	<a href="#detail_attendance" class="btn btn-info" data-toggle="collapse">Details</a>
	          <hr>
			  <div id="detail_attendance" class="collapse">
	          <h1>Details of Leave and Absent</h1>
		           <table class="table table-bordered">
		            <tbody>
			          <%
			          int i=0;
				          for(Integer s:statusList){
				        	  int status = s; 
				        	  String statusPrint =null;
				        	  if(status==0)
				        		  statusPrint="ABSENT";
				        	  else if(status==1)
				        		  statusPrint="PRESENT";
				        	  else
				        		  statusPrint="LEAVE";
			          %>
		              <tr>
		                <td><%=dateList.get(i++)%></td>
		                <td><%=statusPrint%></td>
		              </tr>
		          <%}//for each%>
		            </tbody>
		          </table>
	          </div>  
			  </div>
			  <!-- ATTENDANCE END -->
			  
			  <!-- NOTIFICATION START -->
			   <%
	         List<ComplainQuery> recieved =parentDao.recieveMessage(hostelId); 
	         System.out.println("recieved  "+recieved);
		     if(recieved!=null){
		    	 parentDao.setSeen(recieved);
		     }//if
	         %>
			  <div id="notification" class="tab-pane fade">
			    <div class="" >
			    	<!-- <header class=" announcement-sm" style="padding:5px;text-align: center;">
						<h1 style="font-family: 'Open Sans', sans-serif;">NOTIFICATIONS	</h1>
					</header>
			    	<hr> -->
			    	<br>
			    	<div class="" style="max-height: 550px;overflow:scroll;">
			    	<table class="table table-bordered table table-hover table table-striped">
			    		<thead>
				    		<th class="col-md-1">QUERY ID</th>
				    		<th class="col-md-2">DATE</th>
				    		<th class="col-md-5">SUBJECT</th>
				    		<th class="col-md-1">VIEW</th>
				    		
				    		<th class="col-md-1">DELETE</th>
			    		</thead>
			    		<tbody>
			    		<%for(ComplainQuery c: recieved) {%>
			    			<tr>
			    				<td><%=c.getQueryId() %></td>
			    				<%
			    				java.util.Date date =new java.util.Date(c.getDate().getTime());
			    				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("d MMM, yyyy");
			    				String d = sdf.format(date);
			    				%>
			    				<td><%=d%></td>
			    				<td><%=c.getSubject() %></td>
			    				<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#<%="J"+c.getQueryId()%>">VIEW</button></td>
			    				
			   					<td><a href="ParentMessageDelete?id=<%=c.getId()%>"><button type="button" class="btn btn-danger" ">DELETE</button></a></td>
			    				
			    				<!-- Modal -->
				    			<div id="<%="J"+c.getQueryId()%>" class="modal fade" role="dialog">
								  <div class="modal-dialog modal-lg">
								    <!-- Modal content-->
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <h4 class="modal-title">SUBJECT::&nbsp<b><%=c.getSubject() %></b></h4>
								      </div>
								      <div class="modal-body">
								        <p><%=c.getMessage() %></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
								<!-- Modal -->
			    			</tr>
			    			<%} %>
			    		</tbody>
			    	</table>
			    		
			    		
			    	</div>
			    </div>
			  </div>
			  <!-- NOTIFICATION END -->
			  
			  <!-- LEAVE REQUEST START -->
			  <%
	         AdminDao adminDao = DaoFactory.getAdminDao();
	         List<Leave> allLeaveRequest = parentDao.getAllLeave(hostelId); 
	         List<Leave> setSeenForThisList = new ArrayList<Leave>();
	         %>
			  
			  <div id="leave_request" class="tab-pane fade">
			    <div class="">
			    <br>
			    	<table class="table table-bordered table table-hover table table-striped">
				    	<thead>
				    		<th class="col-md-2">DATE</th>
				    		<th class="col-md-5">SUBJECT</th>
				    		<th class="col-md-1">VIEW</th>
				    		<th class="col-md-1">APPROVE</th>
				    		<th class="col-md-1">REJECT</th>
				    		<th class="col-md-1">DELETE</th>
				    	</thead>
				    	<tbody>
				    	<%
				    	int d=0;
			    		for(Leave l1: allLeaveRequest) {
			    			if(l1.getDeletedByParent().equalsIgnoreCase("no")){
			    				 setSeenForThisList.add(l1); 
			    		%><tr>
			    			<td><%=l1.getEntryDate()%></td>	
				    		<td><%=l1.getSubject() %></td>
				    		<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#<%="M"+l1.getLeaveId()%>">VIEW</button></td>
				    		<td>
			   					<%if(l1.getApprovedByParent().equalsIgnoreCase("yes")==false){ %>
			   						<a href="ParentLeaveApprove?id=<%=l1.getLeaveId()%>"><button type="button" class="btn btn-success" ">APPROVE</button></a>
			   					<%}else{%>
			   						<button type="button" class="btn btn-default" ">APPROVED</button>
			   					<%} %>	
			   					</td>
			   					<td>
			   					<% if(l1.getApprovedByParent().equalsIgnoreCase("r")==false){%>
			   						<a href="ParentLeaveReject?id=<%=l1.getLeaveId()%>"><button type="button" class="btn btn-danger" ">REJECT</button></a>
			   					<%}else{%>
			   						<button type="button" class="btn btn-danger " disabled="disabled">REJECT</button>
			   					<%} %>
			   					</td>
			   					<td>
			   						<a href="ParentLeaveReject?id=<%=l1.getLeaveId()%>"><button type="button" class="btn btn-danger" ">DELETE</button></a>
			   					</td>
			   					<!-- Modal start-->
				    			<div id="<%="M"+l1.getLeaveId()%>" class="modal fade" role="dialog">
								  <div class="modal-dialog modal-lg">
								    <!-- Modal content-->
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <h4 class="modal-title">SUBJECT::&nbsp<b><%=l1.getSubject() %></b></h4>
								      </div>
								      <div class="modal-body">
								        <p><%=l1.getReason()%></p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div>
								<!-- Modal end -->
			   					<%}//if
				    			}
			    		
				    			parentDao.setSeenForLeave(setSeenForThisList);
				    			%>
			   				</tr>
				    	</tbody>
				    </table>	
			    </div>
			  </div>
			  <!-- LEAVE REQUEST END -->
			  
			  <!-- <!-- SERVICE START -->
			  <div id="services" class="tab-pane fade">
			    <h3>Menu 2</h3>
			    <p>Some content in menu 2.</p>
			  </div>
			  
			  <!--  SERVICE end -->
			  <!-- COMPLAIN START -->
			  <div id="complain" class="tab-pane fade">
			    <div class="well">
		          <form class="form-signin" action="ParentComplainController" method="post">       
		            <h3>
		              <label>To: &nbsp Dua Lipa (Warden)</label>
		              <br>
		              <label>Email: &nbsp dualipa@gmail.com</label>
		            </h3>
		            <hr>
		            <label>Your email</label>
		            <input type="text" class="form-control" name="emailAddress"  placeholder="Your Email Address" required="" autofocus="" />
		            <br>
		            <label>Select Category</label>
		            <select class="form-control" id="sel1" name="category">
		              <option value="1" selected>select</option>
		              <option value="Put some category here">Put some category here</option>
		              <option value="another category">another category</option>
		              <option value="another category that really matter">another category that really matter</option>
		              <option value="category for no kind">category for no kind</option>
		              <option value="Query">Query</option>
		            </select> 
		            
		            <br>
		            <label>Your Complain</label>
		            <input type="text" class="form-control" name="complain"  placeholder="Add complain" required="" autofocus="" />
		            <hr>
		             <%-- <%
		            System.out.println("session.getAttribute parentid\"  "+session.getAttribute("parentId"));
		            %> --%> 
		            <button class="btn btn-lg btn-danger btn-block" type="submit">Send</button>   
		          </form>
		        </div>
			  </div>
			  <!-- COMPLAIN END -->

			</div>
		</div>	
	<!-- WELL -->
	</div>
	
</div>	
<!-- CONTAINER END -->
<jsp:include page="footer.jsp"/>