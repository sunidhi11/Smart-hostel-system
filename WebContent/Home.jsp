

 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@ page import="java.sql.*" %>  
 <%@ page import="java.io.*" %>
 <%@page import="java.io.FileInputStream" %>
 
      
 
<!DOCTYPE html>
<html lang="en">
<head>
<title>home</title><meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Abel|Anton|Exo+2|Josefin+Sans|Noto+Sans|Open+Sans|PT+Sans" rel="stylesheet"> 
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 	
</head>

<style type="text/css">
.hjumbo{
        background-color: #18192f;
         font-family:Harrington;
		 color:white;
		 font-size:30px;
		 text-align:center;
        padding: 10px;
        margin-bottom: 3px;
        background-image: url("images//im.png");
        
        }
 body{
	background-color: white;
	/* padding-top: 70px; */
}
.infolist{
	list-style: none;
	color:#a9a69b;
}
.panel-heading-sm{
	background-color:blue; 
}

.copyright{
	font-size: 10px;
}
.panel-sm{
	font-family: 'Open Sans', sans-serif;
}
.footer-heading{
	color:#1515a2;;
}
.welcome{
	font-size: 57px;
}
.welcome-description{
	font-size: 20px;
	font-family: 'Noto Sans', sans-serif;
}
.panel-max-size{
 	height: 200px;
 	max-height: 200px;
 	min-height: 200px;
 	display: inline-block;
 	overflow: auto;
 	
}
* {
    box-sizing: border-box;
}

.col-container {
    display: table;
    width: 100%;
}
.col {
    display: table-cell;
    padding: 16px;
}

