<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="commonHeader.jsp"/>
<%@page import="sis.com.util.SisDbUtil"%>
<%@page import="java.sql.*" %>


<style>
#percentage{
   float:right;
}

.glyphicon-star{ color:#efb610;
 }
 .col-sm-6{   padding:30px;
             background-color: #f3d27f12;
 }
 h4{ font-family: Century;
    font-weight: bold;
  }
  
</style>



<%
Connection con=null;
ResultSet rs=null;
Statement pstmt = null;
String sql1=null;
int total_feedback =0;
float food_exe = 0;
float food_good = 0;
float food_avg=0;
float food_poor=0;
float food_terrible =0;

float clean_exe = 0;
float clean_good = 0;
float clean_avg=0;
float clean_poor=0;
float clean_terrible =0;

float maintain_exe = 0;
float maintain_good = 0;
float maintain_avg=0;
float maintain_poor=0;
float maintain_terrible =0;


float staff_exe = 0;
float staff_good = 0;
float staff_avg=0;
float staff_poor=0;
float staff_terrible =0;

float security_exe = 0;
float security_good = 0;
float security_avg=0;
float security_poor=0;
float security_terrible =0;

try{
	con=SisDbUtil.getConnection();
	String sql= "select count(*) from feedback";
	pstmt = con.createStatement();
	rs = pstmt.executeQuery(sql);
	while(rs.next()){
		total_feedback = rs.getInt(1);
	}
	 System.out.println(total_feedback);
	 //food
 sql1 = "select count(feedbackId) from feedback where food ='excellent'";
	pstmt = con.createStatement();
	 rs = pstmt.executeQuery(sql1);
	while(rs.next()){
		food_exe = rs.getInt(1);
	}
	food_exe = (food_exe/total_feedback)*100;
    
   	sql1 = "select count( feedbackId) from feedback where food = 'Good'";
   	pstmt = con.createStatement();
   	ResultSet rs2 = pstmt.executeQuery(sql1);
	while(rs2.next()){
		food_good = rs2.getInt(1);
	}
	System.out.println(food_good);
	food_good = (food_good/total_feedback)*100;
    sql1 = "select count(*) from feedback where food = 'Average'";
    pstmt = con.createStatement();
	rs = pstmt.executeQuery(sql1);
	while(rs.next()){
		food_avg = rs.getInt(1);
	}
	food_avg = (food_avg/total_feedback)*100;
	sql1 = "select count(*) from feedback where food = 'Poor'";
	pstmt = con.createStatement();
	rs = pstmt.executeQuery(sql1);
	while(rs.next()){
		food_poor = rs.getInt(1);
	}
	food_poor = (food_poor/total_feedback)*100;
	 sql1 = "select count(*) from feedback where food = 'Terrible'";
	 pstmt = con.createStatement();
		rs = pstmt.executeQuery(sql1);
	while(rs.next()){
		food_terrible = rs.getInt(1);
	}
	food_terrible = (food_terrible/total_feedback)*100;
	 
	 //clean
	 sql1 = "select count(feedbackId) from feedback where clean ='excellent'";
		pstmt = con.createStatement();
		 rs = pstmt.executeQuery(sql1);
		while(rs.next()){
			clean_exe = rs.getInt(1);
		}
		clean_exe = (clean_exe/total_feedback)*100;
	    
	   	sql1 = "select count( feedbackId) from feedback where clean = 'Good'";
	   	pstmt = con.createStatement();
	   	 rs2 = pstmt.executeQuery(sql1);
		while(rs2.next()){
			clean_good = rs2.getInt(1);
		}
		clean_good = (clean_good/total_feedback)*100;
	    sql1 = "select count(*) from feedback where clean = 'Average'";
	    pstmt = con.createStatement();
		rs = pstmt.executeQuery(sql1);
		while(rs.next()){
			clean_avg = rs.getInt(1);
		}
		clean_avg = (clean_avg/total_feedback)*100;
		sql1 = "select count(*) from feedback where clean = 'Poor'";
		pstmt = con.createStatement();
		rs = pstmt.executeQuery(sql1);
		while(rs.next()){
			clean_poor = rs.getInt(1);
		}
		clean_poor = (clean_poor/total_feedback)*100;
		 sql1 = "select count(*) from feedback where clean = 'Terrible'";
		 pstmt = con.createStatement();
			rs = pstmt.executeQuery(sql1);
		while(rs.next()){
			clean_terrible = rs.getInt(1);
		}
		clean_terrible = (clean_terrible/total_feedback)*100;
	 
		 

			 
			 //maintance
	 
			 sql1 = "select count(feedbackId) from feedback where maintain ='excellent'";
				pstmt = con.createStatement();
				 rs = pstmt.executeQuery(sql1);
				while(rs.next()){
					maintain_exe = rs.getInt(1);
				}
				maintain_exe = (maintain_exe/total_feedback)*100;
			    
			   	sql1 = "select count( feedbackId) from feedback where maintain = 'Good'";
			   	pstmt = con.createStatement();
			   	 rs2 = pstmt.executeQuery(sql1);
				while(rs2.next()){
					maintain_good = rs2.getInt(1);
				}
				clean_good = (maintain_good/total_feedback)*100;
			    sql1 = "select count(*) from feedback where maintain = 'Average'";
			    pstmt = con.createStatement();
				rs = pstmt.executeQuery(sql1);
				while(rs.next()){
					maintain_avg = rs.getInt(1);
				}
				maintain_avg = (maintain_avg/total_feedback)*100;
				sql1 = "select count(*) from feedback where maintain = 'Poor'";
				pstmt = con.createStatement();
				rs = pstmt.executeQuery(sql1);
				while(rs.next()){
					maintain_poor = rs.getInt(1);
				}
				maintain_poor = (maintain_poor/total_feedback)*100;
				 sql1 = "select count(*) from feedback where maintain = 'Terrible'";
				 pstmt = con.createStatement();
					rs = pstmt.executeQuery(sql1);
				while(rs.next()){
					maintain_terrible = rs.getInt(1);
				}
				maintain_terrible = (maintain_terrible/total_feedback)*100;
				 //security
		 
				 sql1 = "select count(feedbackId) from feedback where staff ='excellent'";
					pstmt = con.createStatement();
					 rs = pstmt.executeQuery(sql1);
					while(rs.next()){
						staff_exe = rs.getInt(1);
					}
					staff_exe = (staff_exe/total_feedback)*100;
				    
				   	sql1 = "select count( feedbackId) from feedback where staff = 'Good'";
				   	pstmt = con.createStatement();
				   	 rs2 = pstmt.executeQuery(sql1);
					while(rs2.next()){
						staff_good = rs2.getInt(1);
					}
					staff_good = (staff_good/total_feedback)*100;
				    sql1 = "select count(*) from feedback where staff = 'Average'";
				    pstmt = con.createStatement();
					rs = pstmt.executeQuery(sql1);
					while(rs.next()){
						staff_avg = rs.getInt(1);
					}
					staff_avg = (staff_avg/total_feedback)*100;
					sql1 = "select count(*) from feedback where staff = 'Poor'";
					pstmt = con.createStatement();
					rs = pstmt.executeQuery(sql1);
					while(rs.next()){
						staff_poor = rs.getInt(1);
					}
					staff_poor = (staff_poor/total_feedback)*100;
					 sql1 = "select count(*) from feedback where staff = 'Terrible'";
					 pstmt = con.createStatement();
						rs = pstmt.executeQuery(sql1);
					while(rs.next()){
						staff_terrible = rs.getInt(1);
					}
					staff_terrible = (staff_terrible/total_feedback)*100;
					 

					 //clean
					 sql1 = "select count(feedbackId) from feedback where security ='excellent'";
						pstmt = con.createStatement();
						 rs = pstmt.executeQuery(sql1);
						while(rs.next()){
							security_exe = rs.getInt(1);
						}
						security_exe = (security_exe/total_feedback)*100;
					    
					   	sql1 = "select count( feedbackId) from feedback where security = 'Good'";
					   	pstmt = con.createStatement();
					   	 rs2 = pstmt.executeQuery(sql1);
						while(rs2.next()){
							security_good = rs2.getInt(1);
						}
						security_good = (security_good/total_feedback)*100;						 						 
					    sql1 = "select count(*) from feedback where security = 'Average'";
					    pstmt = con.createStatement();
						rs = pstmt.executeQuery(sql1);
						while(rs.next()){
							security_avg = rs.getInt(1);
						}
						security_avg = (security_avg/total_feedback)*100;
						sql1 = "select count(*) from feedback where security = 'Poor'";
						pstmt = con.createStatement();
						rs = pstmt.executeQuery(sql1);
						while(rs.next()){
							security_poor = rs.getInt(1);
						}
						security_poor = (security_poor/total_feedback)*100;
						 sql1 = "select count(*) from feedback where security = 'Terrible'";
						 pstmt = con.createStatement();
							rs = pstmt.executeQuery(sql1);
						while(rs.next()){
							security_terrible = rs.getInt(1);
						}
						security_terrible = (security_terrible/total_feedback)*100;
}catch(Exception e){e.printStackTrace();}
 
