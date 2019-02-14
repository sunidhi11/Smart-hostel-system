<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="commonHeader.jsp" />
<%@page 
	import="java.util.*" 
	import="java.sql.*"
	import="sis.com.*"
	import="sis.com.controller.*" 
	import="sis.com.dao.*"
	import="sis.com.dao.impl.*"
	import="sis.com.bo.*"
	import="sis.com.daoFactory.*"
%>    

<%
AdminDao aDao = DaoFactory.getAdminDao();
StudentDao studentDao = DaoFactory.getStudentDao();
Student student = null;
List<Leave> allLeaveRequest = aDao.getAllLeave(); 
%>
<%
boolean deleted=false;
boolean approved=false;
if(session.getAttribute("deleted")!=null){
	deleted=(Boolean)session.getAttribute("deleted");
}
if(session.getAttribute("approved")!=null){
	approved=(Boolean)session.getAttribute("approved");
}
%>

<%
if(deleted==true){ %>
<div class="alert alert-danger alert-dismissable fade in">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <h4><strong>Deleted!</strong></h4>
</div>
<%} %>
<%if(approved==true){ %>
<div class="alert alert-success alert-dismissable fade in">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <h4><strong>Approved!</strong></h4>
</div>
<%} 

session.removeAttribute("deleted");
session.removeAttribute("approved");

%>

<!-- CONTAINER START -->
<div class="container container-sm border" style="">

<!-- MAP --> 
<div class="container" style="text-align: center;">
<header class="container announcement-sm">
	<h1 style="font-family: 'Open Sans', sans-serif;">NIT RAIPUR, 492001</h1>
</header>
<hr>
<div class="panel-group" id="accordion">
	<div class="well">
    	<iframe width="80%"
		  height="600px"
		  frameborder="0" style="border:0"
		  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCtEst1cdmxXeoiG8WrIvS-IK-umpcXLOA
		    &q=NIT+Raipur" allowfullscreen>
		</iframe>
 	</div>
    </div> 
</div>  
<!-- MAP END--> 

    
</div>
<!-- CONTAINER END -->
<jsp:include page="footer.jsp"/>