@media only screen and (max-width: 600px) {
    .col { 
        display: block;
        width: 100%;
    }
}
.container-sm{
	background-color: #cccccc;
	padding: 10px;
	padding-top:20px;
	box-shadow:0 37px 45px 0 rgba(0, 0, 9, 1), 0 27px 20px 0 rgba(0, 0, 0, 1);
}
.panel-heading-sm{
	background-color: white;
	border-top-color:black; 
}
.announcement-sm{
	width:auto;
	height:80px;
	margin:10px;
	background: #18192f;
	color:white;
}
.nav-sm{
	 box-shadow:0 10px 10px 0 rgba(171, 171, 171, 0.55), 0 10px 10px 0 rgba(0, 1, 1, 0.5);
}
.active{
	background-color: white; 
}
.text-block {
    position: absolute;
    background-color: #02020880;
    color: white;
    width: 100%;
    height: 100%;
    bottom: 20px;
    right: 20px; 
    top:20px;
}
.text-block {
	width: 97%;
	height: 80%;
}
 .affix {
      top: 0;
      width: 100%;
      z-index: 9999 !important;
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
    	<h2>  
राष्ट्रीय प्रौद्योगिकी संस्थान ,रायपुर
</h2>
    </div>
  </div>
</div>


        <nav class="navbar navbar-default nav-sm " data-spy="affix" data-offset-top="200">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Home.jsp"><span class="glyphicon glyphicon-home"></span>Home</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">Hostel
	 					<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">BOYS HOSTEL</li>
                            <li><a href="hostelA.html">A(MAINPAT)</a></li>
                            <li><a href="hostelB.html">B(CHITRAKOT)</a></li>
                            <li><a href="hostelC.html">C(TIRATHGARH)</a></li>
                            <li><a href="hostelD.html">D(MALHAR)</a></li>
                            <li><a href="hostelH.html">H(SIRPUR)</a></li>
                            <li><a href="hostelF.html">F(KOTUMSAR)</a></li>
                            <li class="dropdown-header">GIRLS HOSTEL</li>
                            <li><a href="hostelE.html">E</a></li>
                            <li><a href="hostelG.jsp">G</a></li>
                            <li><a href="hostelPG.html">PG</a></li>
                        </ul>
                    </li>
                    <li><a href="stuform1.jsp"><span class="glyphicon glyphicon-user"> Register</span></a></li>

                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">Facilities<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="girls_fac.jsp">Girls</a></li>
                            <li><a href="boys_fac.jsp">Boys</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.jsp"><span class="glyphicon glyphicon-earphone"></span> Contacts</a></li>
                    <li style="float:right"><a href="map.jsp"><span class="glyphicon glyphicon-globe"></span> Map</a></li>
                </ul>
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
                
               <!--  <div style="float:right; color:white;padding-top: 10px;">
                	LOGIN
                </div> -->
        </nav>

<div class="container container-sm border" style=""> 
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
 <br>
 <br>   
	
  
 <div class="panel panel-default " style="text-align: center;">
 <div class="panel-heading panel-heading-sm" style="background-color:#18192f;color:white;"><h1>WELCOME</h1></div>
    <div class="panel-body">
        <!-- <header>
	        <h2><span class="welcome">Welcome</span></h2>
        </header> -->
        <hr style="width:5px;height:5px;">
        <p class="welcome-description" style="font-family: 'Roboto', sans-serif;font-size: 14px;">
        
The institute has 5 boys' hostel within the campus and presently there are two girls' 
hostels in the campus and proposal for one more of 200 seater is also in process. 
The institute also manages one additional girls' hostel adjacent to campus.
 A 60-seat girls' hostel is under construction adjacent to existing girls hostel within the campus. 
 A plan for construction of a new hostel block for boys is under process.
 Each hostel is self-contained with amenities such as common room and a dining hall with mess.
 All the hostel rooms are adequately furnished. Each hostel has a capacity to house about 
 100 inmate students. Administrative head of each hostel, the warden, is a senior faculty member. 
 Additionally, one caretaker/matron for each hostel exists to manage the day-to-day affairs
 of the hostel. Each hostel has different students working committees, mess committee,
 magazine committee, games committee, cleanliness committee etc. Each committee is responsible
 for specific aspects of hostel affairs. Separate hostel administrative section exists in
 the institute to manage the hostel matters. Two hostel blocks of 100 seat each,
 for the boys will be available for the first semester students and will be allotted 
 on the basis of the merit. Lists for hostel admission will be declared after receiving 
 the hostel admission forms by the hostel administration.
 	</p>

    </div>
</div>
  
<!-- ANNOUNCEMENT --> 
<div class="container" style="text-align: center;">
<header class="container announcement-sm">
	<h1 style="font-family: 'Open Sans', sans-serif;">ANNOUNCEMENT</h1>
</header>
<hr>
 <div class="panel-group" id="accordion">
 <div class="row" style="max-height: 400px;padding: 10px;">
 <div class="col-md-4">
  <div class="panel panel-default">
    <div class="panel-heading" style="background-color: #18192f;">
      <h4 class="panel-title" style="font-family: 'Noto Sans', sans-serif;color:white;">BOYS</h4>
    </div>
    <div id="collapse1" class="panel-collapse">
      <div class="panel-body panel-sm panel-max-size" >
      	<ul class="infolist" style="color:black">
      			</ul>
      </div>
    </div>
  </div>
  </div>
  <div class="col-md-4">
  <div class="panel panel-default">
    <div class="panel-heading " style="background-color: #18192f;">
      <h4 class="panel-title" style="font-family: 'Noto Sans', sans-serif;color:white;">GIRL</h4>
    </div>
    <div id="collapse2" class="panel-collapse">
      <div class="panel-body panel-sm panel-max-size">
     
      <marquee behavior="scroll" scrollamount="2"  direction="up" onmouseover="this.stop();"onmouseout="this.start();" >
      <%
    String fileName=null;
  Properties prop = new Properties();
 	InputStream input = null;
 	input = new FileInputStream("E:\\my_notices.properties");
 	try{
 	 prop.load(input); 
	 Enumeration<?> e = prop.propertyNames();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			if(key.contains("\\")){
				key.replaceAll("\\"," ");
			}
			String value = prop.getProperty(key);
			%> <br> <span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp; <a href="noticeDownload?name=<%=key%>"><%=value %></a>
	<%	}

 	}catch(Exception e){
 		e.printStackTrace();
 	}finally{
 		input.close();
 	}
   
 %>
   <br>
 </marquee>
      	
      </div>
    </div>
  </div>
  </div>
  <div class="col-md-4">
  <div class="panel panel-default">
    <div class="panel-heading" style="background-color: #18192f;">
      <h4 class="panel-title" style="font-family: 'Noto Sans', sans-serif;color:white;">COMMON</h4>
    </div>
    <div id="collapse3" class="panel-collapse">
      <div class="panel-body panel-sm panel-max-size">
      <ul class="infolist" style="color:black">
      		</ul>
      </div>
    </div>
  </div>
  </div>
  </div><!-- row -->
</div>   
</div>  


</div><!-- container -->

      

  <jsp:include page="footer.jsp" />	



