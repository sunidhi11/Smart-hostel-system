<%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List" %>
    <%@page import="sis.com.util.*" %>
    <%@page import="sis.com.bo.*" %>
    <%@page import="java.sql.*" %>
    <%@include file="adminHeader.jsp" %>

<style>

.btn{
     width:100px;
}


</style>
</head>
<body>
<%if(session.getAttribute("delete")!=null) {%>
<div class="alert alert-success alert-dismissable" style="text-align: center;">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong></strong> <%=session.getAttribute("delete") %>
</div>
<%
session.removeAttribute("delete");
} %>
<%if(session.getAttribute("update")!=null) {%>
<div class="alert alert-success alert-dismissable" style="text-align: center;">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong></strong> <%=session.getAttribute("update") %>
</div>
<%
session.removeAttribute("update");
} %>

<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">WORKER DETAILS</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well"> 
	



<%if(session.getAttribute("list1")==null){

%><table class="table-bordered">
<thead>

<tr style="color: black;">
<th class="col-md-1">Id</th>
<th class="col-md-1">NAME</th>
<th class="col-md-1">FATHER NAME</th>
<th class="col-md-1">MOTHER NAME</th>


<th class="col-md-1">ADDRESS</th>

<th class="col-md-1">MOBILE NO</th>
<th class="col-md-1">GENDER</th>
<th class="col-md-1">AAdhar</th>
<th class="col-md-1">DATE OF BIRTH</th>
<th class="col-md-1">DATE OF JOINING</th>

<th class="col-md-1">ACTION</th>
</tr>
</thead><% 
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs=null;
ArrayList<Worker>list=new ArrayList<Worker>();
try {
	con  = SisDbUtil.getConnection();
	String sql="select *from Worker";
	pstmt=con.prepareStatement(sql);
	rs=pstmt.executeQuery();
	%> 
	              <%
	while(rs.next()){
	
     %><tbody>
     <tr>
      <td>	<%= rs.getLong(1)%></td>
		<td><%=rs.getString(2) %></td>
	<td>	<%=rs.getString(3) %> </td>
	<td>	<%= rs.getString(4)%></td>
	<td>	<%=rs.getString(5)%></td>
		<td><%=rs.getLong(6) %></td>
	<td>	<%=rs.getString(7) %></td>
	<td><%=rs.getLong(10) %></td>
	<td>	<%=rs.getDate(8)%></td>
	<td>	<%= rs.getDate(9)%></td>
	
	   <td>	<div class="btn-group-vertical">
<a href ='DeleteWorkerDetails?id=<%=rs.getLong(1)%>'><button type="submit" class="btn btn-primary">DELETE</button></a>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Update</button>

  <!-- Modal -->
  <form action="UpdateWorkerDetails" method="post">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Message</h4>
        </div>
        <div class="modal-body">
  <table  >  
  <tr>
    <td ><div class="form-group">
      <label class="control-label col-sm-4" for="pwd">Id:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="text" value="<%=rs.getLong(1) %>" name="id" style="width: 100%;" readonly="readonly">
      </div>
    </div>
    </td></tr>
  <tr>
    <td ><div class="form-group">
      <label class="control-label col-sm-4" >Name:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="text" value="<%=rs.getString(2) %>" name="name" style="width: 100%;">
      </div>
    </div>
    </td>
	
	<td style="padding-left:30px"><div class="form-group">
      <label class="control-label col-sm-4" >Address:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="<%=rs.getString(5) %>" name="address" style="width: 100%;">
      </div>
    </div></td>
	</tr>
    
   <tr><td> <div class="form-group">
      <label class="control-label col-sm-4" for="dob">Date Of Birth:</label>
      <div class="col-sm-8">          
        <input type="date" class="form-control" id="dob" value="<%=rs.getDate(8) %>" name="birth" style="width: 100%;">
      </div>
    </div>
    </td>

    
   <td style="padding-left:30px"> <div class="form-group">
      <label class="control-label col-sm-4" for="name">Father's Name:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="name" value="<%=rs.getString(3) %>" name="father" style="width: 100%;">
      </div>
    </div>
    </td></tr>
    
     <tr> <td> <div class="form-group">
      <label class="control-label col-sm-4" for="name">Mother's Name:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="name" value="<%=rs.getString(4) %>" name="mother" style="width: 100%;">
      </div>
    </div></td>
    
       <td style="padding-left:30px"><div class="form-group">
      <label class="control-label col-sm-4" for="No">Mobile No:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="No" value="<%=rs.getLong(6) %>" name="mobile" style="width: 100%;">
      </div>
      </div>
      </td></tr>
      <tr><td> <div class="form-group">
      <label class="control-label col-sm-4" for="gender">Gender:</label>
      <div class="col-sm-8">          
  
      <select class="selectpicker form-control"  name="gender"  style="width: 100%">
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
      </select>

      </div>
      </div></td>
      
      <td style="padding-left:30px"> <div class="form-group">
      <label class="control-label col-sm-4" for="number">Aadhar card no:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="number" value="<%=rs.getLong(10) %>" name="aadhar" style="width: 100%;">
      </div>
      </div></td></tr></table>
          

        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-info" value="Send">
        </div>
      </div>
      
    </div>
  </div>
  </form>
</div>
</td>
	</tr>
	
	
	</tbody>
	
	
      
<%	}
	
	
	
} catch (SQLException e) {
	e.printStackTrace();
}finally{
	
	try {
		SisDbUtil.closeConnection(con);
		System.out.println("connection");
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	
} }//finally

%>
<%if(session.getAttribute("list1")!=null){
	ArrayList<Worker> show=(ArrayList<Worker>)session.getAttribute("list1");%>
	<table class="table">
	<!-- <thead>
	<tr style="color: yellow;">
	<th>Id</th>
	<th>NAME</th>
	<th>FATHER NAME</th>
	<th>MOTHER NAME</th>
	<th>DATE OF BIRTH</th>
	<th>DATE OF JOINING</th>

	<th>ADDRESS</th>
	<th>GENDER</th>
	<th>MOBILE NO</th>

	<th>ACTION</th>
	</tr>
	</thead> -->
	<%
	for(Worker w:show){%>
	<tbody>
		<tr style="color: white;">
	<td>	<%=w.getId() %></td>
		<td><%=w.getName() %></td>
	<td>	<%=w.getFatherName() %> </td>
	<td>	<%= w.getMotherName()%></td>
	<td>	<%=w.getDateofbirth()%></td>
		<td><%=w.getDateofjoinig() %></td>
	<td>	<%=w.getAddress() %></td>
	<td>	<%=w.getGender()%></td>
	<td>	<%= w.getMobileno()%></td>
	
	   <td>	<div class="btn-group-vertical">
 <a href ='DeleteWorkerDetails?id=<%=w.getId()%>'><button type="submit" class="btn btn-primary">DELETE</button></a>
 <a href ='UpdateWorkerDetails?id=<%=w.getId()%>'><button type="submit" class="btn btn-primary">UPDATE</button></a>
</div>
	    </td>
	</tr>
	</tbody>
	<%}
	%>
	</table>
	<% 
} %>



<%if((Worker)session.getAttribute("worker")!=null){ %>
 
 <table style="margin: 10px;">
  
  <form  action="UpdateWorkerDetails" method="post">
 
  <tr >
    <td>ID</td>
    <td><input  type="text" name="id" value="${worker.id}" readonly="readonly"></td>
    <td style="padding-left: 20px;">NAME</td>
    <td ><input  type="text" name="name"  value="${worker.name}" autofocus="autofocus"></td>
  </tr>
  
  <tr>
    <td><br>FATHER NAME</td>
    <td><br><input  type="text" name="f_name"  value="${worker.fatherName}" ></td>
    <td style="padding-left: 20px;">MOTHER NAME</td>
    <td><input  type="text" name="m_name"  value="${worker.motherName}" ></td>
  </tr>  

<tr>
    <td><br>Address</td>
    <td><br><input  type="text" name="address"  value="${worker.address}" ></td>
    <td style="padding-left: 20px;">Mobile No</td>
    <td><input  type="text" name="mobile"  value="${worker.mobileno}" ></td>
  </tr>
 
    
  <tr>
    <td align="right"><input  type="submit" value="update"></td>
  </tr>  
  

  </form>
  
  
 </table>

 
 </fieldset>
 
 
 <% }%>
 
</table></div></div></div></div>
<br>
<%@include file="footer.jsp"%>