%>


<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">RATING AND REVIEWS</h1>
	</header><hr>
    <div class="panel-body" id="accordion">
    <div class="well">
    <div class="row">
  <div class="col-sm-6">
  <h4 align="center">FOOD </h4><hr>
<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
<span class="glyphicon glyphicon-star"></span> <div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=food_exe %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=food_exe%>%"> 
    </div> <span id="percentage"><%=food_exe %>% </span>
  </div> 
<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
<div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=food_good %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=food_good%>%">
        </div> <span id="percentage"><%=food_good %>% </span>
        
  </div>
 <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
 <span class="glyphicon glyphicon-star"></span> <div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
     aria-valuenow="<%=food_avg%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=food_avg%>%">
    
    </div> <span id="percentage"><%=food_avg %>% </span>
    
  </div>
 <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
  <div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=food_poor%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=food_poor%>%">
    
    </div> <span id="percentage"><%=food_poor %>% </span>
    
  </div>
 <span class="glyphicon glyphicon-star"></span> 
 <div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=food_terrible%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=food_terrible%>%">
    
    </div> <span id="percentage"><%=food_terrible %>% </span>
    
  </div></div>
    <div class="col-sm-6">
       <h4 align="center">MAINTAINANCE</h4><hr>
   <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span>  <div class="progress">
    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=maintain_exe %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=maintain_exe%>%"> 
    </div> <span id="percentage"><%=maintain_exe %>% </span>
  </div> 
  <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> <div class="progress">
    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=maintain_good %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=maintain_good%>%">
        </div> <span id="percentage"><%=maintain_good %>% </span>
        
  </div>
   <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span>  <div class="progress">
    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar"
     aria-valuenow="<%=maintain_avg%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=maintain_avg%>%">
    
    </div> <span id="percentage"><%=maintain_avg %>% </span>
    
  </div>
  <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>  <div class="progress">
    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=maintain_poor%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=maintain_poor%>%">
    
    </div> <span id="percentage"><%=maintain_poor %>% </span>
    
  </div>
 <span class="glyphicon glyphicon-star"> </span>  <div class="progress">
    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=maintain_terrible%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=maintain_terrible%>%">
    
    </div> <span id="percentage"><%=maintain_terrible %>% </span>
    
  </div> </div></div>
    
    
     <div class="row">
  <div class="col-sm-6">
  <h4 align="center">SECURITY</h4><hr>
   <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span>  <div class="progress">
    <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=security_exe %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=security_exe%>%"> 
    </div> <span id="percentage"><%=security_exe %>% </span>
  </div> 
  <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> <div class="progress">
    <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=security_good %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=security_good%>%">
        </div> <span id="percentage"><%=security_good %>% </span>
        
  </div>
   <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span>  <div class="progress">
    <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar"
     aria-valuenow="<%=security_avg%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=security_avg%>%">
    
    </div> <span id="percentage"><%=security_avg %>% </span>
    
  </div>
  <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>  <div class="progress">
    <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=security_poor%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=security_poor%>%">
    
    </div> <span id="percentage"><%=security_poor %>% </span>
    
  </div>
 <span class="glyphicon glyphicon-star"> </span>  <div class="progress">
    <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=security_terrible%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=security_terrible%>%">
    
    </div> <span id="percentage"><%=security_terrible %>% </span>
    
  </div>
