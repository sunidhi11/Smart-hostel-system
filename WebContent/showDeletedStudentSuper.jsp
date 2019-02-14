<%@include file="header.jsp" %>
<title>SUPER ADMINISTRATION :: HOME</title>

<div class="container container-sm border" style="">
	 
	 
	  <div class="container" >
	  <header class="container announcement-sm" style="text-align: center;">
	  <h1>STUDENTS DETAIL</h1>
	  </header>
 <hr>
 
<div class="panel-group" id="accordian">
<div class="well">
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


 <table class="table table-bordered table table-hover table table-striped">
    <thead>
      <tr>
        <th>HostelId</th>
        <th>Name</th>
        <th>Restore</th>
        <th>Delete</th>
      </tr>
    </thead>
    <% StudentDao dao=DaoFactory.getStudentDao();
	List<Student> stuList= dao.ShowAllDeletedByAdminStudent();
	if(stuList!=null){%>
    <tbody>
    <% for(Student student:stuList){
    %>
      <tr>
        <td><%=student.getHostelId()%></td>
        <td><%=student.getName()%></td>
        <form action="RestoreController" method="Get">
        <input type="hidden" name="id" value=<%=student.getHostelId()%>>
 <td> <button type="submit" class="btn btn-danger btn-md">Restore</button></td>
       	</form>
       	 <td> <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="myFunction(this.id)" id="<%=student.getHostelId()%>" value="HardDeleteController?id=<%=student.getHostelId()%>"><span class="glyphicon glyphicon-trash"></span></button></td>
       
        <% }}%>
    
    </tbody>
    
    </table>
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
<%@include file="footer.jsp" %>