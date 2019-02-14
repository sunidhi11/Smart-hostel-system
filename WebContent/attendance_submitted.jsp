<%@page import="sis.com.util.SisDbUtil"%>
<jsp:include page="adminHeader.jsp" />
<title>ATTENDANCE DETAIL:: FACULTY</title>
<%@page 
	import="java.util.*" 
	import="java.sql.*"
	import="sis.com.*"
	import="sis.com.controller.*" 
	import="sis.com.dao.*"
	import="sis.com.dao.impl.*"
	import="sis.com.bo.*"
	import="sis.com.daoFactory.*"
	import="sis.com.util.*"
%>    
<style>
	a{
		color:black;
	}
</style>

<%
java.util.Date date = new java.util.Date();
Long hostelID=11L;
String name=null;
Connection con=null;
Statement stmt = null;
Statement stmt1 = null;
ResultSet rs = null;
ResultSet rs1 = null;
try{
	con=SisDbUtil.getConnection();
	stmt = con.createStatement();
	String sql = "select * from Student";
	rs =  stmt.executeQuery(sql);
}catch(Exception e){
	e.printStackTrace();
}

    AdminDao dao = DaoFactory.getAdminDao();
    int []attendance = dao.getAttendance(date);
    String present=""+attendance[0];
    String absent=""+attendance[1];
    String leave=""+attendance[2];
    int total=attendance[0]+attendance[1]+attendance[2];
    if(session.getAttribute("present")!=null)
    	present= ""+session.getAttribute("present");
    if(session.getAttribute("absent")!=null)
    	absent = ""+session.getAttribute("absent");
    if(session.getAttribute("leave")!=null)
    	leave = ""+session.getAttribute("leave");  
    
    List<Student> leaveList=null;
    if(session.getAttribute("attendanceList")!=null){
    	leaveList = (List<Student>)session.getAttribute("attendanceList");
    }
    Map<String,String> attendanceMap = (Map<String,String>)session.getAttribute("attendanceMap");
    %>
<!-- CONTAINER START -->
<div class="container container-sm border" style="">

<!-- ATTENDANCE SUBMITTED --> 
<div class="container" >
<header class="container announcement-sm" style="text-align: center;">
	<h1 style="font-family: 'Open Sans', sans-serif;">ATTENDANCE DETAIL</h1>
</header>
<hr>
<div class="panel-group" id="accordion">
	<div class="well">
		<div class="">
			<table class="table table-bordered table-hover table-striped">
				<thead>
	    		<th class="col-md-1">TOTAL</th>
	    		<th class="col-md-1">PRESENT</th>
	    		<th class="col-md-1">LEAVE</th>
	    		<th class="col-md-1">ABSENT</th>
    		</thead>
    		<tbody>
    			<td><%= total%></td>
    			<td><%= present%></td>
    			<td><%= leave%></td>
    			<td><%= absent%></td>
    		</tbody>
			</table>
		</div>
		<hr>
    		<table class="table table-bordered table-hover table-striped">
    		<thead>
	    		<th class="col-md-1">S.NO</th>
	    		<th class="col-md-1">HOSTEL ID</th>
	    		<th class="col-md-1">STATUS</th>
    		</thead>
    		
    		<tbody>
    		
    		
    		<%int i=1;
    		for(String hostel : attendanceMap.keySet()){
    		if(attendanceMap.get(hostel).trim().equalsIgnoreCase("1")!=true){%>
    			<tr>
    				<td><%=i++%></td>
    				<td><%=hostel%></td>
    				<td><%if(attendanceMap.get(hostel).trim().equalsIgnoreCase("0")){ %>
    				Absent
    				<%} else{%>
    				Leave
    				<%} %>
    				</td>
    			</tr>
    		<%}
    		}
    		%>	
    		</tbody>
    		
    	</table>
    	<!-- <a href="student_attendance.jsp">
			<button type="button" class="btn btn-default dropdown-toggle" >
	    		BACK
	  		</button>
		</a> -->
		<nav aria-label="...">
		  <ul class="pager">
		    <li><a href="student_attendance.jsp">back</a></li>
		  </ul>
		</nav>	
    </div> 
    <!-- WELL -->
</div>  
<!-- ATTENDANCE END--> 

    </div>
</div>
<!-- CONTAINER END -->
<jsp:include page="footer.jsp"/>