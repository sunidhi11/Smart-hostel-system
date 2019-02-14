<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="adminHeader.jsp" />

<style>
.my-button:hover{
	background:white;
}

.my-glyphicon:hover{
	color:black;
}
.my-text:hover{
	color:black;
}
.vertical-menu {
    width: 100%;
    border:;
}

.vertical-menu a {
    background-color: black;
    color: white;
    display: block;
    padding: 12px;
    text-decoration: none;
    border:solid 1px white;
}

.vertical-menu a:hover {
    background-color: white;
    color:black;
}

</style>
<title>Faculty Home :: NIT Raipur</title>
<!-- CONTAINER START -->
<div class="container container-sm border" style="text-align: center;">
<div class="container">

<div class="row">
	<div class="col-md-3">
		<!-- <div class="panel panel-default" style="background-color:#18192f;border: medium;">
		<ul class="nav nav-pills nav-stacked nav-sm">
			<li ><form action="Admin_Mess_Menu_Controller" method="get">
      <input type="hidden" name="user" value="0">
    <input type="hidden" name="admin" value="1"> 
   
    <button class="btn btn-default btn-md pull-left pad" type="submit" value="" >view Menu</button>
   </form></li>
   <li><a href="Admin_Mess_Menu_Controller?user=0&admin=1">MESS MENU</a></li>
            <li ><a href="view_complain.jsp">COMPLAIN</small></a></li>
            <li><a href="adminNotice.jsp">NOTICE</small></a></li>
            <li><a href="#">STOCK</a></li>
		</ul>
  </div> -->
 	<div class="vertical-menu">
	  <a href="Admin_Mess_Menu_Controller?user=0&admin=1">MESS MENU</a>
	  <a href="adminNotice.jsp">NOTICE</small></a>
	  <a href="view_complain.jsp">COMPLAIN</small></a>
	  <a href="admin_parent_query.jsp">PARENT QUERY </small></a>
	  
	</div> 	
  	
  
  
	</div>
	<div class="col-md-9">
		<!-- carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="images\\boysh2.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h1>Hostel H</h1>
          <p>NIT Raipur</p>
        </div>
      </div>

      <div class="item">
        <img src="images\\girlsh2.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h1>Girl Hostel</h1>
          <!-- <p>NIT Raipur</p> -->
        </div>
      </div>
    
      <div class="item">
        <img src="images\\boysh1.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h1>Hostel H</h1>
          <!-- <p>NIT Raipur</p> -->
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
 
 <!-- carousel end-->
		
	</div>
</div>
 
  <br>
 <br>   
	
  
 <div class="panel panel-default " style="text-align: center;">
 <div class="panel-heading panel-heading-sm" style="background-color:#18192f;color:white;"><h1>STUDENT</h1></div>
    <div class="panel-body">
        <!-- <header>
	        <h2><span class="welcome">Welcome</span></h2>
        </header> -->
        <hr style="width:5px;height:5px;">
	    <div class="row">
	    	<div class="col-md-1">&nbsp;</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
    		<a href="ShowStudentController">
    		 <div class="circle my-button">
				  	<span class="glyphicon glyphicon-user gyph-sm my-glyphicon"></span>
				    <div class="text-sm my-text">STUDENT DETAILS</div>
				  </div>
    		</a>
	    		<form action="ShowStudentController" method="post">
<!--     		<button class="btn btn-link " type="submit" value="Student" style="color:white;">
    		 <div class="circle my-button">
				  	<span class="glyphicon glyphicon-user gyph-sm my-glyphicon"></span>
				    <div class="text-sm my-text">STUDENT DETAILS</div>
				  </div>
    		</button> -->
  			 </form>
				 
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="student_attendance.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-th-list gyph-sm"></span>
				    <div class="text-sm">ATTENDANCE</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="admin_leave.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-road gyph-sm"></span>
				    <div class="text-sm">LEAVE Request</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="view_student1.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-tasks gyph-sm" ></span>
				    <div class="text-sm">SELECTION PROCESS</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="view_Selected.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-copy gyph-sm" ></span>
				    <div class="text-sm">SELECTED STUDENT</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-1">&nbsp;</div>
	    </div>   
    </div>
</div>
  

 <div class="panel panel-default" >
 <div class="panel-heading panel-heading-sm" style="background-color:#18192f;color:white;"><h1>WORKER</h1></div>
    <div class="panel-body">
        <!-- <header>
	        <h2><span class="welcome">Welcome</span></h2>
        </header> -->
        <hr style="width:5px;height:5px;">
	    <div class="row">
	    	<div class="col-md-3">&nbsp;</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="view_worker.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-user gyph-sm"></span>
				    <div class="text-sm">WORKER DETAILS</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="WorkerAttendence.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-th-list gyph-sm"></span>
				    <div class="text-sm">ATTENDANCE</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="Worker_form.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-road gyph-sm"></span>
				    <div class="text-sm">WORKER FORM</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-3">&nbsp;</div>
	    </div>   
    </div>
</div> 
</div>
</div>
<!-- CONTAINER END -->
<jsp:include page="footer.jsp" />




