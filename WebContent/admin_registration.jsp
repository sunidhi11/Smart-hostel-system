<jsp:include page="header.jsp" />
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
<title>FACULTY REGISTRATION :: NIT Raipur</title>
<!-- CONTAINER START -->
<div class="container container-sm border">
<div class="">
	<header class="container announcement-sm" style="text-align: center;" >
		<h1 style="font-family: 'Open Sans', sans-serif;">ADMIN REGISTRATION</h1>
	</header>
	<hr>
	<div class="panel-group" id="accordion">
		<div class="well">
			<%
			Map<String,String> errorList = (HashMap<String,String>)request.getAttribute("errorList");
			Map<String,String> var = (HashMap<String,String>)request.getAttribute("var");
			
			Long adminId=(Long)session.getAttribute("adminId");
			%>
			<form class="form-signin sm-form" action="AdminRegistrationController" method="post">
		      <input type="hidden" name="adminId" value="<%=adminId%>"/>      
		      <%if(errorList!=null && errorList.containsKey("errorOnAddingAdmin")==true ){ %>
		      <hr>
		       <p style="color:red;">&nbsp; <%=errorList.get("errorOnAddingAdmin") %></p>
		      <hr>
		      <%} %>
		      <div class="container">
		      <div class="row">
		      	  <div class="col-sm-6">
			      <lable>Name</lable>
			      <input type="text" class="form-control" name="name" placeholder="Your Name" required="" autofocus=""
			      <%if(var!=null && var.containsKey("name")==true ){ %>
			      value="<%= var.get("name")%>"
			      <%} %> 
			      />
			      <%if(errorList!=null && errorList.containsKey("errorName")==true ){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorName")%></p>
			      <%} %>
			      </div>
			      <div class="col-sm-6">
			      <lable>Email</lable>
			      <input type="text" class="form-control"  name="email" placeholder="Email Address" required="" autofocus=""
			      <%if(var!=null && var.containsKey("email")==true ){ %>
			      value="<%= var.get("email")%>"
			      <%} %>  
			      />
			      <%if(errorList!=null && errorList.containsKey("errorEmail")){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorEmail")%></p>
			      <%} %>
			      </div>
		      </div>
		      <hr>
		      <div class="row">
		      	<div class="col-sm-6">
			      <lable>Mobile Number</lable>
			      <input type="text" class="form-control"  name="mobileno" placeholder="Mobile Number" required="" autofocus="" 
			      <%if(var!=null && var.containsKey("mobileno")==true ){ %>
			      value="<%= var.get("mobileno")%>"
			      <%} %> 
			      />
			      <%if(errorList!=null && errorList.containsKey("errorMobileNo")){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorMobileNo")%></p>
			      <%} %>
			      </div>
			      <div class="col-sm-6">
			      <lable>Father Name</lable>
			      <input type="text" class="form-control"  name="father_name" placeholder="Father Name" required="" autofocus=""
			      <%if(var!=null && var.containsKey("father_name")==true ){ %>
			      value="<%= var.get("father_name")%>"
			      <%} %>  
			      />
			      <%if(errorList!=null && errorList.containsKey("errorFatherName")){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorFatherName")%></p>
			      <%} %>
			      </div>
		      </div>
		      <hr>
		      <div class="row">
		      	  <div class="col-sm-6">
			      <lable>Date Of Birth</lable>
			      <input type="date" class="form-control" name="dob" placeholder="Date Of Birth" required="" autofocus="" 
			      <%if(var!=null && var.containsKey("dob")==true ){ %>
			      value="<%= var.get("dob")%>"
			      <%} %> 
			      />
			      <%if(errorList!=null && errorList.containsKey("errorDateOfBirth")){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorDateOfBirth")%></p>
			      <%} %>
			      </div>
			      <div class="col-sm-6">
			      <lable>Address</lable>
			      <input type="text" class="form-control"  name="address" placeholder="Address" required="" autofocus=""
			       <%if(var!=null && var.containsKey("address")==true ){ %>
			      value="<%= var.get("address")%>"
			      <%} %> 
			      />
			      <%if(errorList!=null && errorList.containsKey("errorAddress")){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorAddress")%></p>
			      <%} %>
			      </div>
		      </div>
		      <hr>
		      <div class="row">
		      	<div class="col-sm-12">
		      	<label>Gender</label><br>
		      	<label class="radio-inline">
		      	<input type="radio" name="gender" value="male">&nbsp; Male
		    	</label>
		    	<label class="radio-inline">
		     	<input type="radio" name="gender" value="female">&nbsp; Female
		    	</label>
		    	<%if(errorList!=null && errorList.containsKey("errorGender")){ %>
			      <p style="color:red;">&nbsp; <%=errorList.get("errorGender")%></p>
			      <%} %>
			    </div>
		      </div>
		      </div>
		      <hr>
		      <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>   
		    </form>
		</div>
	</div>

</div>
</div>
<!-- CONTAINER END -->
<jsp:include page="footer.jsp" />