</div>
   <div class="col-sm-6">
   
  <h4 align="center">CLEANLINESS </h4><hr>
 <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=clean_exe %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=clean_exe%>%"> 
    </div> <span id="percentage"><%=clean_exe %>% </span>
  </div> 
  <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
  <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=clean_good %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=clean_good%>%">
        </div> <span id="percentage"><%=clean_good %>% </span>
        
  </div>
  <span class="glyphicon glyphicon-star"> </span><span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
   <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
     aria-valuenow="<%=clean_avg%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=clean_avg%>%">
    
    </div> <span id="percentage"><%=clean_avg %>% </span>
    
  </div>
  <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span> 
   <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=clean_poor%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=clean_poor%>%">
    
    </div> <span id="percentage"><%=clean_poor %>% </span>
    
  </div>
 <span class="glyphicon glyphicon-star"> </span>  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=clean_terrible%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=clean_terrible%>%">
    
    </div> <span id="percentage"><%=clean_terrible %>% </span>
    
  </div></div></div>
   
    <div class="row">
  <div class="col-sm-6">
  <h4 align="center">STAFF </h4><hr>
 <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> 
 <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=staff_exe %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=staff_exe%>%"> 
    </div> <span id="percentage"><%=staff_exe %>% </span>
  </div> 
  <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
  <span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=staff_good %>" aria-valuemin="0" aria-valuemax="100" style="width:<%=staff_good%>%">
        </div> <span id="percentage"><%=staff_good %>% </span>
        
  </div>
  <span class="glyphicon glyphicon-star"> </span><span class="glyphicon glyphicon-star"></span> <span class="glyphicon glyphicon-star"></span> 
   <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
     aria-valuenow="<%=staff_avg%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=staff_avg%>%">
    
    </div> <span id="percentage"><%=staff_avg %>% </span>
    
  </div>
  <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span> 
   <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=staff_poor%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=staff_poor%>%">
    
    </div> <span id="percentage"><%=staff_poor %>% </span>
    
  </div>
 <span class="glyphicon glyphicon-star"> </span>  <div class="progress">
    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" 
    aria-valuenow="<%=staff_terrible%>" aria-valuemin="0" aria-valuemax="100" style="width:<%=staff_terrible%>%">
    
    </div> <span id="percentage"><%=staff_terrible %>% </span>
    
  </div>
  
  
  </div></div>
   <div class="row">
  <div class="col-sm-4">
 
  <% 
     try{
    	 String sql = "select Stu_name,hostelId,message,rating,dof from feedback order by dof desc";	 
    pstmt = con.createStatement();
 	rs = pstmt.executeQuery(sql);
 	while(rs.next()){
 		%>
 	<br><div class="row">
  <hr><div class="col-sm-4"> 
  <img src="ViewImageController?id=<%=rs.getInt("hostelId")%>&name=image1" class="img-circle" width="70px" height="70px">
    <%=rs.getString("Stu_name")%>   
  </div>
  <div class="col-sm-8">
      <b>Hostel ID : </b> <%=rs.getInt("hostelId")%><br>
 		<b>Rating : </b> <%int rate =rs.getInt("rating");
 		             if(rate==5){ 
 		           for(int i=0;i<5;i++)
 		        	%><span class="glyphicon glyphicon-star"></span><%
 		            } else if(rate==4) {
 		            	 for(int i=0;i<4;i++)
 		 		        	%><span class="glyphicon glyphicon-star"></span><%
 		            }else if(rate==3){
 		            	 for(int i=0;i<3;i++)
  		 		        	%><span class="glyphicon glyphicon-star"></span><%
 		            }	
 		             else if(rate==2){
 		         %><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><%	 
 		             }
 		             else	{
 		     %><span class="glyphicon glyphicon-star"></span><%   	 
 		             } 
 		%><br>
 		<b><%=rs.getString("message") %></b>
 		<br><b>Dated : </b> <%=new Date((rs.getTimestamp("dof")).getTime()) %>
  </div></div>
 	<% }
}catch(Exception e){e.printStackTrace();}
finally{SisDbUtil.closeConnection(con);}%>
  
  </div>

</div>
</div></div></div>
</div>
<%@include file="footer.jsp" %>
