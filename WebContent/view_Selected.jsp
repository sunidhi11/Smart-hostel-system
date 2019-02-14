
    <%@page import="java.util.*" %>
    <%@page import="sis.com.bo.*" %>
    <%@ include file="adminHeader.jsp" %>

<style type="text/css">


  .big{ width: 2.5em; height: 1.5em;}
.alert{
       height:50px;
     }
  .showH{
       text-align: center;
       font-weight: bold;
       font-family: 
  }
</style>
<body>
<div class="container container-sm border"> 
<div class="container">
	<header class="announcement-sm" style="text-align: center;">
		<span style="font-family: 'Open Sans',sans-serif;"><h1>SELECTED STUDENTS </h1></span>
	</header>
	<hr>
	 <div class="panel-body" id="accordion">
    <div class="well">
 <div class="col-sm-6">
  <form action="selectedStudentContoller" method="post"> 
  <input class="big" type="radio" name="hostel" value="E">Hostel-E
  <input class="big" type="radio" name="hostel" value="G">Hostel-G
  <input class="big" type="radio" name="hostel" value="PG">Hostel-PG
 <span style="float:right"><button class="button btn btn-success" type="submit">Show Selected</button></span>
  </form>
</div>

<span style="float:right">
<a href="convertToPDF.jsp">
<button class="button btn btn-default">
<span class="glyphicon glyphicon-save"></span>Convert to PDF</button>
</a>
 </span>
 
  <br><hr>
  <% if(session.getAttribute("stuList")!=null){
	ArrayList<RegStudent> show= (ArrayList<RegStudent>)session.getAttribute("stuList");%>
	<div class="alert alert-success alert-dismissable">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   <h5><%=show.size() %> Records Selected</h5>
</div>
	<%if(show.size()>0){ %>
	<u> <h3 class="showH"> Hostel-<%=session.getAttribute("hostel") %></h3></u>
 <br><div  style="overflow-x:auto;">
	 <table class="table table-striped">
   <thead>
    <tr>
       <th>ID</th>
        <th>Roll no</th>
        <th>Name</th>
        <th>Course</th>
        <th>Branch</th>
        <th>Semester</th>
        <th>Cgpa</th>
        <th>Hostel</th>
        <th>Mobile no</th>
        <th>Category</th>
        <th>Date Of Birth</th>
        <th>Email-id</th>
                </tr>
    </thead>
<tbody>
	<% 
	int count=0;
	for(RegStudent w:show){%>
	<tr>
	<td>	<%=++count%></td>
	     <td><%=w.getRollno() %></td>
		<td><%=w.getName() %></td>
	<td>	<%= w.getCourse()%></td>
	<td>	<%= w.getBranch()%></td>
    <td>    <%=w.getSemester() %></td>
	<td>	<%=w.getCgpa() %></td>
	<td>	<%=w.getHostel() %></td>
	<td>	<%=w.getMobileno() %></td>
	<td>	<%= w.getCategory()%></td>
	<td>	<%= w.getBirth()%></td>
	<td>	<%= w.getEmail()%></td>
         </tr>
         <% }  
	} }  
	
	%></tbody></table></div>
         
  

 </div>
  </div></div>
  <script type="text/javascript">

  function convertToPDF() {
      window.print();
  }

  </script>
  <br>
<%@include file="footer.jsp" %>
