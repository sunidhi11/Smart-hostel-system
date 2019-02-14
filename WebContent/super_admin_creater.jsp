<jsp:include page="header.jsp" />
<title>ALL ADMIN LIST :: SUPER ADMIN</title>
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
<style>
.modal{
	padding-top: 8%;
}
</style>

<%if(session.getAttribute("errorInput")!=null && (Boolean)session.getAttribute("errorInput")==true){ %>
   <div class="alert alert-warning alert-dismissable">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Please enter carefully!</strong>.
   </div>
<%session.removeAttribute("errorInput");
}%>
<%if(session.getAttribute("deleted")!=null && (Boolean)session.getAttribute("deleted")==true){ %>
   <div class="alert alert-warning alert-dismissable">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Deleted!</strong>.
   </div>
<%session.removeAttribute("deleted");
}%>
<%if(session.getAttribute("errorInAction")!=null && (Boolean)session.getAttribute("errorInAction")==true){ %>
   <div class="alert alert-warning alert-dismissable">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>error In Action!</strong>.
   </div>
<%session.removeAttribute("errorInAction");
}%>
<%if(session.getAttribute("added")!=null && (Boolean)session.getAttribute("added")==true){ %>
   <div class="alert alert-success alert-dismissable">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>new Administrator added successfully!</strong>.
   </div>
<%session.removeAttribute("errorInAction");
}%>

<!-- CONTAINER START -->
<div class="container container-sm border" style="">

<!-- ALL ADMIN --> 
<div class="container" >
<header class="container announcement-sm" style="text-align: center;">
	<h1 style="font-family: 'Open Sans', sans-serif;">ALL ADMINS</h1>
</header>
<hr>
<%
SuperAdminDao superAdminDao = new SuperAdminDaoImpl();
List<Admin> allAdminList = superAdminDao.getAllAdmin();
int count=1;
%>

<div class="panel-group" id="accordion">
	<div class="well">
		<button type="button" class="btn btn-success btn-sm" style="float:right;" data-toggle="modal" data-target="#newAdmin">
			<span class="glyphicon glyphicon-plus"></span> ADD NEW ADMIN
		</button>
		<hr>
    	<table class="table table-bordered table-hover table-striped">
    		<thead>
	    		<th class="col-md-1">#</th>
	    		<th class="col-md-1">ADMIN ID</th>
	    		<th class="col-md-2">USERNAME</th>
	    		<th class="col-md-3">PASSWORD</th>
	    		<th class="col-md-2">LAST LOGIN</th>
	    		<th class="col-md-1">REGISTERED</th>
	    		<th class="col-md-1">DELETE</th>
	    		<th class="col-md-1">RESET</th>
    		</thead>
    		<tbody>
    		<%for(Admin admin : allAdminList){ %>
    			<tr>
    				<td><%=count++%></td>
    				<td><%=admin.getAdminId() %></td>
    				<td><%=admin.getUsername() %></td>
    				<td><%=admin.getPassword() %></td>
    				<td><%=admin.getLastLogIn()%></td>
    				<td style="text-align: center;">
    				<%if(admin.getRegistered()==1){%>
    				<button type="button" class="btn btn-default btn-sm">
			          <span class="glyphicon glyphicon-ok"></span> Registered
			        </button>	
    				<%} else{%>
	   				<button type="button" class="btn btn-danger" >Not Registered</button>
    				<%} %>
    				</td>
    				<td style="text-align: center;">
    					<a href="SuperAdminController?action=delete&adminId="+<%=admin.getAdminId()%>+"">
	   						<button type="button" class="btn btn-danger btn-sm" ><span class="glyphicon glyphicon-trash"></span></button>
	   					</a>
    				</td>
    				<td style="text-align: center;">
	    				<a href="<%= "SuperAdminController?action=reset&adminId="+admin.getAdminId()+""%>" >
	    					<button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-repeat"></span> RESET</button>
	    				</a>
    				</td>
    			</tr>
    		<%} %>	
    		</tbody>
    		
    		
    		<!-- modal start -->
			<div id="newAdmin" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add New Administrator Account</h4>
			      </div>
			      <div class="modal-body">
			        <p>
			        <form class="form-signin" action="SuperAdminController" method="post">
			        	<div class="form-group">
						  <label for="usr">Username:</label>
						  <input type="text" class="form-control" id="subject" name="username" required="" autofocus="" value="" placeholder="Username"/>
						</div>
			        	<div class="form-group">
						  <label for="usr">Password:</label>
						  <input type="text" class="form-control" id="message" name="password" required="" autofocus=""  placeholder="Password"/>
						</div>
						<br>
						<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>&nbsp; ADD</button>						         
					</form>	
			        </p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			
			  </div>
			</div>
    		
    		<!-- modal end -->
    		
    		
    		
    	</table>
    </div> 
 
    
</div>  
<!-- ALL ADMIN END--> 

    
</div>
<!-- CONTAINER END -->
<jsp:include page="footer.jsp"/>