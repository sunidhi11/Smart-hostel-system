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
<title>Confirm Leave</title><meta charset="utf-8">
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
<body data-spy="scroll" data-target=".navbar" data-offset="186">

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
                            <li><a href="#">A(MAINPAT)</a></li>
                            <li><a href="#">B(CHITRAKOT)</a></li>
                            <li><a href="#">C(TIRATHGARH)</a></li>
                            <li><a href="#">D(MALHAR)</a></li>
                            <li><a href="#">H(SIRPUR)</a></li>
                            <li><a href="#">F(KOTUMSAR)</a></li>
                            <li class="dropdown-header">GIRLS HOSTEL</li>
                            <li><a href="#">E</a></li>
                            <li><a href="hostelG.jsp">G</a></li>
                            <li><a href="#">PG</a></li>
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
  
 <div class="panel panel-default " style="text-align: center;">
 <div class="panel-heading panel-heading-sm" style="background-color:#18192f;color:white;"><h1>CONFIRM</h1></div>
    <div class="panel-body">
        <hr style="width:5px;height:5px;">
        <p class="welcome-description" style="font-family: 'Roboto', sans-serif;font-size: 54px;">Your link confirmation is successful!</p>

    </div>
</div>
</div><!-- container -->

      
<%@include file="footer.jsp" %>
  <%-- <jsp:include page="footer.jsp" /> --%>	



