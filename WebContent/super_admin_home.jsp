<%@include file="header.jsp" %>
<title>SUPER ADMINISTRATION :: HOME</title>
<style>
.alert{ text-align: center;
       height:70px;
}
.text-sm {
    font-size: 15px;
    padding-top: 10px;
    padding-left: 30px;
}
.gyph-sm {
    color: blck;
    font-size: 57px;
    padding-top: 13px;
    padding-left: 45px;
}
</style>
<body>
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">SUPER ADMINISTRATION HOME</h1>
	</header><hr>
  <div class="panel-body" id="accordion">
    <div class="well">
   <div class="panel-body">
        <!-- <header>
	        <h2><span class="welcome">Welcome</span></h2>
        </header> -->
        <hr style="width:5px;height:5px;">
	    <div class="row">
	    	<div class="col-md-1">&nbsp;</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="SuperAdminCreaterController">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-user gyph-sm"></span>
				    <div class="text-sm">ADD ADMIN</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="showAllDeleted.jsp">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-th-list gyph-sm"></span>
				    <div class="text-sm">STUDENT</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="#">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-share gyph-sm"></span>
				    <div class="text-sm">LEAVE APPLICATION</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="#">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-envelope gyph-sm" ></span>
				    <div class="text-sm">FEEDBACK</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-2">
	    		<div class="container-card-sm">
				  <a href="#">
				  <div class="circle">
				  	<span class="glyphicon glyphicon-copy gyph-sm" ></span>
				    <div class="text-sm">WORKER</div>
				  </div>
				  </a>
				 </div>
	    	</div>
	    	<div class="col-md-1">&nbsp;</div>
	    </div>   
    </div>

    </div></div>
    </div></div>
<%@include file="footer.jsp" %>