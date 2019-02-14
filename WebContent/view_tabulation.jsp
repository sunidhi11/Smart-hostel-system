<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>

    <%@ include file="adminHeader.jsp" %>

<style type="text/css">

 .alert{
   height:50px;
 }
</style>

<body>

 	
<div class="container container-sm border"> 
<div class="container">
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans',sans-serif;">SELECTED STUDENTS TABULATION</h1>
	</header><hr>
  <div class="panel-body" id="accordion">
    <div class="well">

 <div style="background-color: #e0d8d866;">
 <form action="tabulationController" method="post">
 <table>
 <tr><td><br>Course : </b><select style="padding-right: 114px;" name="course" class="form-control" required>
          <option disabled selected="selected">Select</option>
          <option value="M-Tech">M-Tech</option>
          <option value="B-Arch">B-Arch</option>
          <option value="B-Tech">B-Tech</option>
          <option value="MCA">MCA</option>
          </select></td>
        <td><br><b>Semester:</b><select name="sem" style="padding-right: 120px; " class="form-control" required>
            <option disabled selected="selected">Select</option>
          <option value="1">1</option>
          <option value="2">2</option>
         <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
         <option value="6">6</option>
           <option value="7">7</option>
          <option value="8">8</option> 
  </select> </td>
  <td><br> <button class="button btn btn-success" type="submit"> Show </button></td>
  </tr>
 </table></form><br></div>

    
    
<%if(session.getAttribute("msg")!=null) {%>
	<div class="alert alert-danger alert-dismissable">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <h5>Please fill out the required field</h5>
  <%session.removeAttribute("msg"); %>
</div><hr><br>
<%}%>
    
<% if(session.getAttribute("list")!=null){
	  Map<String,Integer> selectedList = (Map<String,Integer>)session.getAttribute("list");
	  Map<String,Integer> totalList = (Map<String,Integer>)session.getAttribute("list1");
	       %>
	<hr> <table  class="table" align="center" width="80%">
	  <thead class="thead-dark">
	 <tr><th>BRANCH </th>
	     <th>NO OF APPLICANT</th>
	     <th>NO OF SELECTED STUDENT</th>
	 </tr></thead>
	 
	 <% for(Map.Entry<String,Integer> entry : totalList.entrySet()){ %>
		<tr><td> <%=entry.getKey() %></td>
		     <td> <%=entry.getValue() %></td>
		     <td> <%=selectedList.get(entry.getKey()) %></td>
			</tr>  
	<%  }
} 
session.removeAttribute("list");
session.removeAttribute("list1");
%>

</table></div></div></div>
<%@include file="footer.jsp" %>

