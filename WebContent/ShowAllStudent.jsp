 <%@include file="adminHeader.jsp" %>
   <title>Student Details</title>

 <!-- 
    <form action="ShowStudentController" method="post">
    <button class="btn btn-link" type="submit" value="Student" style="color:white;">show</button>
   </form> -->
     
   <% if(session.getAttribute("isdelete")!=null) {
    	boolean isdelete= (Boolean)session.getAttribute("isdelete");
    if(isdelete==true){%>
    <div class="alert alert-success alert-dismissable fade in">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong>sucessfully deleted.
  <%}if(isdelete==false){%>
  <div class="alert alert-success alert-dismissable fade in">
     <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Ohhh!</strong>deletion problem.<%}%>
</div>

    <%session.removeAttribute("isdelete");}%>    
   
<div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENTS DETAIL</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">



 <table class="table table-bordered table table-hover table table-striped">
    <thead>
      <tr>
        <th>HostelId</th>
        <th>Name</th>
        <!-- <th>RoomNo</th> -->
        <!-- <th>Image</th> -->
        <th>View More</th>
        <th>Delete</th>
      </tr>
    </thead>
   
     <tbody>
      <% if(session.getAttribute("stulist")!=null){
      List<Student> stuList=(List<Student>)session.getAttribute("stulist");
      
      for(Student student:stuList){%>
      <tr>
        <td><%=student.getHostelId()%></td>
        <td><%=student.getName()%></td>
        <%-- <td><%=student.getRoomno()%></td> --%>
      <td><a href='ViewStudentController?id=<%=student.getHostelId()%>&flag_admin=1&flag_student=0' style="color:blue;"> <span class="glyphicon glyphicon-eye-open" aria-hidden="true">view</span></a></td>
	 <td> <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="myFunction(this.id)" id="<%=student.getHostelId()%>" value="DeleteStudentController?id=<%=student.getHostelId()%>"><span class="glyphicon glyphicon-trash"></span></button></td>
      </tr>
     <%}}%>
    </tbody>
  </table>
<!--     <div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul> -->
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        
                  <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
          
        </div>
        <div class="modal-body">
          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
          
        </div>
        <div class="modal-footer">
       <!--  <a href="" id="toChange" >yes</a> -->
       <a href="" id="toChange" class="btn btn-success"><span class="glyphicon glyphicon-ok-sign"></span> Yes</a> 
         <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
        </div>
      </div>
      
    </div>
  </div> 
  
      
<script type="text/javascript">
function myFunction(a){
	var address = document.getElementById(a).value;
	document.getElementById("toChange").href = address;
	console.log(a);
}
</script>
	</div>  
    </div>
    </div>
    </div>
<jsp:include page="footer.jsp" />    