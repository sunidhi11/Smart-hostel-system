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
	




<table class="table-bordered">
<thead>

<tr style="color: black;">
<th class="col-md-1">Id</th>
<th class="col-md-1">NAME</th>

<th class="col-md-1">MOBILE NO</th>
<th class="col-md-1">GENDER</th>
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
	              <%int i=1;
	while(rs.next()){
	
     %><tbody>
     <tr>
      <td>	<%=i %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getLong(6) %></td>
	<td>	<%=rs.getString(7) %></td>
	

</tr></tbody>
	
      
<%	i++;}
	
	
	
} catch (SQLException e) {
	e.printStackTrace();
}finally{
	
	try {
		SisDbUtil.closeConnection(con);
		System.out.println("connection");
	} catch (SQLException e) {
	
		e.printStackTrace();
	}
	
} //finally
%>

</table>
</div></div>
</div>
</div>

<%@include file="footer.jsp"%>