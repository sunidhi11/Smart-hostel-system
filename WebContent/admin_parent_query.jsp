<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="adminHeader.jsp" />
<title>Parent Query ::Faculty </title>
<%@page 
	import="java.util.*" 
	import="java.sql.*"
	import="sis.com.*"
	import="sis.com.controller.*" 
	import="sis.com.dao.*"
	import="sis.com.dao.impl.*"
	import="sis.com.bo.*"
	import="sis.com.daoFactory.*"
	import="java.text.SimpleDateFormat"
%>    
<%
	List<ComplainQuery> listOfCQ = null;
	AdminDao adminDao = DaoFactory.getAdminDao();
	listOfCQ = adminDao.getAllComplain(0L);
%>

<!-- CONTAINER START -->
<div class="container container-sm border" >
	<header class="container announcement-sm" style="text-align: center;">
		<h1 style="font-family: 'Open Sans', sans-serif;">PARENTS COMPLAIN AND QUERY</h1>
	</header>
	<hr>
	<div class="panel-group container" id="accordion">
		<div class="well">
			<table class="table table-bordered table table-hover table table-striped">
    		<thead>
	    		<th class="col-md-1">QUERY ID</th>
	    		<th class="col-md-1">PARENT ID</th>
	    		<th class="col-md-2">DATE</th>
	    		<th class="col-md-5">SUBJECT</th>
	    		<th class="col-md-1">VIEW</th>
	    		<th class="col-md-1">REPLY</th>
	    		<th class="col-md-1">DELETE</th>
    		</thead>
    		<tbody>
    		<%for(ComplainQuery c: listOfCQ) {%>
    			<tr>
    				<td><%=c.getQueryId() %></td>
    				<td><%=c.getParentId() %></td>
    				<%
    				java.util.Date date =new java.util.Date(c.getDate().getTime());
    				SimpleDateFormat sdf = new SimpleDateFormat("d MMM, yyyy");
    				String d = sdf.format(date);
    				%>
    				<td><%=d%></td>
    				<td><%=c.getSubject() %></td>
    				<td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#<%="Q"+c.getQueryId()%>">VIEW</button></td>
    				<td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#<%="A"+c.getQueryId()%>">REPLY</button></td>
   					<td><a href="delete?queryId=<%=c.getQueryId()%>"><button type="button" class="btn btn-danger" ">DELETE</button></a></td>
    				
    				<!-- Modal -->
	    			<div id="<%="Q"+c.getQueryId()%>" class="modal fade" role="dialog">
					  <div class="modal-dialog modal-lg">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">SUBJECT::&nbsp<b><%=c.getSubject() %></b></h4>
					      </div>
					      <div class="modal-body">
					        <p><%=c.getMessage() %></p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					<div id="<%="A"+c.getQueryId()%>" class="modal fade" role="dialog">
					  <div class="modal-dialog ">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">REPLY TO::&nbsp<b><%=c.getParentId() %></b></h4>
					      </div>
					      <div class="modal-body">
					        <p>
					        
					        <form class="form-signin" action="AdminReplyController" method="post">       
						      <input type="text" class="form-control" name="message"  placeholder="Write something here" required="" autofocus="" />
						      <input type="hidden" name="queryId" value="<%=c.getQueryId()%>" />
						      <input type="hidden" name="sourceId" value="1" />
						      <input type="hidden" name="destinationId" value="<%=c.getParentId()%>" />
						      <input type="hidden" name="subject" value="<%=c.getSubject()%>" />
						      <br>
						      <button type="submit" class="btn btn-success">SEND &nbsp<span class="glyphicon glyphicon-send"></span></button>   
						    </form>
					        
					        
					        </p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
					
					
					<!-- Modal -->
    				
    			</tr>
    			<%} %>
    		</tbody>
    	</table>
		</div>
	</div>	

    
</div>
<!-- CONTAINER END -->
<jsp:include page="footer.jsp"/>