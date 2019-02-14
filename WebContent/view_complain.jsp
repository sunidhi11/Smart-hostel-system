
       <%@page import="java.util.*" %>
    <%@page import="sis.com.bo.*" %>
    <%@page import="java.sql.*" %>
    <%@page import="sis.com.util.*" %>
    <%@page import="sis.com.dao.*" %>
        <%@page import="sis.com.util.SisDbUtil" %>
    
    <%@include file="header.jsp" %>



  <%if(session.getAttribute("msg")!=null){
	%>
	
	
	<div class="alert alert-success alert-dismissable fade in" style="text-align: center;background-color: #bedaea;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong></strong> <%=session.getAttribute("msg")%>
  </div>
	<% session.removeAttribute("msg");
	}%>
	
	<%if(session.getAttribute("result")!=null){
	%>
	
	
	<div class="alert alert-success alert-dismissable fade in" style="text-align: center;background-color: #bedaea;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong></strong><%=session.getAttribute("result")+"complain deleted"%>  </div>
	<%
	session.removeAttribute("result");
	}%>
	



<%if(session.getAttribute("complain1")!=null){ %>
<div class="alert alert-success alert-dismissable fade in" style="text-align: center;background-color: #bedaea;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong></strong> <%=session.getAttribute("complain1")%>
  </div>
<%session.removeAttribute("complain1");
}
if(session.getAttribute("mssg")!=null){
%>
<div class=" container jumbotron" Style="text-align: center;">
   <%=session.getAttribute("mssg") %>
</div><%
session.removeAttribute("mssg");
} %>
 
<%if(request.getAttribute("delmsg")!=null){
%>
<div class=" container jumbotron" Style="text-align: center;">
   <%=request.getAttribute("delmsg") %>
</div><%} %>

<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">Complain</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well"> 

 <form action="DeleteComplain" method="post">
 <button class="button btn btn-danger" type="submit" style="float:right">Delete</button></form>
 
<form action="ShowComplainController" method="post">
 <button class="button btn btn-primary" type="submit" style="float:right">SHOW</button></form>
 
 
  <form action="ShowAllMess" method="post">
 <button class="button btn btn-primary" type="submit" style="float:left">MESS</button></form>
  <form action="ShowAllElectric" method="post">
 <button class="button btn btn-primary" type="submit" style="float:left">ELECTRIC</button></form>
  <form action="ShowAllCleanliness" method="post">
<button class="button btn btn-primary" type="submit" style="float:left">CLEAN</button></form>
<br>
<hr>
<%--
<%
 /* if(session.getAttribute("list")==null){
	Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
	con=SisDbUtil.getConnection();
	String sql="select *from complain";
	pstmt =con.prepareStatement(sql);
	rs=pstmt.executeQuery(); */
	%>
	<table class="table" style="color:black">
	   <thead>
	   
	  
	    <tr>
	        <th class="col-md-1">No</th>
	        <th class="col-md-1">hostelId</th>
	        <th class="col-md-1">complainDate</th>
	        <th class="col-md-1">Department</th>
	        <th class="col-md-1">complain</th>
	        <th class="col-md-1">solveDate</th>
	        <th class="col-md-1">email</th>
	        <th class="col-md-1">Status</th>
	        <th class="col-md-1">Action </th>
	    </tr>
	  </thead><% 

	while(rs.next()){
		int complainId=rs.getInt(1);
		int hostelId = rs.getInt(2);
		java.sql.Date complainDate=rs.getDate(3);
		String department= rs.getString(4);
		String stuComplain=rs.getString(5);
		String status=rs.getString(6);
		java.sql.Date solveDate=rs.getDate(7);
		String email1=rs.getString(8);
		String status2=rs.getString(9);
		%><tbody>
		<% 
		if(status.equalsIgnoreCase("no")){
		%>
		 
	<tr>
		<td>	<%=complainId %></td>
		<td> <%=hostelId %></td>
		<td>	<%=complainDate%>       </td>
		<td>	<%=department%></td>
		<td>	<%= stuComplain%></td>
		 <td>not Solved</td>
		<td>	<%= email1%></td>
		<td><a href ='updateStatus?id=<%=complainId%>'><button type="submit" class="btn btn-default">Solve</button></a>  </td>
		<td><a href='complainDeptController?id=<%=complainId%>'><button type="submit" class="btn btn-default">Department</button></a>
	</tr>
		 
		<%}//if
		
		else{%>
		<tr>
		<td>	<%=complainId %>  </td>
		<td>    <%=hostelId %>    </td>
		<td>	<%=complainDate%>       </td>
		<td>	<%= department%>  </td>
		<td>    <%=stuComplain %>    </td>
		<td>	<%= solveDate%></td>
			
		<td>	<%=email1%></td>
		 <td><%=status%> </td>
		 <%if(status2!=null && status2.equalsIgnoreCase("sent")){ %>
		 <td><%=status2 %> </td>
		 <%}else{ %>
		 <td><a href ='complainToStudent?id=<%=complainId%>'><button type="submit" class="btn btn-primary">Student</button></a>
		<td> <button type="button" class="btn btn-default" data-toggle="modal" data-target="#<%=rs.getInt(1)%>">Student</button></td>
		<% }%>
		</tr>
	<% }//else
	%>	
	</div>
		<form action="complainToStudent">
  <div class="modal fade" id="<%=rs.getInt(1)%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body">
        
        
        
 <input type="hidden" name="email" value='<%=email1%>'>
 <input type="hidden" name="c_id" value='<%=complainId%>'>
 <input type="hidden" name="h_id" value='<%=hostelId%>'>
 <input type="hidden" name="complain" value='<%=stuComplain %>'>
 <input type="hidden" name="status" value='<%=status %>'>
 <input type="hidden" name="c_date" value='<%=complainDate %>'>
 <input type="hidden" name="s_date" value='<%=solveDate %>'>
 <input type="hidden" name="dept" value='<%=department %>'>
		
		
		
          <textarea rows="4" cols="50" name="mssg">
          </textarea>

        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-info" value="Send">
        </div>
      </div>
      
    </div>
  </div>
 </form>
</table>		
	<% }
}catch (SQLException e) {
	e.printStackTrace();
}catch (Exception e) {
	e.printStackTrace();
}finally{
	try {
		SisDbUtil.closeConnection(con);
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
}
}
	 %> --%>
	 
	
<%if(session.getAttribute("list")!=null){
	ArrayList<Complain> show= (ArrayList<Complain>)session.getAttribute("list");%>
	<br><br> 
	<div class="well">
	<div style="overflow-x:auto;">
	 <table class="table">
   <thead>
   
  
    <tr>
        <th>No</th>
        <th>hostelId</th>
        <th>complainDate</th>
        <th>Department</th>
        <th>complain</th>
        <th>solveDate</th>
        <th>Status</th>
        <th>Action </th>
    </tr>
  </thead>
<tbody>
	<% 
	for(Complain w:show){
	if(w.getStatus().equalsIgnoreCase("no")){
	%>
	 
<tr>
	<td>	<%=w.getComplainId() %></td>
	<td> <%=w.getHostelId() %></td>
	<td>	<%=w.getComplainDate()%>       </td>
	<td>	<%=w.getDepartment()%></td>
	<td>	<%= w.getComplain()%></td>
	 <td>not Solved</td>
	<td>	<%= w.getEmail()%></td>
	<td><a href ='updateStatus?id=<%=w.getComplainId()%>'><button type="submit" class="btn btn-default">Solve</button></a>  </td>
	<td><a href='complainDeptController?id=<%=w.getComplainId()%>'><button type="submit" class="btn btn-default">Department</button></a>

</td></tr>
	 
	<%}
	
	else{%>
	<tr>
	<td>	<%=w.getComplainId() %>  </td>
	<td>    <%=w.getHostelId() %>    </td>
	<td>	<%=w.getComplainDate()%>       </td>
	<td>	<%= w.getDepartment()%>  </td>
	<td>    <%=w.getComplain() %>    </td>
	<td>	<%= w.getSolveDate()%></td>
		
	<td>	<%=w.getEmail()%></td>
	 <td><%=w.getStatus() %> </td>
	 <%if(w.getSentStudent()!=null && w.getSentStudent().equalsIgnoreCase("sent")){ %>
	 <td><%=w.getSentStudent() %> </td>
	 <%}else{ %>
	
<%-- 	 <td><a href ='complainToStudent?id=<%=w.getComplainId()%>'><button type="submit" class="btn btn-primary">Student</button></a>
 --%>		<td>	 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#<%=w.getComplainId()%>">Student</button>
			 
			 </td></tr>
	</tbody>
	<% }%>
	<% }%>
	</div>
	<form action="complainToStudent">
  <div class="modal fade" id="<%=w.getComplainId()%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body">
        
        
        <input type="hidden" name="email" value='<%=w.getEmail()%>'>
 <input type="hidden" name="c_id" value='<%=w.getComplainId()%>'>
 <input type="hidden" name="h_id" value='<%=w.getHostelId()%>'>
 <input type="hidden" name="complain" value='<%=w.getComplain() %>'>
 <input type="hidden" name="status" value='<%=w.getStatus() %>'>
 <input type="hidden" name="c_date" value='<%=w.getComplainDate() %>'>
 <input type="hidden" name="s_date" value='<%=w.getSolveDate() %>'>
 <input type="hidden" name="dept" value='<%=w.getDepartment() %>'>
		
          <textarea rows="4" cols="50" name="mssg">
          </textarea>

        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-info" value="Send">
        </div>
      </div>
      
    </div>
  </div>
  </form>
	
	
	<% }
} %> 
</tbody>
            
   </table>    
         </div>
  </div>

 
 </div></div></div></div>
 <br>
 <%@include file="footer.jsp" %>

